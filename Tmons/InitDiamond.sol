// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

import {AppStorage} from "./libs/LibAppStorage.sol";
import {LibMeta} from "../shared/libs/LibMeta.sol";
import {LibDiamond} from "../shared/libs/LibDiamond.sol";
import {IDiamondCut} from "../shared/interfaces/IDiamondCut.sol";
import {IERC165} from "../shared/interfaces/IERC165.sol";
import {IDiamondLoupe} from "../shared/interfaces/IDiamondLoupe.sol";
import {IERC173} from "../shared/interfaces/IERC173.sol";
//import {ILink} from "./interfaces/ILink.sol";

contract InitDiamond {
    AppStorage internal s;

    struct Args {
        string name;
        string symbol;

    }

    function init(Args memory _args) external {

        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();

        // adding ERC165 data
        ds.supportedInterfaces[type(IERC165).interfaceId] = true;
        ds.supportedInterfaces[type(IDiamondCut).interfaceId] = true;
        ds.supportedInterfaces[type(IDiamondLoupe).interfaceId] = true;
        ds.supportedInterfaces[type(IERC173).interfaceId] = true;
        
        s.name = _args.name;
        s.symbol = _args.symbol;
    }
}