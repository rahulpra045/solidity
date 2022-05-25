// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract Enum
{
    enum user{allowed, not_allowed, wait}

    user public u1 = user.allowed;
    user public u2 = user.not_allowed;
    user public u3 = user.wait;
    uint public lottery = 1000;
    function owner() public
    {
        if(u1==user.allowed)
        {
            lottery = 0;
        }
    }

    function changeOwner() public
    {
        u1 = user.not_allowed;
    }
}

// enum is used when we assign name to integers
// is used where set is small
