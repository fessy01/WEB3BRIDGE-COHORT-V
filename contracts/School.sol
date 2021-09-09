pragma solidity ^0.8.4;

contract School{
   uint public RegisteredStudents = 0;
   
   address HeadTeacher;

student[] _resgisterStudent;


// setting headteacher as owner
constructor(){
    HeadTeacher=msg.sender;
}
//giving permission to only headteacher
modifier onlyHeadTeacher{
    require(HeadTeacher==msg.sender, "only HeadTeacher is allowed");
    _;
}

// details of student
struct student{
    string  name;
    uint id;
    string class;
    string gender;
    bool physcicallyDisable;
    string room;
    bytes32 studentCode;

}


mapping(uint=>student)studentDtails;
//mapping(string=>student)RoomDetail;
//mapping (bool=> student)healthStatus;
// setting properties for the student
event Register( string _name, uint _id, string _class, string _gender,bool _challenges);
function resgisterStudent( string memory _name, uint _id, string memory _class, string memory _gender,bool _challenges, string memory _room) public returns(student memory) {
  //count the number of student RegisteredStudents
  RegisteredStudents ++;
   studentDtails[RegisteredStudents] =studentDtails[_id];
    student storage s = studentDtails[_id];
    s.name = _name;
    s.id = _id;
    s.class = _class;
    s.gender = _gender;
    s.physcicallyDisable =_challenges;
    s.room = _room;
    s.studentCode=keccak256(abi.encodePacked(_name,_id,_class));
    _resgisterStudent.push(s);  //pushing the register student into the array
    emit Register (_name, _id, _class, _gender,_challenges); 
    return s;

}
//viewing student details
function viewStudent (uint _id)public view returns(student memory){
        return studentDtails[_id];

}
// view only the room of student
function checkRoom(uint _id ) public view onlyHeadTeacher returns(string memory){
    return studentDtails[_id].room;
    
    
}

//checking the health status of a student

function checkHealthStatus(uint _id ) public view onlyHeadTeacher returns(bool){
    return studentDtails[_id].physcicallyDisable;
}
// checking the class of a students
function checkClass (uint _id) public view onlyHeadTeacher returns(string memory){
    return studentDtails[_id].class;
}
 // changing the class of a student
function updateClass(uint _id, string memory newclass) public onlyHeadTeacher{
    studentDtails[_id].class=newclass;
    
}
// view all the registered students
function viewAllRegisteredStudents ()public view returns(student[] memory){
        return _resgisterStudent;

}

}