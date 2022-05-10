<%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 
	try {
		/*Setup*/
		//Connection 
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection connection = DriverManager.getConnection(
    			//"jdbc:mysql://localhost/auction?user=root&password=V0iceActre$$"
	    		"jdbc:mysql://localhost/auction?user=root&password=root"
    	);
	    
	    //General
	    String query;
	    PreparedStatement ps;
		String userid = request.getParameter("newcustuname");
	    String pwd = request.getParameter("newcustpsswrd");
	    
	   	/*Querys*/
	   	//User
	    query = "INSERT INTO user VALUES (?,?) ";
    	ps = connection.prepareStatement(query);
    	ps.setString(1, userid);
    	ps.setString(2, pwd);
    	ps.executeUpdate();
    	
    	//customerRep
    	query = "INSERT INTO customerRep VALUES (?) ";
    	ps = connection.prepareStatement(query);
    	ps.setString(1, userid);
    	ps.executeUpdate();
    	
    	response.sendRedirect("custrepregistrationSuccess.jsp");
	} catch (Exception e) {
		out.println(e);
    	response.sendRedirect("custrepregistrationFailed.jsp");
	}
%>