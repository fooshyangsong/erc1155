// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MYERC1155Tradable.sol";

contract IMBA is MYERC1155Tradable {

    uint256 public constant CAPTAIN_AMERICA = 0;
    uint256 public constant THOR = 1;
    uint256 public constant IRON_MAN = 2;
    uint256 public constant SPIDER_MAN = 3;

    mapping(uint256 => string)private _uris;

    constructor(address _proxyRegistryAddress)
        MYERC1155Tradable(
            "OpenSea Creature Accessory",
            "OSCA",
            "https://api.frank.hk/api/nft/demo/1155/marvel/{id}.json",
            _proxyRegistryAddress
        ) {
        _mint(msg.sender, SPIDER_MAN, 1000, "");
        }

    function uri(uint256 tokenId) override public view returns(string memory){
        return(_uris[tokenId]);
    }

    function setTokenUri(uint256 tokenId, string memory uri) public onlyOwner {
        require(bytes(_uris[tokenId]).length == 0, "Cannot set uri twice" );
        _uris[tokenId] = uri;
    }





}