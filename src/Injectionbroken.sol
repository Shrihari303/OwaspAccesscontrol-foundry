// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Injectionbroken{
    address public owner;

    constructor(){
        owner = msg.sender;
    }
    
    function execute(address target, bytes calldata data) external {
        require(msg.sender== owner, "only owner can execute the function");
        (bool success,) = target.call(data);
        require (success,"call failed");
    }
}