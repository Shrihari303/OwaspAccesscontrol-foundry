pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/Cryptofailurevuln.sol";

contract testcryptofailurevuln is Test{
    Cryptofailurevuln public vulnerable;

    function setUp()public{
        vulnerable = new Cryptofailurevuln("my-secret-key"); 
    }

    function testprivatekeyexposed()public{
        string memory leadkey = vulnerable.getprivatekey();
        emit log_string(leadkey);
        assertEq(leadkey,"my-secret-key");
    }    
}