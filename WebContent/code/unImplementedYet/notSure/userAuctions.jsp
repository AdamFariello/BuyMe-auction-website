<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Auctions</title>
</head>
<body>
<div>
<button onclick="document.location='userAccount.jsp';">Home</button><br>
</div>
<h2 style="text-align:center;"> My Auctions</h2>

<%
try{
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	Statement stmt = con.createStatement();
	String seller = session.getAttribute("user").toString();
	
	String query = "SELECT * FROM auction WHERE vendor= '" + seller + "' ORDER BY (auctionID)";
	ResultSet rs = stmt.executeQuery(query);
	
	out.print("<center>");
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Product Name");
	out.print("</th>");
	out.print("<th>");
	out.print("Highest Bid");
	out.print("</th>");
	out.print("<th>");
	out.print("Reserve Price");
	out.print("</th>");
	out.print("<th>");
	out.print("Minimum Increment");
	out.print("</th>");
	out.print("<th>");
	out.print("Winner");
	out.print("</th>");
	out.print("<th>");
	out.print("End Date");
	out.print("</th>");
	out.print("<th>");
	out.print("Status");
	out.print("</th>");
	out.print("</tr>");
	
	while(rs.next()){
		out.print("<tr>");
		out.print("<th>");
		out.print(rs.getString("itemName"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getFloat("highest_bid"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getFloat("reservePrice"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getFloat("minInc"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getString("winner"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getTimestamp("endDate"));
		out.print("</th>");
		out.print("<th>");
		out.print(rs.getString("status"));
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