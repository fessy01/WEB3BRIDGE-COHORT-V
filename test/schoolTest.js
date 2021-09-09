
 const { expect } = require("chai");

const { ethers } = require("hardhat");


describe("Test  variables", async function () {
  let School, school, signer1 ;
  before(async function () {
      const signers = await ethers.getSigners();
      signer1=signers[0]
   
    School = await ethers.getContractFactory("School");
    school = await School.deploy();
    await school.deployed();
    const regfunc=await school.resgisterStudent('john',1,'jss1','male', false,'room1' )
  });

  it("Should the details of a particular student", async function () {
    const [_name, _id, _class, _gender,_challenges,_room]=await school.connect(signer1).viewStudent(1);
    console.log((_name, _id, _class, _gender,_challenges,_room))
    expect((_name, _id, _class, _gender,_challenges,_room)).to.equal(('john',1,'jss1','male', false,'room1'));

  });

  it("Should the details of a particular student",
   async function () {
    const viewReg=await school.viewAllRegisteredStudents();
    const  [_name, _id, _class, _gender,_challenges,_room] =viewReg[0]
    expect((_name, _id, _class, _gender,_challenges,_room)).to.equal(('john',1,'jss1','male', false,'room1'));


  });

    


});
