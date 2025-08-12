pragma solidity ^0.8.26;

contract cryptofixed{
    bytes32 private hashkey;

    constructor(string memory _privatekey){
        hashkey = keccak256(abi.encodePacked(_privatekey));
    } 

    function verifykey(string memory _key) public view returns(bool) {
        return hashkey == keccak256(abi.encodePacked(_key));
    }   
}