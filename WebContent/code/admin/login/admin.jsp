<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>
Welcome <%=session.getAttribute("admin")%> 
to the admin page
<a href='logout.jsp'>Log out</a>
      <h1 style="text-align:center;"> Register a new customer representative</h1>

<form style="text-align:center;" 
	  action="registercustomerrep.jsp" 
	  style="text-align:center;">
        <label for="fname">Customer Representative Username:</label><br>
        <input type="text" id="newcustuname" name="newcustuname"><br>
        <label for="lname">Customer Representative Password:</label><br>
        <input type="text" id="newcustpsswrd" name="newcustpsswrd"><br><br>
        <input type="submit" value="Enter">
      </form>
</body>
</html>