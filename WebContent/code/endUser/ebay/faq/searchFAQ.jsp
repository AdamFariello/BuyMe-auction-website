<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
<a href="/cs336Sample1/code/endUser/ebay/defaultPage.jsp" >Back to main FAQ<br/> </a>

		<h1 style="text-align:center;"> FAQ</h1>
<%   String itemName = request.getParameter("keyword"); %>


</body>
</html>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	    Connection connection = DriverManager.getConnection(
    		"jdbc:mysql://localhost/auction?user=root&password=root"
    	); 
		String query;
	    Statement statement;
		out.println("<table border='1'>");		
			out.print("<tr>");
				String [] temp = {
					"Question", "Answer"
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
			query = "SELECT q.question, q.questionReply "
		       	  + "FROM question q WHERE q.questionReply is not NULL AND q.question LIKE '%"
		       	  + itemName + "%'"
				  
			;
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			ResultSetMetaData metadata = rs.getMetaData();
			int columns = metadata.getColumnCount();
			String quest = "";
			while(rs.next()) {				
				out.print("<tr>");	
				for (int i = 1; i < columns + 1; i++) {
					quest = (String) rs.getString(1);

						out.print("<td>");
						out.print((String) rs.getString(i));
					out.print("</td>");
			
			    	
				}
				
				out.print("</tr>");	
			}
		out.println("</table>");
		rs.close();
		connection.close();
	} catch (Exception e) {
		out.println(e);
	}
%>