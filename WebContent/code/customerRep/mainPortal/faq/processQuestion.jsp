<%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<% 
	try {
	  	ApplicationDB db = new ApplicationDB();    
	    Connection connection = db.getConnection();    
	    
	    String question = request.getParameter("question");
	    String answer = request.getParameter("answer");
	    String statement = "UPDATE question "
	    				 + "SET questionReply = ? " 
	    				 + "WHERE question = ? ";
    	PreparedStatement ps = connection.prepareStatement(statement);
    	ps.setString(1, answer);
    	ps.setString(2, question);
    	ps.executeUpdate();
    	response.sendRedirect(
    		"/cs336sample1/code/customerRep/mainPortal/showallQuestions.jsp"
    	);
	} catch (Exception e) {
		out.println("Bad reply");
		out.println(e);
		out.println("<a href='submitQuestion.jsp'>try again</a>");
	}
%>