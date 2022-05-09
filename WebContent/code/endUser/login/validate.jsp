 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>

<% try {
		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();
	    
	    String userid = request.getParameter("uname");
	    String pwd = request.getParameter("psswrd");
    	String query = "SELECT * " 
    			 	 + "FROM user u, endUser e "
    			 	 + "WHERE u.username = '" +userid+"' "
    			 	 + "AND   u.password = '" +pwd	 +"' "
    			 	 + "AND   e.username = '" +userid+"' "
    	;
	    Statement statement = connection.createStatement();
    	ResultSet rs = statement.executeQuery(query);	  
    	
    	if (rs.next()) {
    		session.setAttribute("user", userid);
            response.sendRedirect("/cs336Sample1/code/endUser/ebay/defaultPage.jsp");
        } else {
            out.println("Invalid password <a href='login.jsp'>try again</a>");
        }
	} catch (Exception e) {
		out.println(e);
	}
%>