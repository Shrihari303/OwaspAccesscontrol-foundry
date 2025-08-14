// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Injectionfixed{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function safeexecute(address target,bytes4 selector,bytes calldata args)external{
        require(msg.sender == owner,"only owner can execute the function");
        require(selector == bytes4(keccak256("transfer(address,uint256)")),"function not allowed");
        (bool success,) = target.call(abi.encodePacked(selector,args));
        require(success,"call failed");
    }   
}