// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge16} from "src/Challenge16.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_ApproveDoesNotSetAllowance() public {
        uint256 amount = 100 ether;

        mockToken.approve(random, amount);

        assertEq(0, mockToken.allowance(deployer, random));
    }
}

contract MockToken is Challenge16 {
    constructor() Challenge16() {}
}
