<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>   
<%@ page import="com.cs336.pkg.ApplicationDB" %> 
<a href="/cs336sample1/code/endUser/ebay/defaultPage.jsp" >Back to main FAQ<br/> </a>

		<h1 style="text-align:center;"> FAQ</h1>
<%   String itemName = request.getParameter("keyword"); %>


</body>
</html>
<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();
	
		String query;
	    Statement statement;
	    
		/*
		query = "SELECT q.question, q.questionReply "
	       	  + "FROM question q " 
	       	  + "WHERE q.questionReply is not NULL AND q.question LIKE '%"
	       	  + itemName + "%'"	  
		;
		*/
		query = "SELECT question, questionReply "
			  + "FROM question ";
		statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(query);
		
		ResultSetMetaData metadata = rs.getMetaData();
		int columns = metadata.getColumnCount();
		String quest = "";
		if (rs.next()) {
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
			
			do {
				out.print("<tr>");	
				for (int i = 1; i < columns + 1; i++) {
					out.print("<td>");
						out.print((String) rs.getString(i));
					out.print("</td>");    	
				}
				out.print("</tr>");		
			} while(rs.next());
			
			out.println("</table>");
		} else {
			out.println("No questions, ask one");
			out.print("<a href='postQuestions.jsp'>try one</a>");
		}
		rs.close();
		connection.close();
	} catch (Exception e) {
		out.println(e);
	}
%>