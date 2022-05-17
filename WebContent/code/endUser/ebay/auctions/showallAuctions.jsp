<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<a href="success.jsp" >HOME<br/> </a>

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
   		"jdbc:mysql://localhost/auction?user=root&password=root"
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
					int itemID 		  = rs.getInt(1);
					String itemname   = rs.getString(2);
					String vendorname = rs.getString(3);
					String cap 		  = rs.getString(4);
					String cdate 	  = rs.getString(5);
					//float maxBid 	  = rs.getFloat(6);
					String maincat 	  = rs.getString(7);
					String subcat 	  = rs.getString(8);
					String tags 	  = rs.getString(9); 
			
					out.print("<form action='auctionhistory.jsp'>_");
					out.print("<input type='hidden' id='itemID' name='itemID' value='"); 
						out.print(itemID);
					out.print("'>");
					
					out.print("<input type='hidden' id='custId' name='custId' value='"); 
						out.print(itemname);
					out.print("'>");
					
					out.print("<input type='hidden' id='vendor' name='vendor' value='"); 
						out.print(vendorname);
					out.print("'>");
					
					out.print("<input type='hidden' id='caption' name='caption' value='"); 
						out.print(cap);
					out.print("'>");
					
					out.print("<input type='hidden' id='closedate' name='closedate' value='"); 
						out.print(cdate);
					out.print("'>");
					
					out.print("<input type='hidden' id='maincat' name='maincat' value='"); 
						out.print(maincat);
					out.print("'>");
					
					out.print("<input type='hidden' id='subcat' name='subcat' value='"); 
						out.print(subcat);
					out.print("'>");
					
					out.print("<input type='hidden' id='tags' name='tags' value='"); 
						out.print(tags);
					out.print("'>");
					out.print("<input type='submit' value='Enter'>");
					out.print("</form>");
				out.print("</td>");
			out.print("</tr>");	
		}
	out.println("</table>");
	rs.close();
	connection.close();
} catch (Exception e) {
	out.println(e);
}
%>