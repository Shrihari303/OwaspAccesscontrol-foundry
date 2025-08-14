pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/Injectionbroken.sol";

contract Victim{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function changeowner(address _newowner)public{
        owner = _newowner;
    }
}
contract Testinjectionbroken is Test {
    Injectionbroken brokencontract;
    Victim victim;
    address attacker = address(0xBEEF);

    function setUp()public{
        brokencontract = new Injectionbroken();
        victim = new Victim();
    }

    function testinjectionattack()public{
        bytes memory payload = abi.encodeWithSignature("changeowner(address)",
        attacker);
        vm.prank(brokencontract.owner());
        brokencontract.execute(address(victim),payload);

        assertEq(victim.owner(),attacker);        
    }                  
}