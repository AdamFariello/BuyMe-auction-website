 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 
	try {
		/*Conection Setup*/
		Class.forName("com.mysql.jdbc.Driver");
	    Connection connection = DriverManager.getConnection(
    		"jdbc:mysql://localhost/auction?user=root&password=root"
    	); 
	    String query; 
	    Statement statement = connection.createStatement();
	    ResultSet rs;
	    
		//Grabbing Input
		int itemID = Integer.parseInt(request.getParameter("itemID"));
		double bid = Double.parseDouble(request.getParameter("bid"));
		String userID = (String) session.getAttribute("user");
		
		//Grabing the maximum bid
		query = "Select MAX(b.bidAmount) "
			  + "FROM bid b, item i "
			  + "WHERE b.itemID = i.itemID AND " 
			  + "i.itemID = " +itemID;
		statement = connection.createStatement();
		rs = statement.executeQuery(query);
		rs.next();
		double maxBid = rs.getFloat(1);
		
		//Adding the mimmum increase to maximum bid to beat
		query = "Select minimumIncrease "
			  + "FROM item "
			  + "WHERE itemID = " +itemID;
		statement = connection.createStatement();
		rs = statement.executeQuery(query);
		rs.next();
		maxBid += rs.getFloat(1);
		
		//Figuring out if the bid is legal
		//It can be equal since
		if (bid >= maxBid) {
			query = "INSERT INTO bid(itemID, bidAmount, bidderUsername) "
				  + "VALUE (?, ?, ?) ";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, itemID);
			ps.setDouble(2, bid);
			ps.setString(3, userID);
			ps.executeUpdate();			
			response.sendRedirect("showAllBids.jsp");
		} else {
			out.println("bid too low or illegal");
		}
	} catch (Exception e) {
		out.println("Bad bid :)");
		out.println(e);
	}
%>