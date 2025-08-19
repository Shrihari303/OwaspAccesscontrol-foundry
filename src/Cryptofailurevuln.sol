pragma solidity ^0.8.26;

contract Cryptofailurevuln{
    // storing the privatekey in the plain text 
    string public privatekey;
    constructor(string memory _privatekey){
        privatekey = _privatekey;
    }

    function getprivatekey()public view returns(string memory){
        return privatekey;
    }
    //The privateKey is public in storage, so anyone can see it by reading blockchain data (even without calling getPrivateKey()).

}
