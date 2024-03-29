var mysql = require("mysql"),
  db_name = "test"; //change db name in production

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected Successful");
  con.query("CREATE DATABASE if not exists " + db_name, function (err, result) {
    if (err) throw err;
    console.log("Database Created");
  });
});

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: db_name,
});

var createadmin =
  "CREATE TABLE if not exists admin (admin_ID VARCHAR(50) PRIMARY KEY,Username VARCHAR(50), password VARCHAR(50))";
con.query(createadmin, function (err, result) {
  if (err) throw err;
  console.log("Table admin created");
});
//course_id=
var createcourse =
  "CREATE TABLE if not exists course (Course_ID VARCHAR(50) PRIMARY KEY,Staff_ID VARCHAR(50), Course_Code VARCHAR(50), Course_Name VARCHAR(50), Semester INT(15),Year INT(15),Department VARCHAR(50),Regulation VARCHAR(50))";
con.query(createcourse, function (err, result, field) {
  if (err) throw err;
  console.log("Table course created");
});


var createstaff =
  "CREATE TABLE if not exists staff (Staff_ID VARCHAR(50) PRIMARY KEY,staff_name VARCHAR(50), Department VARCHAR(50), Role VARCHAR(50),Username VARCHAR(50), password VARCHAR(50))";
con.query(createstaff, function (err, result) {
  if (err) throw err;
  console.log("Table staff created");
});

//create student table
var createstudent =
  "CREATE TABLE if not exists student (Roll_no VARCHAR(50) PRIMARY KEY,student_name VARCHAR(50), Department VARCHAR(50), Semester INT,Year_of_study INT,Register_No VARCHAR(50))";
con.query(createstudent, function (err, result) {
  if (err) throw err;
  console.log("Table student created");
});


var exammarks =
  "CREATE TABLE if not exists exammarks (Course_Code VARCHAR(50), Regulation VARCHAR(50), Register_No VARCHAR(50),student_name VARCHAR(50),Department VARCHAR(50),Semester INT,Category varchar(50),Mark int,Staff_ID VARCHAR(50),Course_ID VARCHAR(50))";
con.query(exammarks, function (err, result) {
  if (err) throw err;
  console.log("Table exammarks created");
});
