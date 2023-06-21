<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>'
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<%
	try { 
	    ApplicationDB db = new ApplicationDB();
	    Connection connection = db.getConnection();
	    	    
	    /*Setup the query*/  
	    int itemID = Integer.parseInt(request.getParameter("itemID"));
	    String query = "SELECT b.bidderUsername, b.bidAmount "
	    			 + "FROM bid b, item i "
	    			 + "WHERE i.itemID = "+itemID+" "
	    			 +   "AND i.itemID = b.itemID "
	    			 + "ORDER BY bidAmount desc";
	    Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(query);
		
		/*Displaying the query*/
		out.println("<table border='1'>");
		
			//Displaying top Row
			out.print("<tr>");
				out.print("<td>");
					out.print("Bidder");
				out.print("</td>");
				
				out.print("<td>");
					out.print("Bid Amount");
				out.print("</td>");
			out.print("</tr>");	
		
			//Query
			while (rs.next()) {
				out.print("<tr>");	
					out.print("<td>");
						out.print(rs.getString(1));
					out.print("</td>");
				
					out.print("<td>");
						out.print(rs.getFloat(2));
					out.print("</td>");
				out.print("</tr>");	
			}
		out.println("</table>");	    
	} catch (Exception e) {
		out.println(e);
	}
%>