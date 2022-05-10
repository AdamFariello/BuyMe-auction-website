<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<button onclick="document.location='userAccount.jsp';">Home</button><br>
</div>
<h2 style="text-align:center;"> Similar Items</h2>
<%
try{
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	Statement stmt = con.createStatement();
	
	String item = request.getParameter("itemid");
	int itemID = Integer.parseInt(item);
	
	String query = "drop table if exists t4;";
	stmt.executeUpdate(query);
	
	query = "create temporary table t4 (SELECT * FROM item WHERE itemID ="+ itemID +");";
	stmt.executeUpdate(query);
	
	query = "SELECT * FROM auction a JOIN item i on i.itemID=a.itemID join t4 on i.category=t4.category and i.gender=t4.gender where status = 'open'";
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
	
	query = "drop table if exists t4;";
	stmt.executeUpdate(query);
	
	con.close();
} catch (Exception se) {
	se.printStackTrace();
}
%>
</body>
</html>