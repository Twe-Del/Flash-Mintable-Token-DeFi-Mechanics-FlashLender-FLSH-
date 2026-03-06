// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Мы жестко прописываем версию @4.9.3 в ссылках, чтобы избежать конфликтов с версией 5.0
import "@openzeppelin/contracts@4.9.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.3/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts@4.9.3/access/Ownable.sol";

contract SnapshotToken is ERC20, ERC20Snapshot, Ownable {
    // В версии 4.x Ownable автоматически назначает создателя владельцем, передавать msg.sender не нужно
    constructor() ERC20("SnapshotToken", "SNAP") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    // В версии 4.x используется _beforeTokenTransfer вместо _update
    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}