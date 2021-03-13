const {addStudent,updateStudent} = require("./items/students");
const XMLNode = require("./helper/XMLNode").XMLNode;
const DOMParser = require("xmldom").DOMParser;
const path = require("path");
const basePath = path.resolve("db","students.xml");
const fs = require("fs");

function getDocumentElement(xmlFileContent){
    let doc = new DOMParser().parseFromString(xmlFileContent+"",'text/xml');
    return {root: new XMLNode(doc.documentElement),document:doc};
}

module.exports = {
    updateStudent(student,cb){
        fs.readFile(basePath,function(err,data){
            let isStudentFound = false;
            if(!err){
                const {root,document} = getDocumentElement(data);
                let students = root.extractChildren();
                for (let i = 0; i < students.length; i++) {
                    let currStudent = students[i];
                    if(currStudent.extractAttribute("cne") == student.cne){
                        isStudentFound = true;
                        updateStudent(student,currStudent,document);
                    }
                }
                cb(document,isStudentFound);
            }
        })
    },
    addStudent(student,cb){
        fs.readFile(basePath,function(err,data){
            if(!err){
                const {root,document} = getDocumentElement(data);
                let isStudentExist = addStudent(student,root,document);
                cb(document,isStudentExist);
            }
        })
    },
    deleteStudent(cne,cb){
        let isStudentDeleted = false;
        fs.readFile(basePath,function(err,data){
            if(!err){
                const {root,document} = getDocumentElement(data);
                
                let students = root.extractChildren();
                for (let i = 0; i < students.length; i++) {
                    let currStudent = students[i];
                    if(currStudent.extractAttribute("cne") == cne){
                        currStudent.deleteNode();
                        isStudentDeleted = true;
                    }
                }
                cb(document,isStudentDeleted);
            }
        })
    },
    
}