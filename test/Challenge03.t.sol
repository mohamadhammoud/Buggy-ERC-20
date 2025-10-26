// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge03} from "src/Challenge03.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_BurnMethodNotProtected() public {
        vm.startPrank(random);

        uint256 deployerBalance = mockToken.balanceOf(deployer);
        mockToken.burn(deployer, deployerBalance);

        assertEq(mockToken.balanceOf(deployer), 0);

        vm.stopPrank();
    }
}

contract MockToken is Challenge03 {
    constructor() Challenge03() {}
}
