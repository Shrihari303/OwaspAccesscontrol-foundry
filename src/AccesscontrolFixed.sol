pragma solidity ^0.8.26;

contract Accesscontrolfixed{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function changeowner(address _newowner)public{
        require(msg.sender == owner,"only owner has the access");
        owner = _newowner;
    }
}