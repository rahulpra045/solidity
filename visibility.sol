// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract A
{
    function f1() public pure returns(uint)
    {
        return 1;
    }
    function f2() private pure returns(uint)
    {
        return 2;
    }
    function f3() internal pure returns(uint)
    {
        // uint x=f4(); //1.
        return 3;
    }
    function f4() external pure returns(uint)
    {
        return 4;
    }
}

//1. we cant call external function within the contract

contract B is A
{ 
    // uint public bx = f2(); //2.
    uint public by = f1(); 
    uint public bz = f3(); 
    // uint public bw = f4(); //3.
}

//2. private only visible within the contract and not derived
//3. f4 is private so can't call within contract B as B is A (inheritance)

contract C
{
    A obj = new A();
    uint public cx = obj.f4();
}
