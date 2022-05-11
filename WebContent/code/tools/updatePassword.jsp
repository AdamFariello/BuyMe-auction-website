<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
<%@ page import="com.cs336.pkg.ApplicationDB" %>

<% 
try {
	//Connection
	ApplicationDB db = new ApplicationDB();    
	Connection connection = db.getConnection();   
	String query;
	Statement statement = connection.createStatement();
	PreparedStatement ps;
	
} catch (Exception e) {
	out.println(e);
}
%>