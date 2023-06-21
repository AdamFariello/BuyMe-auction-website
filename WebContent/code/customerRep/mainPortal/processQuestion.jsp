<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Auctions</title>
</head>
<body>
<div>
<a href="successcustomerrep.jsp" >HOME<br/> </a>

</div>
</body>
</html>

<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	    Connection connection = DriverManager.getConnection(
    			"jdbc:mysql://localhost/auction?user=root&password=root"
    			//"jdbc:mysql://localhost/auction?user=root&password=V0iceActre$$"
    	); 
		String query;
	    Statement statement;
		out.println("<table border='1'>");		
			//Top row
			out.print("<tr>");
				String [] temp = {
					"itemName", "vendorName", "caption", 
					"closingDate", "current bid", 
					"main category", "sub category", "tags", " "
				};
			
				for (int i = 0; i < temp.length; i++) {
					//make a column
					out.print("<td>");
						out.print(temp[i]);
					out.print("</td>");
				}
			out.print("</tr>");	
			
			//Rest of the rows
			//TODO when searches become more indepth, make alts where WHERE is and not used
			//TODO replace imageName with price
			query = "SELECT i.itemID, i.itemName, i.vendorName, i.caption, i.closingDate, "
					  +		   "max(b.bidAmount), "
			       	  +		   "c.mainCategory, c.subCategory, "
			       	  +		   "("
			       	  +		   " SELECT group_concat(CONCAT(tagType, ':', tagValue) SEPARATOR', ') AS tags "
			       	  +		   " FROM tag "
			       	  +		   " WHERE itemID = i.itemID"
			       	  +		   ")"
			       	  + "FROM item i, category c, tag t, bid b "
					  + "WHERE c.categoryID = i.categoryID AND i.itemID = t.itemID AND b.itemId = i.itemID "
					  + "GROUP BY i.itemID"
			;
			
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			ResultSetMetaData metadata = rs.getMetaData();
			int columns = metadata.getColumnCount();
			while(rs.next()) {				
				out.print("<tr>");	
					//It starts at 2 to skip itemID
					for (int i = 2; i < columns + 1; i++) {					 
						out.print("<td>");
							out.print((String) rs.getString(i));
						out.print("</td>");	
					}
				
					out.print("<td>");
						//Entry 6 is skipped since it's the maximum bid
						
				out.print("</tr>");	
			}
		out.println("</table>");
		rs.close();
		connection.close();
	} catch (Exception e) {
		out.println(e);
	}
%>