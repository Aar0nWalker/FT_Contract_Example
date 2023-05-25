import { useWeb3Modal } from "@web3modal/react";
import { useState } from "react";
import { useAccount, useDisconnect } from "wagmi";
import TokenABI from './Token.json';
import Web3 from 'web3';
import { getAccount } from '@wagmi/core';

export default function MintButton() {
    const [accounts, setAccounts] = useState([]);
    const [error, setError] = useState(null);
    const { isConnected } = useAccount();

    const contractAddress = "0x235FC2EebF87603eCc5cb61ee42cE2fCbdDb1d1A";
    const contractABI = TokenABI.abi;

    const mint = async () => {
        const web3 = new Web3("http://localhost:8545");
        const contract = new web3.eth.Contract(contractABI, contractAddress);
        const account = getAccount().address;
        console.log(account);
        contract.methods.mint(1000000000000000000n).send({ from: account })
            .on('transactionHash', function (hash) {
                console.log(`Transaction hash: ${hash}`);
            })
            .on('confirmation', function (confirmationNumber, receipt) {
                console.log(`Confirmation number: ${confirmationNumber}`);
            })
            .on('error', console.error);
    }

    return (
        <button onClick={mint} disabled={!isConnected}>
            Mint
        </button>
    );
}
