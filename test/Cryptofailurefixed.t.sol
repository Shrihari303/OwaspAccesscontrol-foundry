pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/Cryptofailurefixed.sol";

contract Testcryptofailurefixed is Test{
    cryptofixed public fixedcontract;

    function setUp()public{
        fixedcontract = new cryptofixed("_privatekey");
    }

    function testkeycannotreaddirect() public {
        //fixedcontract.hashkey() would fail ir we try to read directly
        //instead we can verify
        bool isCorrect = fixedcontract.verifykey("_privatekey");
        assertTrue(isCorrect);

        bool isWrong = fixedcontract.verifykey("hacker");
        assertFalse(isWrong);    
    }    
}