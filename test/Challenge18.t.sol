// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge18} from "src/Challenge18.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_MintDoesnotIncrementBalance() public {
        uint256 amount = 1 ether;

        uint256 totalSupplyBefore = mockToken.totalSupply();

        mockToken.mint(deployer, amount);

        uint256 totalSupplyAfter = mockToken.totalSupply();

        assertEq(totalSupplyBefore, totalSupplyAfter);
    }
}

contract MockToken is Challenge18 {
    constructor() Challenge18() {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
