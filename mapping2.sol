// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0; 

// contract Map
// {
//     mapping(uint=>string) public roll_no;

//     function setter(uint keys, string memory value) public
//     {
//         roll_no[keys] = value;
//     }
// }

contract Map
{
    struct Student{
        string name;
        uint class;
    }

    mapping(uint=>Student) public data;

    function setter(uint _roll, string memory _name, uint _class) public
    {
        data[_roll] = Student(_name, _class);
    }
}

