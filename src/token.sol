// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";



contract Token is ERC20 {
      // total supply of Unicorn token is 100,000,000
      uint256 constant initialSupply = 100000000000000000000000000 * (10 ** 18);

      // mint the tokens
      constructor() ERC20("Unicorn Token", "UNC") {
          _mint(msg.sender, initialSupply);
      }

}