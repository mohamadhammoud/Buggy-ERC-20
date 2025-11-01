// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge15} from "src/Challenge15.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_MintDoesnotIncrementBalance() public {
        uint256 amount = 100 ether;

        mockToken.mint(deployer, amount);

        assertEq(0, mockToken.balanceOf(deployer));
    }
}

contract MockToken is Challenge15 {
    constructor() Challenge15("Challenge15", "Ch15", 18) {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
