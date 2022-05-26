//SPDX-License-Identifier: UNLICENSED

pragma solidity >= 0.8.0;

contract Helloworld {
string  mssg;
      constructor() 
    {
        mssg="Hello World";
        
    }
  function message() view public returns(string memory){
      
      return mssg;
  }
  function update() public {
      mssg = "Hello Rahul";
  }
}
