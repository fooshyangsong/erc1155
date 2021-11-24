// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IMBANFT is ERC1155PresetMinterPauser, Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(uint256 => string)private _uris;

    constructor() ERC1155PresetMinterPauser( "https://api.frank.hk/api/nft/demo/1155/marvel/{id}.json") {
       
    }
    
    function uri(uint256 tokenId) override public view returns(string memory){
        return(_uris[tokenId]);
    }

    function setTokenUri(uint256 tokenId, string memory uri) public onlyOwner {
        _uris[tokenId] = uri;
    }
    
    function mintNFT(address recipient, string memory tokenURI,uint256 amount)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId, amount, "");
        setTokenUri(newItemId, tokenURI);
        return newItemId;
    }

    function mintAddOn(address recipient,uint256 id, string memory tokenURI, uint256 amount) public onlyOwner returns (uint256)
    {
        _mint(recipient, id, amount, "");
        setTokenUri(id, tokenURI);
        return id;
    }

}