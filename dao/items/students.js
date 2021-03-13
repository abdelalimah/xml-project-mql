function checkStudentExistance(student,root){
  let isStudentExist = false;
  let students = root.extractChildren();
  for (let i = 0; i < students.length; i++) {
    if(students[i].extractAttribute("cne") == student.cne){
      isStudentExist = true;
    }
  }

  return isStudentExist;
}

module.exports = {
  
  updateStudent(student,currStudent,document) {
    const updatedStudent = document.createElement("student");
    updatedStudent.setAttribute("cne",student.cne);
    updatedStudent.setAttribute("cin",student.cin);
    const name = document.createElement("name");
    name.appendChild(document.createTextNode(student.name));
    const nickname = document.createElement("nickname");
    nickname.appendChild(document.createTextNode(student.nickname));
    const age = document.createElement("age");
    age.appendChild(document.createTextNode(student.age));

    updatedStudent.appendChild(name);
    updatedStudent.appendChild(nickname);
    updatedStudent.appendChild(age);

    currStudent.replaceNode(updatedStudent);
  },
  addStudent(student,root,document){
    let isStudentExist = checkStudentExistance(student,root);
    if(!isStudentExist){
      const newStudent = document.createElement("student");
      newStudent.setAttribute("cne",student.cne);
      newStudent.setAttribute("cin",student.cin);
      const name = document.createElement("name");
      name.appendChild(document.createTextNode(student.name));
      const nickname = document.createElement("nickname");
      nickname.appendChild(document.createTextNode(student.nickname));
      const age = document.createElement("age");
      age.appendChild(document.createTextNode(student.age));
  
      newStudent.appendChild(name);
      newStudent.appendChild(nickname);
      newStudent.appendChild(age);
  
      root.appendChild(newStudent);
    }

    return isStudentExist;
  }
};
