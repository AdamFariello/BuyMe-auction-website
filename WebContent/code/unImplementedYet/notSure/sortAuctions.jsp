<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sort Auctions</title>
</head>
<body>
<div>
<button onclick="document.location='userAccount.jsp';">Home</button><br>
</div>
<h2 style="text-align:center;"> Sort Auctions:</h2>
	<div>
		<form action='sortAuctionsCon.jsp' style="text-align:center;">
			
			<label for="sortAuctions">Sort Auctions By:</label> <select name="sortAuctions"
				required>
				<option value="SortCategory"> Category</option>
				<option value="SortGender">Gender</option>
				<option value="SortQuality">Quality</option>
				<option value="SortSize">Size</option>
				<option value="SortColor">Color</option>
				<option value="SortPrice">Price</option>
				<option value="SortEnd">End Time</option>
			</select>
			
			
			<label for="orderBy">Order By</label> <select name="orderBy"
				required>
				<option value="ascending" selected>Ascending</option>
				<option value="descending">Descending</option>
			</select>
			
			<input type="submit" value="Sort" />
		</form>
	</div>
	
		<%
try{
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	Statement stmt = con.createStatement();
	String curuser = session.getAttribute("user").toString();
	
	String query = "SELECT * FROM auction JOIN item USING (itemID) where status = 'open';";
	

	ResultSet rs = stmt.executeQuery(query);
	out.print("<center>");
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
	out.print("Current Bid");
	out.print("</th>");
	out.print("<th>");
	out.print("End Time");
	out.print("</th>");
	out.print("</tr>");
	
	while(rs.next()){
		out.print("<tr>");
		out.print("<th>");
		out.print(rs.getInt("auctionID"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getString("category"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getString("gender"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getString("quality"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getString("size"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getString("color"));
		out.print("</th>");
		out.print("<th>");
		out.print("$" + rs.getFloat("highest_bid"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getTimestamp("endDate"));
		out.print("</th>");
		out.print("</tr>");
	}
	out.print("</table>");
	out.print("</center>");
	
	con.close();
} catch (Exception e){
	out.println(e);
}
%>
</body>
</html>