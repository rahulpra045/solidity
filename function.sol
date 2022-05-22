// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract local
{
    uint age =10;                        // if we create state variable public then we dont have to create getter function , it will auto created 

    function getter() public view returns(uint)   //view and pure used when we dont want to change the state variable
    {
        return age;
    }

    function setter() public
    {
        age = age+1;
    }
    function setter(uint newage) public     //argument can be pass newage will store in age
    {
        age = newage;
    }
}

//for getter we dont have to pay gas value while for setter as we r changing the variable we have to pay gas value
