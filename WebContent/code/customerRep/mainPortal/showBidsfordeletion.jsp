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
<title>Show all Customer Questions</title>
</head>
<body>
<a href="successcustomerrep.jsp" >HOME<br/> </a>


		<h1 style="text-align:center;"> Customer's Questions</h1>


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
			out.print("<tr>");
				String [] temp = {
					"ItemID", "bidID", "bidAmount", "bidderUsername"," "
				};
			
				for (int i = 0; i < temp.length; i++) {
					//make a column
					out.print("<td>");
						out.print(temp[i]);
					out.print("</td>");
				}
			out.print("</tr>");	
			
			//TODO when searches become more indepth, make alts where WHERE is and not used
			//TODO replace imageName with price
			query = "SELECT * "
		       	  + "FROM bid "
				  
			;
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			ResultSetMetaData metadata = rs.getMetaData();
			int columns = metadata.getColumnCount();
			String bidID = "";
			while(rs.next()) {				
				out.print("<tr>");	
				for (int i = 1; i < columns + 1; i++) {
					bidID = (String) rs.getString(2);

						out.print("<td>");
						out.print((String) rs.getString(i));
					out.print("</td>");
			
			    	
				}
				out.print("<td>");
				
				out.print("<form action='deletebid.jsp'>_");
				out.print("<input type='hidden' id='bidID' name='bidID' value='"); 
				out.print(bidID);
				out.print("'>");
				
				out.print("<input type='submit' value='Delete'>");
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