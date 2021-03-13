const { updateStudent, addStudent, deleteStudent } = require("../../dao/index");
const Student = require("./student.model");
const { writeToFile } = require("../../utils/index");
const path = require("path");
const basePath = path.resolve("db", "students.xml");

module.exports = {
  updateStudent(req, res) {
    const cne = req.body.cne;
    const cin = req.body.cin;
    const name = req.body.name;
    const nickname = req.body.nickname;
    const age = req.body.age;

    updateStudent(
      new Student(cne, cin, name, nickname, age),
      function (newDocument,isStudentFound) {
        writeToFile(basePath, newDocument);
        if(isStudentFound){
            res.status(200).send("XML file updated successfuly");
            return;
        }
        res.status(404).send("There was an error while updating the student");
      }
    );
  },
  addStudent(req, res) {
    const cne = req.body.cne;
    const cin = req.body.cin;
    const name = req.body.name;
    const nickname = req.body.nickname;
    const age = req.body.age;

    if(!cne || !cin || !nickname || !name || !age){
      res.status(400).send("Invalid input");
      return;
    }

    addStudent(
      new Student(cne, cin, name, nickname, age),
      function (newDocument,isStudentExist) {
        writeToFile(basePath, newDocument);

        if(!isStudentExist){
          res.status(200).send("XML file updated successfuly");
          return;
        }
        res.status(400).send("Student with thid CNE already exist");
      }
    );
  },
  deleteStudent(req, res) {
    const cne = req.params.cne;
    deleteStudent(cne, function (newDocument,isStudentDeleted) {
      writeToFile(basePath, newDocument);
      if(isStudentDeleted){
        res.sendFile(path.resolve("db","students.xml"));
        return;
      }
      res.status(404).send("There was an error while deleting the student");
    });
  },
};
