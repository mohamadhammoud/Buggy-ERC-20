// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge17} from "src/Challenge17.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_TransferCheckRecipientBalance() public {
        uint256 amount = 100 ether;

        uint256 balanceOf = mockToken.balanceOf(deployer);

        // _transfer must check sender balance not recipient one
        vm.expectRevert("ERC20: transfer amount exceeds balance");
        mockToken.transfer(random, balanceOf);
    }
}

contract MockToken is Challenge17 {
    constructor() Challenge17() {}
}
