 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<% 
	/*Setup*/
	//Connection
	ApplicationDB db = new ApplicationDB();
	Connection connection = db.getConnection();
	
	//General
	String query;
	String userName = (String) session.getAttribute("user");
	int itemID = Integer.parseInt(request.getParameter("itemID"));;
	double bidLimit = Double.parseDouble(request.getParameter("bidLimit"));
	double bidIncrement = Double.parseDouble(request.getParameter("bidIncrement"));
	
	//Figure out if it was already done
	query = "SELECT * "
		  + "FROM autoBid " 
		  + "WHERE username = '" +userName+ "' AND itemID = "+itemID;
	Statement statement = connection.createStatement();
	ResultSet rs = statement.executeQuery(query);
	if (rs.next()) {
		//User has setup a autoBid
		query = "UPDATE autoBid "
			  + "SET bidLimit = ?, bidIncrement = ? " 
			  + "WHERE username = ? AND itemID = ? ";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setDouble(1, bidLimit);
		ps.setDouble(2, bidIncrement);
		ps.setString(3, userName);
		ps.setInt(4, itemID);
		ps.executeUpdate();			
	} else {
		//User has not setup a autoBid
		query = "INSERT INTO autoBid VALUE(?, ?, ?, ?) ";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, userName);
		ps.setInt(2, itemID);
		ps.setDouble(3, bidLimit);
		ps.setDouble(4, bidIncrement);
		ps.executeUpdate();		
	}
%>