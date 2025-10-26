// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge05} from "src/Challenge05.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_TransferFromDeductsFromRecipientInsteadOfSender() public {
        uint256 balanceBefore = mockToken.balanceOf(deployer);

        mockToken.approve(random, balanceBefore);

        vm.prank(random);
        vm.expectRevert("Challenge5: insufficient balance");
        mockToken.transferFrom(deployer, random, balanceBefore);
    }
}

contract MockToken is Challenge05 {
    constructor() Challenge05() {}
}
