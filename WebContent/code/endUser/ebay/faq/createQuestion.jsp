 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 
	try {
		//Connection
		Class.forName("com.mysql.jdbc.Driver");
	    Connection connection = DriverManager.getConnection(
    		"jdbc:mysql://localhost/auction?user=root&password=root"
    	);
		
	    //Setup
		String question = request.getParameter("question");	        	
	    String statement = "INSERT INTO question(question) VALUES (?)";
    	PreparedStatement ps = connection.prepareStatement(statement);
    	ps.setString(1, question);
    	ps.executeUpdate();
    	response.sendRedirect("searchFAQ.jsp");
	} catch (Exception e) {
		out.println(e);
    	response.sendRedirect("insertquestionFailed.jsp");
	}
%>