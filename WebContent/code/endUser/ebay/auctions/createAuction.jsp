 <%@ page import ="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% try {
		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();

	    /*Auction table*/
	    String userid 				 = (String)session.getAttribute("user");
	    String itemName   			 = request.getParameter("brand");
	    String caption	  			 = request.getParameter("s-descrip");   
	    double id_startingPrice 	 = Double.parseDouble(request.getParameter("id_startingPrice"));   
	    double id_minimumPrice 		 = Double.parseDouble(request.getParameter("id_minimumPrice"));   
	    double id_minimumBidIncrease = Double.parseDouble(request.getParameter("id_minimumBidIncrease"));
	    
	    String stringDate  = request.getParameter("closingdate");
	    SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
	    Date dt  = d.parse(stringDate);
	    java.sql.Date closingDate = new java.sql.Date(dt.getTime()); 
	  	
	    String categoryID;
	    
	    /*Tag table*/
	    String itemID;
	    String tagGender  = request.getParameter("gendersection");
	    String tagQuality = request.getParameter("quality");
	    String tagSize	  = request.getParameter("size");
	    String tagColor	  = request.getParameter("color");
	    
	    /*Query*/
	    String query; 
	    Statement statement = connection.createStatement();
	    ResultSet rs;
	    PreparedStatement ps;
	    
	    //TODO Check if all full	[Skip]
	    //TODO Check if categoryID is real [skip] 
	    
	    //Get categoryID
	    //rs.getString(0) = 
	    //	java.sql.SQLException: Column Index out of range, 0 < 1.
	    query = "SELECT categoryID FROM category "
	    	  + "WHERE mainCategory = \"clothes\""
	    	  + "AND subCategory = \"blouse\"";
    	rs = statement.executeQuery(query);
    	rs.next();
    	categoryID = rs.getString(1);
    	
	    //Create item and use categoryID
	    query = "INSERT INTO item"
	    	  + "(vendorName, itemName, caption, closingDate, minimumIncrease, reservePrice, categoryID) "
	    	  + "values (?, ?, ?, ?, ?, ?, ?)";
	    ps = connection.prepareStatement(query);
	    ps.setString(1, userid);
	    ps.setString(2, itemName);
	    ps.setString(3, caption);
	    ps.setDate(4, closingDate);
	    ps.setDouble(5, id_minimumBidIncrease);
	    ps.setDouble(6, id_minimumPrice);
	    ps.setString(7, categoryID);
    	ps.executeUpdate();
    	
    	//Retrieve itemId
    	query = "SELECT itemID FROM item "
	    	  + "WHERE itemName    = \"" +itemName   + "\""
	    	  + "AND   caption     = \"" +caption    + "\""
   			  + "AND   closingDate = \"" +closingDate+ "\""
			  + "AND   categoryID  = \"" +categoryID + "\"";
    	rs = statement.executeQuery(query);
    	rs.next();
    	itemID = rs.getString(1);
    	
	    //Create tag id using itemId
	    //1, 4, 7, and 10 are coverd by for loop
	    query = "INSERT INTO tag values "
	    	  + "(?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?)";  
	    ps = connection.prepareStatement(query);
	    for (int i = 0; i < 4; i++) 
	    	ps.setString(3*i + 1, itemID);	
	    ps.setString(2, "Gender");
	    ps.setString(3, tagGender);
	    ps.setString(5, "Quality");
	    ps.setString(6, tagQuality);
	    ps.setString(8, "Size");
	    ps.setString(9, tagSize);
	    ps.setString(11, "Color");
	    ps.setString(12, tagColor);
    	ps.executeUpdate();    

        //Insert into bid
        query = "INSERT INTO bid (itemID, bidAmount, bidderUsername) " 
        	  + "VALUE (?, ?, ?) ";
        ps = connection.prepareStatement(query);
        ps.setString(1, itemID);
        ps.setDouble(2, id_startingPrice);
        ps.setString(3, userid);
        ps.executeUpdate();
        
        //inserting item into openAuction
        query = "INSERT INTO openAuction VALUE (?) ";
        ps = connection.prepareStatement(query);
        ps.setString(1, itemID);
        ps.executeUpdate();
        
    	connection.close();
        rs.close();
        response.sendRedirect("showallAuctions.jsp");
	} catch (Exception e) {
		out.println("Something went wrong :(");
		out.println("<a href='newAuction.jsp'>try again</a> <br>");
		out.println(e);
	}
%>