// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title COMP5521Dollar (C5D)
 * @dev 这是 COMP5521 项目的 ERC20 稳定币合约.
 * 它继承了 OpenZeppelin 的 ERC20 实现.
 * 它使用 Ownable 来限制 minting (铸币) 功能，以模拟 1:1 锚定
 */
contract MakePolyuGreatAgain is ERC20, Ownable, ERC20Permit {
    constructor(address recipient, address initialOwner)
        ERC20("MakePolyuGreatAgain", "MPGA")
        Ownable(initialOwner)
        ERC20Permit("MakePolyuGreatAgain")
    {
        _mint(recipient, 1000000000 * 10 ** decimals());
    }

    /**
     * @dev 创建 'amount' 数量的新代币并将其分配给 'to' 地址.
     * 这是一个模拟 1:1 HKD 锚定的功能.
     * 此函数受到 'onlyOwner' 修饰符的限制.
     * @param to 接收新代币的地址.
     * @param amount 要铸造的代币数量.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
