// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract NFTMarketplace is ERC721 {
  // using Counters for Counters.Counters; // error Identifier not found or not unique.solidity(7920)
  // Counters.Counters private _tokenIds; // sao lai co s

  address payable owner;
  uint256 public price = 666666666666666; // wei ? ether
  uint256 public totalTokens;

  constructor() ERC721("NFT Name", "Symbol") {
    totalTokens = 0;
  }

  function mint(uint256 _numTokens) external payable {
    require(_numTokens * price <= msg.value, "Khong du tien");
    uint256 currentTotalTokens = totalTokens;

    for(uint256 i = 1; i < _numTokens; ++i) {
      _safeMint(msg.sender, currentTotalTokens + i);
    }

    totalTokens += _numTokens;
  }
}