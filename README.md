# FT Contract Example

<p align="left">
  <img src="https://img.shields.io/badge/Solidity-0.8.18-informational" alt="Solidity Version">
  <img src="https://img.shields.io/badge/License-MIT-success" alt="License">
</p>
  
<h3>About</h3>

There is a simple FT template made on ERC20 token standard. Contract provides basic functions: mint, airdrop and burn.

<h3>Core stuff</h3>

ERC20 is a default and well-known fungible token standard. The contract was optimized (including libraries) and audited. For audit I've used 2 main frameworks: slyther and mythril, reports are in "audit" folder. The test was simply written using brownie and pytest ("tests" folder).

Web2 is made with Next.js, because it can combine backend and frontend in more complicated projects. Wallet connection implemented with wagmi library and contract calls are made using web3.js.
