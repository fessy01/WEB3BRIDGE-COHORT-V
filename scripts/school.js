const hre = require("hardhat");
async function main() {

const School = await hre.ethers.getContractFactory("School");
  const school = await School.deploy();

  const schoolContract = await school.deployed();
//function resgisterStudent( string memory _name, uint _id, string memory _class, string memory _gender,bool _challenges, string memory _room) public returns(student memory) {
  await schoolContract.resgisterStudent('tola',2,'jss2','male',false, 'room2');
  const firstStudent = await schoolContract.viewStudent(2);
  console.log('first student', firstStudent);

await schoolContract.resgisterStudent('tola',2,'jss2','male',false, 'room2');
  const Students = await schoolContract.viewAllRegisteredStudents();
  console.log( 'first student reg', Students);

  await schoolContract.resgisterStudent('tola',2,'jss2','male',false, 'room2');
  const changeClass = await schoolContract.updateClass(1,"jss3");
  console.log( 'change student classs', changeClass);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });