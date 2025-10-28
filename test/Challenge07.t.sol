// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge07} from "src/Challenge07.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_MintNotProtected() public {
        uint256 senderBalance = mockToken.balanceOf(sender);

        vm.prank(random);
        mockToken.mint(random, 1000 ether);

        assertEq(mockToken.balanceOf(random), 1000 ether);
    }
}

contract MockToken is Challenge07 {
    constructor() Challenge07() {}
}
