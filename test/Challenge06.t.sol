// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge06} from "src/Challenge06.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();

        uint256 balance = mockToken.balanceOf(deployer);
        mockToken.transfer(sender, balance);
        mockToken.blacklist(sender);
    }

    function test_TransferFromDoesntCheckBlacklistSender() public {
        uint256 senderBalance = mockToken.balanceOf(sender);

        vm.prank(sender);
        mockToken.approve(recipient, senderBalance);

        vm.prank(recipient);
        mockToken.transferFrom(sender, recipient, senderBalance);
    }
}

contract MockToken is Challenge06 {
    constructor() Challenge06() {}
}
