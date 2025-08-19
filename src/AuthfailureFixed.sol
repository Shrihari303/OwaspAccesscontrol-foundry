// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract AuthfailureFixed is Ownable {

    mapping(address => uint256) public balances;

        constructor() Ownable(msg.sender){}

    // only the owner can mint the token
    function mint(uint256 _amt) public onlyOwner {
        balances[msg.sender] += _amt;
    }

    // function to check balance of an address
    function checkBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }
}



