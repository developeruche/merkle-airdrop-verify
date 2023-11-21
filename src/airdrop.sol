// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";



abstract contract Airdrop {
    bytes32 public root;
    mapping (address => bool) public claimed;




    error InvalidProof();
    error AlreadyClaimed();



    constructor(bytes32 _root) {
        root = _root;
    }



    function claim(bytes32[] calldata proof, address _to, uint256 _amount) external {
        address requestor = msg.sender;

        if (!verify(proof, requestor, _amount)) revert InvalidProof();
        if (claimed[requestor]) revert AlreadyClaimed();
        claimed[requestor] = true;


        handlePayment(_to, _amount);
    }


    function verify(bytes32[] calldata proof, address _to, uint256 _amount) public view returns (bool) {
        bytes32 leaf = keccak256(abi.encodePacked(_to, _amount));
        return MerkleProof.verify(proof, root, leaf);
    }



    // this would just be a transfer function ideally
    function handlePayment(address _to, uint256 _amount) internal virtual;
}