// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.1;

contract detials{
       bytes32 classOne;
       bytes32 classTwo;
    function studentDetail1(address id, uint age) public{
        classOne=keccak256(abi.encodePacked(id, age));
    }
    
    
   function studentDetails(string memory name, uint number ) public{
        classTwo=keccak256(abi.encodePacked(name, number));
    }
    function viewDetails()public view returns(bytes32, bytes32){
    return (classOne,classTwo);
}
}
