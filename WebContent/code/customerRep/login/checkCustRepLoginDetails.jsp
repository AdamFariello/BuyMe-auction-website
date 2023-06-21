 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<% try {
	    //TODO change username and password to not hardcoded
	    /*Connection Setup*/
	  	ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();
		
	    /*query*/
	    String userid = request.getParameter("repuname");
	    String pwd = request.getParameter("reppsswrd");
	     
	    String query = "SELECT * "
	    			 + "FROM user u, customerRep c "
	    			 + "WHERE u.username = '" +userid+"' "
	    			 + "  AND u.password = '" +pwd+    "' "
	    	    	 + "  AND c.username = '" +pwd+    "' "
	    ;
	    Statement statement = connection.createStatement();
    	ResultSet rs = statement.executeQuery(query);
    	if (rs.next()) {
            session.setAttribute("custrep", userid); 
            response.sendRedirect(
           		"/cs336sample1/code/customerRep/mainPortal/successcustomerrep.jsp"
            );
        } else {
            out.println("Invalid password ");
            out.print("<a href='custreplogin.jsp'>try again</a>");
        }
	} catch (Exception e) {
		out.println(e);
	}
%>