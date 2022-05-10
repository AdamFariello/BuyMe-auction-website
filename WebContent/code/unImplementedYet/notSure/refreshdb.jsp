<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BuyMe</title>
</head>
<body>
<%
try{
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	Statement stmt = con.createStatement();
	PreparedStatement p = null;
	
	String query = "drop table if exists t1;";
	stmt.executeUpdate(query);
	
	query = "create temporary table t1 (SELECT * FROM auction WHERE endDate < now() and status = 'open');";
	stmt.executeUpdate(query);
	
	query = "UPDATE auction SET status = 'close' WHERE auctionID in (SELECT auctionID FROM t1);";
	stmt.executeUpdate(query);
	
	query = "UPDATE auction SET winner = 'No Winner' WHERE highest_bid < reservePrice and auctionID in (SELECT auctionID FROM t1);";
	stmt.executeUpdate(query);
	
	query = "SELECT * FROM t1 where highest_bid>reservePrice";
	ResultSet rs = stmt.executeQuery(query);
	
	while(rs.next()){
		String winMsg = "Congradulations for winning the "+ rs.getString("itemName");
		query = "INSERT INTO alert(username,message) "
				+ "VALUES(?,?)";
		p = con.prepareStatement(query);
		p.setString(1, rs.getString("winner"));
		p.setString(2, winMsg);
		//p.setInt(3, rs.getInt("itemID"));
		//p.setInt(4, rs.getInt("auctionID"));
		
		p.executeUpdate();
	}
	
	query = "drop table if exists t1;";
	stmt.executeUpdate(query);
	
	con.close();
} catch (Exception se) {
	se.printStackTrace();
}
%>
</body>
</html>