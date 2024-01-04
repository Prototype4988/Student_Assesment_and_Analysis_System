const { ADDRGETNETWORKPARAMS } = require("dns"),
  express = require("express"),
  query_js = require(__dirname + "/js/query"),
  session = require("express-session");
const cors = require("cors");
var array1 = new Array(4).fill(0);
var array2 = [];
var array3 = new Array(5).fill(0);
var array4 = new Array(5).fill(0);
var array5 = [];
const app = express(),
  path = require("path"),
  bodyParser = require("body-parser"),
  flash = require("connect-flash");

const swal = require("sweetalert2");
global.__basedir = __dirname;
app.use(cors());
app.set("view engine", "ejs");

app.use(express.static("public"));
app.use("/markk", express.static(path.join(__dirname, 'public2')));
app.get("/markk/:id/:idt", ensureAuthenticated, (req, res) => {
  
  var sql = "SELECT * from exammarks where Course_ID like ?";
  db.query(sql, [CID,typee], (err, results, fields) => {
    if (err)
      req.flash("message", []);
    else if (results.length != 0) req.flash("message", results);
    console.log(results);
    res.redirect("/markk");
  });
});
app.use("/chart", express.static(path.join(__dirname, 'methods-public')));
var mysql = require('mysql');
var con = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'test'
});
app.use(
  session({
    cookie: { maxAge: 500000 },
    secret: "woot",
    resave: false,
    saveUninitialized: false,
  })
);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(flash());

const passport = require("passport"),
  LocalStrategy = require("passport-local").Strategy;
const { nextTick } = require("process");

app.use(passport.initialize());
app.use(passport.session());

const db = query_js.db;
var staff_id = null,
  Username = null,
  updates = null,
  results = 0;

// error handling
passport.use(
  new LocalStrategy(function (Username, password, done) {
    db.query(
      "select * from staff where Username='" + Username + "'     ",
      function (err, user) {
        if (err) {
          return done(err);
        }
        if (!user) {
          return done(null, false, { message: "Incorrect user name" });
        } else if (user[0].password != password) {
          return done(null, false, { message: "Incorrect password" });
        }
        return done(null, user[0]);
      }
    );
  })
);

passport.serializeUser(function (user, done) {
  done(null, user.Username);
});

passport.deserializeUser(function (id, done) {
  // console.log(id);
  db.query(
    "select * from staff where Username='" + id + "'     ",
    function (err, user) {
      done(err, user[0]);
    }
  );
});

//Home Route
app.get("/", (req, res) => {
  res.render(path.join(__dirname, "/public/views/login"));
});

//Sign In Route
app.post(
  "/auth",
  passport.authenticate("local", {
    failureRedirect: "/",
    failureFlash: "Invalid Credentials",
  }),
  (req, res) => {
    query_js.check_admin_status(req.body.username, (result) => {
      redirect_page = "/" + req.body.usertype + "";
      Username = req.body.Username;
      return res.redirect(redirect_page);
    });
  }
);

var msg = 0;

//Admin Route
app.get("/admin", (req, res) => {
  if (!req.user) {
    // not logged-in
    res.redirect("/");
    return;
  }
  res.render(path.join(__dirname, "/public/views", "admin"));
});

//Staff Route
app.get("/staff", (req, res) => {
  if (!req.user) {
    // not logged-in
    res.redirect("/");
    return;
  }
  res.render(path.join(__dirname, "/public/views", "staff"));
});

// Authentication function
function ensureAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect("/");
}
app.get("/s_courses", function (req, res, next) {

  var usid = req.user.Username;
  if (!req.user) {
    // not logged-in
    res.redirect("/");
    return;
  }
  var sql = "select A.* from course A where A.Staff_ID in ( select B.Staff_ID from staff B where B.Username ='" + usid + "'     )";
  db.query(sql, function (err, data, fields) {
    if (err) throw err;
    res.render("s_courses", { title: "CourseList", userData: data });
  });
});

app.get("/marks_display/:id", ensureAuthenticated, (req, res) => {
  CID = req.params.id;
  // console.log(CID);
  var sql = "SELECT * from exammarks where(Course_ID = ? and category = ?)";
  db.query(sql, [CID,typee], (err, results, fields) => {
    if (err)
      req.flash("message", []);
    else if (results.length != 0) req.flash("message", results);
    // console.log(results);
    res.redirect("/marks_display");
  });
});
//Courses Table Route
app.get("/course_table/", ensureAuthenticated, (req, res) => {
  dept = req.params.id;
  var sql = "SELECT * from course";
  db.query(sql, (err, results, fields) => {
    if (err)
      //throw err;
      req.flash("message", []);
    else if (results.length != 0) req.flash("message", results);
    // console.log(results);
    res.redirect("/course_display");
  });
});
// var url = require('url');
// var url_parts = url.parse(request.url, true);
// var query = url_parts.query;
// console.log(query);
var cid;
app.get('/value', function (req,res) {
	cid = req.query.cid;
	console.log(cid);
	res.redirect("/markk");
});

app.get('/data', function (req, res) {
	
  con.query(`select Course_Code,Register_No,student_name,Department,Category,Mark from exammarks where Course_ID like '${cid}%'`, function (err, rows) {
    if (err) console.log(err);

    res.send(rows);
  });
});


app.post('/data', function (req, res) {
  var data = req.body;
  var mode = data["!nativeeditor_status"];
  var sid = data.gr_id;
  var tid = sid;
  var register_no = data.Register_No;
  var course_id = data.Course_Code;
  var semester = data.Semester;
  var marks = data.Mark;
  var category = data.Category;

  function update_response(err, result) {
    if (err) {
      console.log(err);
      mode = "error";
    }
    else if (mode == "inserted") {
      tid = result.insertId;
    }

    res.setHeader("Content-Type", "text/xml");
    res.send("<data><action type='" + mode + "' sid='" + sid + "' tid='" + tid + "'/></data>");
  }

  if (mode == "updated")
    con.query("UPDATE exammarks SET Mark = ? WHERE Register_No = ? and Course_Code=?",
      [marks, register_no, course_id],
      update_response);
  else if (mode == "inserted")
    con.query("INSERT INTO exammarks (course_id,register_no,semester,category,marks) VALUES (?,?,?,?,?)",
      [course_id, register_no, semester, category, marks],
      update_response);
  else if (mode == "deleted")
    con.query("DELETE FROM student WHERE register_no = ? and course_id=?", [register_no, course_id], update_response);
  else
    res.send("Not supported operation");
});

app.get('/get-val', function (req, res) {
	array1.fill(0);
    
	
  var myText = req.query.code;
var cat = req.query.cat;
  console.log(myText); //mytext is the name of your input box 

  con.query(`select Mark from exammarks where Course_Code='${myText}' and Regulation='2017' and Department='CSE'  and Category = '${cat}'`, function (err, result, fields) {
    if (err) throw err;
    var len = result.length;
    console.log(len);
    for (var i = 0; i < len; i++) {
      var a;
      if (result[i].Mark <50) {

        array1[0] = array1[0] + 1;
      }
      else if (result[i].Mark >=50 && result[i].Mark <=70) {

        array1[1] = array1[1] + 1;

      }
      else if (result[i].Mark >70 && result[i].Mark <=90) {

        array1[2] = array1[2] + 1;

      }
      else if (result[i].Mark >90 && result[i].Mark <= 100) {

        array1[3] = array1[3] + 1;

      }



    }




  });
  return res.redirect("/chart");
});

app.get('/get-mark', function(req, res){  
    array2.length=0;
    array5.length=0;
    var myreg = req.query.mark;
    var sem = req.query.sem;
	var cat = req.query.cat;
  db.query(`SELECT distinct Mark,Course_Code FROM exammarks WHERE Register_No='${myreg}' and Semester='${sem}' and Category = '${cat}'`, function (err, result, fields) {
    if (err) throw err;
   var len4 = result.length;
    console.log(result);
    for(var i=0;i<len4;i++)
    {
        array2[i] = result[i].Mark;
        array5[i] = result[i].Course_Code
    }
    
    console.log(array2);
    console.log(array5);

    
  
});
   return res.redirect("/chart");
});  
app.get('/get-top', function (req, res) {
array3.length=0;
    array4.length=0;
  var mysub = req.query.subject;
  var cat = req.query.cat;
  con.query(`SELECT student_name,Mark FROM exammarks  WHERE Course_Code = '${mysub}' and Category ='${cat}' ORDER BY Mark DESC LIMIT 5`, function (err, result, fields) {
    if (err) throw err;
    var len2 = result.length;
    console.log(len2);
    for (var i = 0; i < len2; i++) {
      array3[i] = result[i].Mark;
      array4[i] = result[i].student_name
    }

    console.log(array3);
    console.log(array4);



  });
  return res.redirect("/chart");
});

var jsonval = {
  "marks": array3,
  "label": array4
}
var jsonval2 = {
  "marks2":array2,
  "label2":array5
}


app.get('/sample-api', (req, res) => {
  res.send(array1);
});
app.get('/sample-api2', (req, res) => {
    res.json(jsonval2);
});
app.get('/sample-api3', (req, res) => {
  res.json(jsonval);
});

//db-Generate Route
require("./js/db.js");

//Excel-Upload Route
require("./public/routes/excel/upload.js")(app, db, query_js);

//Courses-Admin Route
require("./public/routes/admin/courses.js")(app, db, query_js);

//Staffs-Admin Route
require("./public/routes/admin/staffs.js")(app, db, query_js);

//Marks-Admin Route
require("./public/routes/admin/marks.js")(app, db, query_js);

//Students-Admin Route
require("./public/routes/admin/students.js")(app, db, query_js);

//Logout Route
require("./public/routes/logout.js")(app);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(PORT));
