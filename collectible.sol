// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract COMP5521Collectible is ERC721URIStorage, Ownable {
    
    // 声明一个 Counter 实例来追踪 token ID
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    /**
     * @dev 构造函数在部署时设置 NFT 的 Name 和 Symbol.
     * 它还设置了合约的初始 Owner.
     */
    constructor(address initialOwner) 
        ERC721("COMP5521 Collectible", "C5C")
        Ownable(initialOwner)
    {
        
    }

    /**
     * @dev 创建一个新的 NFT 并将其分配给 'to' 地址.
     * 自动为新的 NFT 分配一个递增的 token ID.
     * 将 'tokenURI' 与此 NFT 关联.
     * 此函数受到 'onlyOwner' 修饰符的限制.
     * @param to 接收新 NFT 的地址.
     * @param tokenURI 指向 NFT 元数据 JSON 文件的 URI.
     */
    function safeMint(address to, string memory tokenURI) 
        public 
        onlyOwner 
    {
        // 获取当前 counter 的值作为新的 token ID
        uint256 tokenId = _tokenIdCounter.current();
        
        // 调用 OpenZeppelin ERC721 内部的 _safeMint 函数
        _safeMint(to, tokenId);
        
        // [修复] _setTokenURI 现在可以被正确识别
        _setTokenURI(tokenId, tokenURI);

        // 将 counter 的值加 1，为下一个 mint 做准备
        _tokenIdCounter.increment();
    }
}