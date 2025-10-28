// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge08} from "src/Challenge08.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_BurnDoesntDecrementTotalSupply() public {
        uint256 beforeTotalSupply = mockToken.totalSupply();
        uint256 beforeBalance = mockToken.balanceOf(deployer);

        mockToken.burn(beforeBalance);

        uint256 afterTotalSupply = mockToken.totalSupply();
        uint256 afterBalance = mockToken.balanceOf(deployer);

        assertEq(afterBalance, 0);
        assertEq(afterTotalSupply, beforeTotalSupply);
    }
}

contract MockToken is Challenge08 {
    constructor() Challenge08() {}
}
