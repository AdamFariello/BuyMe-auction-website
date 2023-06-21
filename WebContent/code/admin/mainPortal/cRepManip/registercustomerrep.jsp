<%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>

<% 
	try {
		/*Setup*/
		//Connection 
	    ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();
	    
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
    	
    	out.println("customer representative has been registered");
    	out.print("login with it: ");
    	out.print("<a href='/cs336sample1/code/customerRep/custreplogin.jsp'>click here<br/>>");
    	out.println("Or go back: ");
    	out.print("<a href='/cs336sample1/code/admin/mainPortal/admin.jsp'>click here<br/>");
    	
	} catch (Exception e) {
		out.println(e);
    	response.sendRedirect("custrepregistrationFailed.jsp");
	}
%>