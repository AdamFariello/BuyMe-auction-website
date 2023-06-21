<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Alerts</title>
</head>
<body>
<div>
<button onclick="document.location='userAccount.jsp';">Home</button><br>
</div>
<h2 style="text-align:center;"> My Alerts</h2>
<%
try{
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	Statement stmt = con.createStatement();
	String user = session.getAttribute("user").toString();
	
	String query = "SELECT * FROM alert WHERE username='"+user+"';";
	ResultSet rs = stmt.executeQuery(query);
	
	out.print("<center>");
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Alert ID ");
	out.print("</th>");
	out.print("<th>");
	out.print("Alert Message");
	out.print("</th>");
	out.print("</tr>");
	
	while (rs.next()) {
		out.print("<tr>");
		out.print("<td>");
		out.print(rs.getInt("alertID"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("message"));
		out.print("</td>");
		out.print("</tr>");
	}
	
	out.print("</table>");
	out.print("</center>");
	
	con.close();
} catch (Exception se) {
	se.printStackTrace();
}
%>
</body>
</html>