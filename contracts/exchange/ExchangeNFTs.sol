// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/utils/math/Math.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC721/IERC721.sol';
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/utils/structs/EnumerableSet.sol';
import './libraries/EnumerableMap.sol';
import './libraries/ExchangeNFTsHelper.sol';
import './interfaces/IExchangeNFTs.sol';
import './interfaces/IExchangeNFTConfiguration.sol';
contract ExchangeNFTs {
    using SafeMath for uint256;
    using EnumerableMap for EnumerableMap.UintToUintMap;
    using EnumerableSet for EnumerableSet.UintSet;

    struct SettleTrade {
        address nftToken;
        address quoteToken;
        address buyer;
        address seller;
        uint256 tokenId;
        uint256 originPrice;
        uint256 price;
        bool isMaker;
    }

    struct AskEntry {
        uint256 tokenId;
        uint256 price;
    }

    struct BidEntry {
        address bidder;
        uint256 price;
    }

    struct UserBidEntry {
        uint256 tokenId;
        uint256 price;
    }

    IExchangeNFTConfiguration public config;
}