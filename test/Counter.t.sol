// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challlenge01} from "src/Challenge01.sol";
contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_TransferDoesNotDeductFromBalance() public {
        uint256 beforeBalance = mockToken.balanceOf(deployer);

        mockToken.transfer(recipient, beforeBalance);
        uint256 beforeAfter = mockToken.balanceOf(deployer);

        assertEq(beforeBalance, beforeAfter);
    }
}

contract MockToken is Challlenge01 {
    constructor() Challlenge01("Challenge01", "ch1") {
        _mint(msg.sender, 1);
    }
}
