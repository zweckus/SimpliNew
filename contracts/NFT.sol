// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NFT is Ownable, ERC721URIStorage{

    using Counters for Counters.Counter;
    Counters.Counter private nftTokenId;


    address contractAddress;

    bytes4 private constant _INTERFACE_ID_ERC2981 = 0x2a55205a;

    constructor(address marketplaceAddress)ERC721("Simpli","SMPL"){

        contractAddress = marketplaceAddress;

    }

    function createNFtToken(string memory nftTokenURl)public  returns (uint256){
        nftTokenId.increment();
        uint256 id = nftTokenId.current();
        _mint(msg.sender,id);

        _setTokenURI(id,nftTokenURl);
   
        setApprovalForAll  (contractAddress,true);
    

        return id;
    
    }



}