// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;



struct AppStorage {
    string name;
    string symbol;
}

library LibAppStorage {
    function diamondStorage() internal pure returns (AppStorage storage ds) {
        assembly {
            ds.slot := 0
        }
    }

    function abs(int256 x) internal pure returns (uint256) {
        return uint256(x >= 0 ? x : -x);
    }
}