// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge04} from "src/Challenge04.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_TransferFromIgnoresPausedState() public {
        uint256 balanceBefore = mockToken.balanceOf(deployer);

        mockToken.approve(random, balanceBefore);
        mockToken.pause();

        vm.startPrank(random);
        mockToken.transferFrom(deployer, random, balanceBefore);
        vm.stopPrank();

        assertEq(mockToken.balanceOf(random), balanceBefore);
        assertEq(mockToken.balanceOf(deployer), 0);
    }
}

contract MockToken is Challenge04 {
    constructor() Challenge04() {}
}
