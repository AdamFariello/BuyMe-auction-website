<!DOCTYPE HTML>
 
<html>
	<head>
		<title> Group 45- 336 Website Project Login Page </title>
   		<meta charset="UTF-8">
 		</head>
   
	<body>
		<!-- 
		<h1 style="text-align:center;">Login Page</h1>
		<form style="text-align:center;" action="validate.jsp" method= "post">
			<label for="uname">Username:</label><br>
        	<input type="text" name="uname""><br>
        	<label for="psswrd">Password:</label><br>
        	<input type="text" name="psswrd"><br><br>
        	<button>Login</button>
      		</form>
		  -->
		  
		<form style="text-align:center;" 
			  action="/cs336sample1/code/tools/profile.jsp" 
			  method= "post">
			<label for="user">Username:</label><br>
        	<input type="text" name="user""><br>
        	<label for="psswrd">Password:</label><br>
        	<input type="text" name="psswrd"><br><br>
        	<button>Login</button>
        	<input type="hidden" 
        		   name="profile" 
        		   value='user.star'>
      		</form>
		 
		<a href="/cs336sample1/code/endUser/register/register.jsp">
      	   New user? No problem sign up below!</a>
    	<br>
    	<a href="/cs336sample1/code/main/main.jsp">
      	   Not a user? Go back to portal</a>
      	<br>
		</body>
</html>