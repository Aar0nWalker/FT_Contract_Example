// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    uint256 immutable public _maxTokens = 1000 ether;
    uint256 public totalTokens;
    string private _symbol;
    string private _name;

    constructor() ERC20(_name, _symbol) {
        _name = "Token";
        _symbol = "Test";
        totalTokens = 0;
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
