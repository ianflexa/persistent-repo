// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    // Counter public counter;
    uint256 constant initBlock = 47840214;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("zksync"), initBlock);
    }
    // this one works
    function testZkEnsureContractMigratedWhenForkedIfPersistent() external {
        uint256 current = initBlock - 10;
        Counter counter = create_counter_in_past(current);
        vm.makePersistent(address(counter));
        uint256 i = 1;
        while (current <= initBlock) {
            vm.createSelectFork(vm.rpcUrl("zksync"), current);
            counter.inc();
            assertEq(i, counter.get());
            assertGe(counter.latestAnswer(), 0);
            i += 1;
            current += 1;
        }
    }

    function create_counter_in_past(uint256 block_) internal returns (Counter) {
        vm.createSelectFork(vm.rpcUrl("zksync"), block_);
        return new Counter();
    }
}
