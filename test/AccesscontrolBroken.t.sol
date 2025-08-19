pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/AccescontrolBroken.sol";

contract AccesscontrolBrokenTest is Test{
    AccesscontrolBroken public vulnerable;
    address attacker = address(0xBEEF);

    function setUp()public{
        vulnerable = new AccesscontrolBroken();
    }

    function testanyonechangeowner()public{
        vulnerable.changeowner(attacker);
        assertEq(vulnerable.owner(),attacker,"Access control broken"); 
    }
} 
   




