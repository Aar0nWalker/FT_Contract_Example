// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./lib/ERC20.sol";
import "./lib/Ownable.sol";

contract Token is ERC20, Ownable {
    uint256 constant public _maxTokens = 1000 ether;
    uint256 public totalTokens;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        name = "Example";
        symbol = "FT";
    }

    function mint(uint256 amount) public onlyOwner {
        require(amount + totalTokens <= _maxTokens, "Exceeded max token amount");
        _mint(msg.sender, amount);
        totalTokens += amount;
    }

    function Airdrop(uint256 amount, address to) public onlyOwner {
        require(amount + totalTokens <= _maxTokens, "Exceeded max token amount");
        _mint(to, amount);
        totalTokens += amount;
    }

    function burn(address account, uint256 amount) public onlyOwner {
        require(amount + totalTokens <= _maxTokens, "Exceeded max token amount");
        _burn(account, amount);
        totalTokens -= amount;
    }

}
