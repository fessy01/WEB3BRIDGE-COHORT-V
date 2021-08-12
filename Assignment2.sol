// SPDX-License-Identifier: GPL-3.0;
pragma solidity ^0.8.0;

contract ArrayofStreet{
    
    //A street has four houses each containing 3 flats that contains 5 rooms each.
    //each rooms can hold any number of people.
    //write a solidity contract that calculates the total number of flats, room, and occupants in the street.
    
    uint[][5][3][4]public street=[[[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]]],
                                 [[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]]],
                                 [[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]]],
                                 [[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]],[[5],[5],[5],[5],[5]]]];
  
    uint public noOfHouses = street.length;
    uint public noOfFlats = street[0].length * street.length;
    uint public noOfRooms = street[0][0].length * noOfFlats;
    uint public noOfOccupant  = street[0][0][0].length * noOfRooms;
}
