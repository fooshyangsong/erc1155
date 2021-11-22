// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";


contract IMBA1155 is ERC1155PresetMinterPauser, Ownable {
    
    uint256 public constant CAPTAIN_AMERICA = 0;
    uint256 public constant THOR = 1;
    uint256 public constant IRON_MAN = 2;
    uint256 public constant SPIDER_MAN = 3;

    mapping(uint256 => string)private _uris;

    constructor() ERC1155PresetMinterPauser( "https://api.frank.hk/api/nft/demo/1155/marvel/{id}.json") {
        _mint(msg.sender, THOR, 1, "");
        _mint(msg.sender, IRON_MAN, 5, "");
        _mint(msg.sender, SPIDER_MAN, 10, "");
    }
    
    function uri(uint256 tokenId) override public view returns(string memory){
        return(_uris[tokenId]);
    }

    function setTokenUri(uint256 tokenId, string memory uri) public onlyOwner {
        require(bytes(_uris[tokenId]).length == 0, "Cannot set uri twice" );
        _uris[tokenId] = uri;
    }
}