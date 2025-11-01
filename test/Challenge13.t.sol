// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge13} from "src/Challenge13.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_CompromisedApprove() public {
        uint256 amount = 0;
        vm.prank(random);
        mockToken.approve(deployer, amount);

        // I can transfer from the deployer even if he doesn't approve to random
        vm.prank(random);
        mockToken.transferFrom(deployer, random, amount);

        uint256 balance = mockToken.balanceOf(random);
        assertEq(balance, amount);
    }
}

contract MockToken is Challenge13 {
    constructor() Challenge13("Challenge13", "Ch13", 18) {}
}
