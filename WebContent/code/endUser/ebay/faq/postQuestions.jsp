<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Questions</title>
</head>
<body>
<a href="/cs336sample1/code/endUser/ebay/defaultPage.jsp">HOME<br/> </a>
		<h1 style="text-align:center;"> Post a Question to Customer Service</h1>
		<div style="text-align:center;"> 
   <form action="createQuestion.jsp">
  <label for="fname">Question:</label><br>
  <input type="text" id="question" name="question"><br>
  
   <input type="submit" value="Enter">
  </form>
 </div>


</body>
</html>