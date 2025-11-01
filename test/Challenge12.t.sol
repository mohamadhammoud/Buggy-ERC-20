// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge12} from "src/Challenge12.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_GiftCorruptTotalSupply() public {
        uint256 totalSupplyBefore = mockToken.totalSupply();

        mockToken.gift(random, 2 ether);

        uint256 totalSupplyAfter = mockToken.totalSupply();

        assertEq(totalSupplyAfter, totalSupplyBefore);
    }
}

contract MockToken is Challenge12 {
    constructor() Challenge12("Challenge12", "Ch12", 18) {}
}
