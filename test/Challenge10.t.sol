// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge10} from "src/Challenge10.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_WrongModifierImplementation() public {
        assertEq(mockToken.owner(), deployer);
        mockToken.renounceOwnership();
        assertEq(mockToken.owner(), address(0));

        // it succeeded t burn even I'm not an owner
        mockToken.burn(deployer, 1);
    }
}

contract MockToken is Challenge10 {
    constructor() Challenge10() {}
}
