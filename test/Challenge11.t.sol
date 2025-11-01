// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge11} from "src/Challenge11.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_TransferFromDoesNotDecreaseAllowanceCorrectly() public {
        uint256 balanceOfDeployer = mockToken.balanceOf(deployer);

        mockToken.approve(random, 1);

        for (uint256 i; i < 100; i++) {
            vm.prank(random);
            mockToken.transferFrom(deployer, random, 1);
        }

        uint256 balanceOfRandom = mockToken.balanceOf(random);

        assertEq(balanceOfRandom, 100);
    }
}

contract MockToken is Challenge11 {
    constructor() Challenge11() {}
}
