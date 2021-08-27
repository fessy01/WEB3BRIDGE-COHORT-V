
pragma solidity ^0.8.1;

/*A particular financial institution is looking to have their records stored onchain and looking to have an *external *`identifier` 
tied to each customers Details....the identifier should be the keccak256 hash of the customer's name and time of registration ,
each customer can also approve another customer to view their details
[meaning that only admins and approved customers have the right to view another customer's data]....
For simplicity purposes, the Bank is looking to have a separate contract that has all *setter* functions and 
another contract that has all the *getter * functions(Interacting with each other of course)..Finally,
they want an interface for all the contracts they have......
NOTE: USE THE APPROPRIATE FUNCTION AND VARIABLE VISIBILITY SPECIFIERS*/


contract A{
    
    address public owner;
    string public name;
    uint public dateOfReg;
    bytes32 public hash;
    address private other;
    
    constructor(){
        owner = msg.sender;
    }
    
    
    struct Details{
        string name;
        uint dateOfReg;
        bytes32 hash;
    
    }
    //bytes32 public a = keccak256(abi.encodePacked(name, dateOfReg));
    
    mapping(bytes32 => Details) public customersDetalis;
    
    mapping(bytes32=>mapping(address=>bool)) public checkDetail;
    
    function open(string memory _name, uint _dateOfReg) public returns(Details memory){
        require(msg.sender==owner, "only Admin can open");
        
        Details storage _Details = customersDetalis[hash];
        _Details.name=_name;
        _Details.dateOfReg=_dateOfReg;
        _Details.hash = keccak256(abi.encodePacked( name, dateOfReg));
        return _Details;
        
    }
    
     function changeViewer(address _newViewer, bytes32 _hash)external {
        checkDetail[_hash][_newViewer] = true;
    }
      
   function newOpen(bytes32 _hash) public view returns(Details memory){
       require(checkDetail[_hash][msg.sender] == true || msg.sender == owner, "access denied");
       return customersDetalis[_hash];
    }
    
} 

contract B {
    
     address public owner;
    string public name;
    uint public dateOfReg;
    bytes32 internal hash;
    address private other;
    
    A a = A(0xa131AD247055FD2e2aA8b156A11bdEc81b9eAD95);
    function get(string memory _name, uint _dateOfReg)public{
        a.open(_name,_dateOfReg);
    }
}