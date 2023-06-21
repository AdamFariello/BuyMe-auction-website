<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Products</title>
</head>
<body>
<div>
<button onclick="document.location='searchProducts.jsp';">Back</button><br>
</div>
<%
try{
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();

	String user = session.getAttribute("user").toString();
	List<Object> parameters = new ArrayList<Object>();
		
	StringBuilder query = new StringBuilder("SELECT * FROM item i JOIN auction a ON i.itemID=a.itemID WHERE ");
	if(!request.getParameter("category").isEmpty()){
		parameters.add(request.getParameter("category"));
		query.append(" category = ?");
	}
	
	if(!request.getParameter("gender").isEmpty()){
		parameters.add(request.getParameter("gender"));
		query.append(" AND gender = ?");
	}
		
	if(!request.getParameter("quality").isEmpty()){
		parameters.add(request.getParameter("quality"));
		query.append(" AND quality = ?");
	}
		
	if(!request.getParameter("size").isEmpty()){
		parameters.add(request.getParameter("size"));
		query.append(" AND size = ?");
	} 
		
	if(!request.getParameter("color").isEmpty()){
		parameters.add(request.getParameter("color"));
		query.append(" AND color = ?");
	}
	
	if(!request.getParameter("price").isEmpty()){
		Float price2 = Float.valueOf(request.getParameter("price"));
		parameters.add(price2);
		query.append(" AND highest_bid < ?");
	}
	
	String queryf = query.toString();
	
	PreparedStatement p = con.prepareStatement(queryf);
	int i = 1;
	for (Object parameter : parameters) {
	    p.setObject(i++, parameter);
	}
	
	ResultSet rs = p.executeQuery();
	
	out.print("<center>");
	out.print("<table>");
	out.print("<tr>");
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
	
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>");
		out.print(rs.getString("category"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("gender"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("quality"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("size"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("color"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getFloat("price"));
		out.print("</td>");
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