const express = require("express");
const router = express.Router();
const path = require("path");
const {updateStudent} = require("./students.controllers.js");

router.get("/",(req,res) => {
    res.sendFile(path.resolve("db","students.xml"));
  })
  .get("/:slug",(req,res) => {
    res.send(req.params.slug+" "+req.query.search_by);
  })
  .put("/",updateStudent)

module.exports = router
