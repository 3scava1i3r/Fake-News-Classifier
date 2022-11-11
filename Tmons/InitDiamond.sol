// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

import {AppStorage} from "./libs/LibAppStorage.sol";

contract InitDiamond {
    AppStorage internal s;

    struct Args {
        string name;
        string symbol;

    }

    function init(Args memory _args) external {
        
        s.name = _args.name;
        s.symbol = _args.symbol;
    }
}