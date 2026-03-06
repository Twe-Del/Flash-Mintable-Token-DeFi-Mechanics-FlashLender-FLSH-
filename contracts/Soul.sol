// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SoulboundBadge is ERC721, Ownable {
    uint256 private _nextTokenId;

    constructor() ERC721("SoulboundBadge", "SOUL") Ownable(msg.sender) {}

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // This overrides the update function to block all transfers
    function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
        address from = _ownerOf(tokenId);
        // Allow minting (from zero address) and burning (to zero address), but reject user-to-user transfers
        require(from == address(0) || to == address(0), "SoulboundBadge: Transfer is strictly prohibited");
        return super._update(to, tokenId, auth);
    }
}