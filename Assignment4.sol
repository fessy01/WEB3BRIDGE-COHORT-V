// SPDX-License-Identifier: GPL-3.0;

pragma solidity ^0.8.0;
//Your contract is supposed to contain a very CRUCIAL function . 
//Your first function accepts 3 different addresses and performs the keccak256 hash of the first 2....
//it then hashes the result with the third address and returns the final hash...
//The second CRUCIAL function gets the final hash from the first function above and accepts two arguments(a number and a bytes32 value)...
//it hashes the number separately, performs a typecasting(on the bytes32[second argument]) so as to convert it to a number, hashes the number too, 
//then hashes both of the resulting hashes with the hash gotten from the previous function and finally returns the final hash
//Note: Use the correct function visibility specifiers

contract crucials{
  function firstFunction(address one, address two, address three) internal pure returns(bytes32 secondharsh){
       bytes32 firstharsh=keccak256(abi.encodePacked(one,two));
       secondharsh=keccak256(abi.encodePacked(firstharsh, three));
       // return(firstharsh,secondharsh);
    }
    
    function secondFunction(uint four,bytes32 h)public pure returns(bytes32 finalHarh) {
        (bytes32 fromFirst) = firstFunction(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
        finalHarh=bytes32 (keccak256(abi.encodePacked(fromFirst,four,h)));
        
    }
}