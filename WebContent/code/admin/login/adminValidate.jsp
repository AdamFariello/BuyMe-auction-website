 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>


<% 
try {
    ApplicationDB db = new ApplicationDB();
    Connection connection = db.getConnection();
	    
    String userid = request.getParameter("uname");
    String pwd = request.getParameter("psswrd");

   	String query = "SELECT * " 
   			 	 + "FROM user u, admin a "
   			 	 + "WHERE u.username = '" +userid+"' "
   			 	 + "AND   u.password = '" +pwd	 +"' "
   			 	 + "AND   a.username = '" +userid+"' "
   	;
    Statement statement = connection.createStatement();
   	ResultSet rs = statement.executeQuery(query);	  
   	if (rs.next()) {
		session.setAttribute("admin", userid);
        response.sendRedirect("/cs336sample1/code/admin/mainPortal/admin.jsp");
    } else {
        out.println("Invalid password <a href='adminLogin.jsp'>try again</a>");
    }
} catch (Exception e) {
	out.println(e);
}
%>