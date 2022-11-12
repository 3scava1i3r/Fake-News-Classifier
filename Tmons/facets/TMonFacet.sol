// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

import {AppStorage} from "../libs/LibAppStorage.sol";

contract TMonFacet {
    AppStorage internal s;

    event PetOperatorApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    ///@notice Query the universal totalSupply of all NFTs ever minted
    ///@return totalSupply_ the number of all NFTs that have been minted
    function totalSupply() external view returns (uint256 totalSupply_) {
        totalSupply_ = s.tokenIds.length;
    }

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this.
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return balance_ The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) external view returns (uint256 balance_) {
        require(_owner != address(0), "AavegotchiFacet: _owner can't be address(0)");
        balance_ = s.ownerTokenIds[_owner].length;
    }
}