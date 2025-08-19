pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/AccesscontrolFixed.sol";

contract AccesscontrolfixedTest is Test{
    Accesscontrolfixed testfixed;
    address attacker = address(0xBEEF);
    address newowner = address(0xCAFE);

    function setUp()public {
        testfixed = new Accesscontrolfixed();
    }

    function testownercanchangeowner()public{
        testfixed.changeowner(newowner);
        assertEq(testfixed.owner(),newowner);
    } 

    function testattacker() public {
        vm.prank(attacker);
        vm.expectRevert(bytes("only owner has the access"));
        testfixed.changeowner(newowner);

    }
}
