<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Rep Login Page</title>
</head>  <h1 style="text-align:center;"> Customer Rep Login Page</h1>
	<body>
		<form style="text-align:center;" 
			  action="checkCustRepLoginDetails.jsp" method= "post">
			<label for="uname">Username:</label><br>
			<input type="text" name="repuname""><br>
			<label for="psswrd">Password:</label><br>
			<input type="text" name="reppsswrd"><br><br>
			<button>Login</button>
			</form>
		<a href="/cs336sample1/code/main/main.jsp" 
		  text-align:center;> Back to main login page
		<br/>
	</body>
</html>