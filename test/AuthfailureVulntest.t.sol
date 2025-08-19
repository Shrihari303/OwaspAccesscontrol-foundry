// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../src/AuthfailureVuln.sol";
import "forge-std/Test.sol";

contract testAuthfailurevuln is Test{
    authfailurevuln vuln;
    address attacker = address(0xBEEF);

    function setUp() public{
        vuln  = new authfailurevuln();   
    }

    function testanyonecanmint()public{
        vm.prank(attacker);
        vuln.mint(1000);

        assertEq(vuln.balances(attacker),1000,"Attacker should be able to mint tokens");
    }    
}
