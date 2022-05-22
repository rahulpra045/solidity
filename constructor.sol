// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract local{
    uint public count;

    constructor(uint new_count)
    {
        count = new_count;
    }


}
//we have to pass argument during deploying the contract
//constructor -- executed only once
//you can create only one constructor and that is optional
//a deafault constructor is created by the compiler if there is no explicity defined construcotr -- no use
