<%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 
	try {
	    String bidID = request.getParameter("bidID");
	    //String userid = "test";
	    //String pwd = "test";
	        	
	  	Class.forName("com.mysql.jdbc.Driver");

	    Connection connection = DriverManager.getConnection(
    			//"jdbc:mysql://localhost/auction?user=root&password=V0iceActre$$"
	    		"jdbc:mysql://localhost/auction?user=root&password=root"
    	); 
	    String statement = "DELETE FROM bid WHERE bidID =" + bidID + "" ;
    	PreparedStatement ps = connection.prepareStatement(statement);

    	
    	ps.executeUpdate();
    	
    	
    	response.sendRedirect("deletebidSuccess.jsp");
	} catch (Exception e) {
		out.println(e);
    	response.sendRedirect("deletebidFailed.jsp");
	}
%>