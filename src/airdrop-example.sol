// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import "./airdrop.sol";




contract AirdropExample is Airdrop {
    address public  token;


    error TransferFailed();
    
    constructor (bytes32 _root, address _token) Airdrop(_root) {
        token = _token;
    }



    function handlePayment(address _to, uint256 _amount) internal override {
        (bool success, ) = token.call(abi.encodeWithSelector(bytes4(keccak256("transfer(address,uint256)")), _to, _amount));

        if (!success) revert TransferFailed();
    }
}