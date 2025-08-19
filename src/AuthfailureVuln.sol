// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract authfailurevuln{
    mapping(address => uint256) public balances;

    // anyone can mint the token 
    function mint(uint256 _amt)public{
        balances[msg.sender] += _amt;
    }
}
