 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<% 
try { 
	//Setup
	ApplicationDB db = new ApplicationDB();
	Connection connection = db.getConnection();

    String query;
    PreparedStatement ps;
    
    //user
    String userid = request.getParameter("newuname");
    String pwd = request.getParameter("newpsswrd");
    query = "INSERT INTO user(username, password) VALUES (?,?)";
   	ps = connection.prepareStatement(query);
   	ps.setString(1, userid);
   	ps.setString(2, pwd);
   	ps.executeUpdate();

   	//endUser
   	query = "INSERT INTO endUser VALUES (?) ";
    ps = connection.prepareStatement(query);
   	ps.setString(1, userid);
   	ps.executeUpdate();
   	
   	response.sendRedirect("success.jsp");
} catch (Exception e) {
	out.println(e);
   	response.sendRedirect("fail.jsp");
}
%>