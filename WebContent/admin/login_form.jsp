<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
<script>
//입력한 정보가 db에 존재하는지 여부 요청!! 즉 로그인 요청!
	function login() {
		form1.action="/admin/login.jsp";
		form1.method="post";
		form1.submit();
	}
</script>
<body>

<form name="form1" style="border:1px solid #ccc">
  <div class="container">
    <h1>Web Admin Sign In</h1>
    <p>Please fill in this form to enter using this account.</p>
    <hr>

    <label for="email"><b>Id</b></label>
    <input type="text" placeholder="Enter your Id" name="mid" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

   <div class="clearfix">
      
      <button type="button" class="signinbtn" onclick="login()">Sign In</button>
    </div>
  </div>
</form>

</body>
</html>