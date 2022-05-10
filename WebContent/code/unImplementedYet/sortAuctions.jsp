<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sort Auctions</title>
</head>
<body>
	<h2> List of all Auctions </h2>
	<div id="sortButtons">
		<form action='sortAuctionsCon.jsp'>
			
			<label for="sortAuctions">Sort Auctions By</label> <select name="sortAuctions"
				required>
				<option value="SortID" selected>Auction ID</option>
				<option value="SortCategory"> Category</option>
				<option value="SortGender">Gender</option>
				<option value="SortQuality">Quality</option>
				<option value="SortSize">Size</option>
				<option value="SortColor">Color</option>
				<option value="SortPrice">Price</option>
				<option value="SortEndTime">End Times</option>
			</select>
			
			<label for="orderBy">Order By</label> <select name="orderBy"
				required>
				<option value="ascending" selected>Ascending</option>
				<option value="descending">Descending</option>
			</select>
			<input type="submit" value="Sort Auctions" />
		</form>
		
	</div>
	
	<%
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String seller = session.getAttribute("user").toString();
		ResultSet result = null;
		try {
			out.println("<table border='1'>");
			
			String query = "SELECT * FROM item" + 
							"JOIN tag USING (itemID)" +
							"WHERE closingDate > mow() ORDER BY (itemID);";
			result = stmt.executeQuery(query);
			
			out.print("<table>");
			out.print("<tr>");
			out.print("<th>");
			out.print("Auction ID ");
			out.print("</th>");
			out.print("<th>");
			out.print("Category");
			out.print("</th>");
			out.print("<th>");
			out.print("Gender");
			out.print("</th>");
			out.print("<th>");
			out.print("Quality");
			out.print("</th>");
			out.print("<th>");
			out.print("Size");
			out.print("</th>");
			out.print("<th>");
			out.print("Color");
			out.print("</th>");
			out.print("<th>");
			out.print("Price");
			out.print("</th>");
			out.print("</tr>");
			
			while (result.next()) {
				String status1 = result.getString("status");

				out.print("<tr>");
				out.print("<td>");
				out.print(result.getInt("auction_id"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("category"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("gender"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("quality"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("size"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("color"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("price"));
				out.print("</td>");

				out.print("</tr>");
			}
			out.print("</table>");
			
		} catch (Exception e) {
			out.print(e);
		} finally {
			if (result != null)
				result.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		}
		
	%>

</body>
</html>