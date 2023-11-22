// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {AirdropExample} from "../src/airdrop-example.sol";
import {Token} from "../src/token.sol";

contract AirdropExampleTest is Test {
    AirdropExample public airdrop;
    Token public token;

    function setUp() public {
        vm.prank(0x11111111111cd56832Ce5DFBCbFf02e7eC639Bc9);
        token = new Token();
        airdrop = new AirdropExample(0x94205e9a4aec0fe3aa452488567710948bf97a166aa073c0cc9f167bcdc9fe41, address(token));
        vm.prank(0x11111111111cd56832Ce5DFBCbFf02e7eC639Bc9);
        token.transfer(address(airdrop), 100000000000000000000000000);
    }

    function testClaim() public {
        
        bytes32[] memory proof = new bytes32[](18);
        proof[0] = 0x8bc39765f21e398418940c7f1c88ccb9fdff6601d645f71c61feb5d805a24203;
        proof[1] = 0xa3f7c983f98efe6c38c82451dbbbca59caf529e9c4818c9cc92b1bf648e7cb6b;
        proof[2] = 0x1c3599af9db3dc400adcddd39d6c28b15056d4be06e1c6186025f08fd8008493;
        proof[3] = 0x904a2fcb4c2b1d75f584dd2e470c53bbd1b12e1474174928d68261766602a4d2;
        proof[4] = 0xad26b5edfa7e902c496a32bdd732ed4b1dfd710adc92f5576d285a387301a26b;
        proof[5] = 0xb2bf7afcf9485689d47385e13fa99050f8f5f50aa05f52c8eb89142cd76d9021;
        proof[6] = 0x28786d1ad650c35dd350f02acdda9967e3bdeaecd1a81b63899265ee04e4b560;
        proof[7] = 0x8fc04e7e54d3c613d2fa6c93b19b3be2a7b19ffc4f6886e8b11f06693aa9fed4;
        proof[8] = 0xd9fcc37f4fd518f2012e466935bf94950b2ecdb28ce5ec2a70850b63fb7f3edf;
        proof[9] = 0x62ab93a979708a02568e808c450a1e599a2fc20c37c7326955c51470e7904703;
        proof[10] = 0x690d1e73407711ee4ba45b95f5a2f6b0aa9e3e28f5caa38461d2632c7d15e0cf;
        proof[11] = 0xe112fe9bc1d4cb7f83486d4b18f98b4d3e9cc943208f138eb8fba749bbbba024;
        proof[12] = 0x540a8c2f18c373cbb503b595299aa24d0220a558eebde869cc6ab7dd1ec50467;
        proof[13] = 0x063a8f61880c172289b3db8d04fdbc5afc2f88acdd98afe158ac08e79ed9c73f;
        proof[14] = 0x64466ed1c5f9006ec2af609fc7bc5bc1da6de9b81a25e7d6a3085f9586e4922c;
        proof[15] = 0xf0963016d7b482d6d4f0bd8461c292af234185c95cc786d76638850772ea4ab5;
        proof[16] = 0x1f63e3f735ad245cc3c84a6551676ab19798631b67ff0333057a42c08bc84825;
        proof[17] = 0x9c71f7e776b445e04438f9af2213aa8aba04cc304b57821d1cd62b3ed741e5e9;
        
        vm.prank(0x00000000000Cd56832cE5dfBcBFf02e7eC639BC9);
        
        airdrop.claim(
            proof,
            0x00000000000Cd56832cE5dfBcBFf02e7eC639BC9,
            681260071737086705664
        );
    }
}



/* 


["0x8bc39765f21e398418940c7f1c88ccb9fdff6601d645f71c61feb5d805a24203","0xa3f7c983f98efe6c38c82451dbbbca59caf529e9c4818c9cc92b1bf648e7cb6b","0x1c3599af9db3dc400adcddd39d6c28b15056d4be06e1c6186025f08fd8008493","0x904a2fcb4c2b1d75f584dd2e470c53bbd1b12e1474174928d68261766602a4d2","0xad26b5edfa7e902c496a32bdd732ed4b1dfd710adc92f5576d285a387301a26b","0xb2bf7afcf9485689d47385e13fa99050f8f5f50aa05f52c8eb89142cd76d9021","0x28786d1ad650c35dd350f02acdda9967e3bdeaecd1a81b63899265ee04e4b560","0x8fc04e7e54d3c613d2fa6c93b19b3be2a7b19ffc4f6886e8b11f06693aa9fed4","0xd9fcc37f4fd518f2012e466935bf94950b2ecdb28ce5ec2a70850b63fb7f3edf","0x62ab93a979708a02568e808c450a1e599a2fc20c37c7326955c51470e7904703","0x690d1e73407711ee4ba45b95f5a2f6b0aa9e3e28f5caa38461d2632c7d15e0cf","0xe112fe9bc1d4cb7f83486d4b18f98b4d3e9cc943208f138eb8fba749bbbba024","0x540a8c2f18c373cbb503b595299aa24d0220a558eebde869cc6ab7dd1ec50467","0x063a8f61880c172289b3db8d04fdbc5afc2f88acdd98afe158ac08e79ed9c73f","0x64466ed1c5f9006ec2af609fc7bc5bc1da6de9b81a25e7d6a3085f9586e4922c","0xf0963016d7b482d6d4f0bd8461c292af234185c95cc786d76638850772ea4ab5","0x1f63e3f735ad245cc3c84a6551676ab19798631b67ff0333057a42c08bc84825","0x9c71f7e776b445e04438f9af2213aa8aba04cc304b57821d1cd62b3ed741e5e9"]

*/