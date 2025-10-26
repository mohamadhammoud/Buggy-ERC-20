// SPDX-License-Identifier: CC-BY-NC-SA-4.0

import {Test} from "forge-std/Test.sol";

pragma solidity ^0.8.20;

contract BaseTest is Test {
    address internal immutable deployer;

    address internal immutable sender = makeAddr("sender");
    address internal immutable recipient = makeAddr("recipient");
    address internal immutable random = makeAddr("random");

    constructor() {
        deployer = address(this);
    }
}
