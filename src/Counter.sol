// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function inc() public {
        number++;
    }

    function get() public view returns (uint256) {
        return number;
    }

    function latestAnswer() public view returns (uint256) {
        return
            uint256(
                ICchain(0x97920183c36B022B46D6C14b9dA36c5f31A98C6A)
                    .latestAnswer()
            );
    }
}

interface ICchain {
    function latestAnswer() external view returns (int256);
}
