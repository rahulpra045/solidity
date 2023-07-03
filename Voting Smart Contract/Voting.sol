// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Topic {
        address creator;
        string topicName;
        uint256 expiryTime;
        mapping(address => bool) voters;          //to keep track of voters
        mapping(uint256 => uint256) voteCounts;  // count number of votes
        string[] options;
    }

    mapping(uint256 => Topic) public topics;
    uint256 public topicCounter;              //variable to track no. of topics so far

    event TopicCreated(uint256 indexed topicId, string topicName);
    event VoterRegistered(uint256 indexed topicId, address voter);
    event VoteCasted(uint256 indexed topicId, address voter, uint256 optionIndex);
    event VotingExpired(uint256 indexed topicId);

    modifier onlyTopicCreator(uint256 _topicId) {
        require(msg.sender == topics[_topicId].creator, "Only the topic creator can perform this action.");
        _;
    }

    modifier onlyRegisteredVoter(uint256 _topicId) {
        require(topics[_topicId].voters[msg.sender], "Only registered voters can perform this action.");
        _;
    }

    modifier beforeExpiry(uint256 _topicId) {
        require(block.timestamp < topics[_topicId].expiryTime, "Voting has expired for this topic.");
        _;
    }

    function createTopic(string memory _topicName, uint256 _expiryTime) public {
        topics[topicCounter].creator = msg.sender;
        topics[topicCounter].topicName = _topicName;
        topics[topicCounter].expiryTime = _expiryTime;
        topics[topicCounter].options = new string[](0);
        emit TopicCreated(topicCounter, _topicName);     // indicates new topic has been created & can be track in list
        topicCounter++;
    }

    function createOptions(uint256 _topicId, string[] memory _options) public onlyTopicCreator(_topicId) beforeExpiry(_topicId) {
        Topic storage topic = topics[_topicId];
        for (uint256 i = 0; i < _options.length; i++) {
            topic.options.push(_options[i]);
        }
    }

    function registerVoter(uint256 _topicId) public beforeExpiry(_topicId) {
        Topic storage topic = topics[_topicId];
        topic.voters[msg.sender] = true;
        emit VoterRegistered(_topicId, msg.sender);             //indicates voter has been registered & can be track in list
    }

    function castVote(uint256 _topicId, uint256 _optionIndex) public onlyRegisteredVoter(_topicId) beforeExpiry(_topicId) {
        Topic storage topic = topics[_topicId];
        require(_optionIndex < topic.options.length, "Invalid option index.");
        topic.voteCounts[_optionIndex]++;
        emit VoteCasted(_topicId, msg.sender, _optionIndex);    //indicates address voted successfully & can be track in list
    }

    function getVoteCounts(uint256 _topicId) public view returns (uint256[] memory) {
        Topic storage topic = topics[_topicId];
        uint256[] memory counts = new uint256[](topic.options.length);        //creates dynamic array to store vote count
        for (uint256 i = 0; i < topic.options.length; i++) {
            counts[i] = topic.voteCounts[i];
        }
        return counts;
    }

    function expireVoting(uint256 _topicId) public onlyTopicCreator(_topicId) {
        Topic storage topic = topics[_topicId];
        require(block.timestamp >= topic.expiryTime, "Voting has not expired yet.");
        emit VotingExpired(_topicId);   //indicating that the voting for a specific topic has expired
    }
}
