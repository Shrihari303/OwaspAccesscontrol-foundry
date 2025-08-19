// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/Injectionfixed.sol";

contract Victimsafe{
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    function transfer(address _to,uint256 _amount)public {

    }
    function changeowner(address _newowner)public{
        owner = _newowner;
    }
}

contract Testinjectionfixed is Test{
    Injectionfixed fixedcontract;
    Victimsafe victim;
    address attacker = address(0xBEEF);

    function setUp()public{
        fixedcontract = new Injectionfixed();
        victim = new Victimsafe();
    }

    function testpreventioninjection()public{
        bytes4 maliciousselector = bytes4(keccak256("changeowner(address)"));
        bytes memory args = abi.encode(attacker);
        vm.prank(fixedcontract.owner());
         vm.expectRevert("function not allowed");
        fixedcontract.safeexecute(address(victim),maliciousselector,args);
        assertEq(victim.owner(),address(this));

    }    
}