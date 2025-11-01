// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTest} from "./utils/BaseTest.t.sol";

import {Challenge20} from "../src/Challenge20.sol";

contract Challenge20Test is BaseTest {
    MockToken private erc20;

    function setUp() public {
        erc20 = new MockToken();
    }

    function test_TransferFromIncreasesInsteadOfDecreasesAllowance() public {
        uint amount = 1 ether;

        erc20.approve(random, amount);
        uint256 allowanceBefore = erc20.allowance(deployer, random);
        assertEq(allowanceBefore, amount);

        vm.prank(random);
        erc20.transferFrom(deployer, recipient, amount);

        uint256 allowanceAfter = erc20.allowance(deployer, random);
        assertEq(allowanceAfter, allowanceBefore * 2);
    }
}

contract MockToken is Challenge20("Challenge20", "Ch25", 18) {
    constructor() {
        _mint(msg.sender, 1 ether);
    }
}
