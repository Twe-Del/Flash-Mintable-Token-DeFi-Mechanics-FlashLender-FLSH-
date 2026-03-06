// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";

contract FlashLender is ERC20, ERC20FlashMint {
    constructor() ERC20("FlashLender", "FLSH") {
        _mint(msg.sender, 5000000 * 10 ** decimals());
    }
}