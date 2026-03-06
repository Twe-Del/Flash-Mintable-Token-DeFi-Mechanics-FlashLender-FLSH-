// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SnapshotToken is ERC20, ERC20Snapshot, Ownable {
    constructor() ERC20("SnapshotToken", "SNAP") Ownable(msg.sender) {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Snapshot) {
        super._update(from, to, value);
    }
}