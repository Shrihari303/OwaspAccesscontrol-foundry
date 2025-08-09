// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AccesscontrolBroken{
    address public owner;

    function changeowner(address _owner)public{
        // no accesscontrol ,anyone can call this function
        owner = _owner;
    }
}


