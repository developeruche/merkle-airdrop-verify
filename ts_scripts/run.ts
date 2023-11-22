import fs from "fs";
import {parse} from "csv-parse";
import keccak256 from "keccak256";
import { defaultAbiCoder } from "ethers/lib/utils";
import MerkleTree from "merkletreejs";







function gen() {
    let leaves: any[] = [];


    let writeOutput = fs.createWriteStream(__dirname + "/output.json", { flags: "a" });

    let outPrep: any = {};

    fs.createReadStream(__dirname + "/example.csv")
    .pipe(parse({ delimiter: ",", from_line: 2 }))
    .on("data", function (row) {
        const encodedData = defaultAbiCoder.encode(
            ['address', 'uint256'],
            [
                row[0],
                row[1].trim()
            ]
          );
    
        const hash = keccak256(encodedData);
        leaves.push(hash);

        outPrep[row[0]] = {
            "amount": row[1],
            "leaf": hash.toString("hex")
        };
    })
    .on("error", function (error) {
        console.log(error.message);
    })
    .on("end", function () {
        console.log("starting merkle process");
        
        // preparing the tree
        const merkleTree = new MerkleTree(leaves, keccak256, { sortPairs: true});
        const rootHash = merkleTree.getHexRoot();

        console.log("tree created", rootHash);

        // adding the proof to the output
        console.log("writing to output file");
        let keys = Object.keys(outPrep);
        for (let i = 0; i < keys.length; i++) {
            outPrep[keys[i]].proof = merkleTree.getHexProof(outPrep[keys[i]].leaf);
            console.log(i)
            
            // uncomment this to generate proof for all the vaalid addresses
            if(i == 1) {
                break;
            }
        }
        outPrep["root"] = rootHash;


        // writing the output
        writeOutput.write(JSON.stringify(outPrep));
        writeOutput.end();
    });
}

gen();