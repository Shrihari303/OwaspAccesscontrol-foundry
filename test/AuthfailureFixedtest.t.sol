// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../src/AuthfailureFixed.sol";
import "forge-std/Test.sol";

contract Testauthfailurefixed is Test{
    AuthfailureFixed fixedcontract;
    address attacker = address(0xBEEF);

    function setUp() public {
        fixedcontract = new AuthfailureFixed();
    }

    function testownercanmint() public {
        vm.prank(address(this));
        fixedcontract.mint(1000);

        assertEq(fixedcontract.balances(address(this)),1000,"owner can mint");
    }

    function testattackercanmint()public{
        vm.prank(attacker);
        vm.expectRevert(
            abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, attacker)
    );
        fixedcontract.mint(1000);

    }
}