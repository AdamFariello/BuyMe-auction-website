<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filtered products list</title>
</head>
<body>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	String user = session.getAttribute("user").toString();
	List<Object> parameters = new ArrayList<Object>();
	
	try {
		String gender1, quality1, size1, color1;
		
		String category1 = request.getParameter("category");
		if(!request.getParameter("category").isEmpty()){
			int category2 = Integer.parseInt(category1);
			parameters.add(category2);
		}else {
			category1 = null;
		} 
		
		if(!request.getParameter("gender").isEmpty()){
			gender1 = request.getParameter("gender");
			parameters.add(gender1);
		}else  {
			gender1 = null;
		} 
		
		if(!request.getParameter("quality").isEmpty()){
			quality1 = request.getParameter("quality");
			parameters.add(quality1);
		}else  {
			quality1 = null;
		}
		
		if(!request.getParameter("size").isEmpty()){
			size1= request.getParameter("size");
			parameters.add(size1);
		}else  {
			size1 = null;
		} 
		
		if(!request.getParameter("color").isEmpty()){
			color1= request.getParameter("color");
			parameters.add(color1);
		}else  {
			color1 = null;
		} 
		
		String price1 = request.getParameter("price");
		if(price1.isEmpty()){
			price1 = "0";
		}else{
			Float price2 = Float.parseFloat(price1);
			parameters.add(price2);
		}
		
		StringBuilder query = new StringBuilder("SELECT * FROM item JOIN tag ON item.itemID=tag.itemID WHERE ");
		if (!request.getParameter("category").isEmpty()) {
		    query.append(" categoryID = ?");
		}
		if (!request.getParameter("gender").isEmpty()) {
		    query.append(" AND gender = ?");
		}
		if (!request.getParameter("quality").isEmpty()) {
		    query.append(" AND quality = ?");
		}
		if (!request.getParameter("size").isEmpty()) {
		    query.append(" AND size = ?");
		}
		if (!request.getParameter("color").isEmpty()) {
		    query.append(" AND color = ?");
		}
		if (!request.getParameter("price").isEmpty()) {
		    query.append(" AND reservePrice < ?");
		}
		String realQuery = query.toString();
		stmt = con.prepareStatement(realQuery);
		PreparedStatement ps3 = null;
		ps3 = con.prepareStatement(realQuery);
		int i = 1;
		for (Object parameter : parameters) {
		    ps3.setObject(i++, parameter);
		}
		result=ps3.executeQuery();
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

		while (result.next()) {
			out.print("<tr>");
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
			out.print(result.getFloat("price"));
			out.print("</td>");
			
			String status1 = result.getString("status");

		}

		out.print("</table>");

	}

	catch (Exception e) {
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