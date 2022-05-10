<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
<%@ page import="com.cs336.pkg.ApplicationDB" %>

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
		ApplicationDB db = new ApplicationDB();    
		Connection connection = db.getConnection();    

		String query = "SELECT question, questionReply "
			      	 + "FROM question "
		;
	    Statement statement = connection.createStatement();;
	    ResultSet rs = statement.executeQuery(query);
	    
		if (rs.next())	{
		    out.println("<table border='1'>");		
				out.print("<tr>");
					String [] temp = {
						"Question", "Answer", "Reply?"
					};
				
					for (int i = 0; i < temp.length; i++) {
						//make a column
						out.print("<td>");
							out.print(temp[i]);
						out.print("</td>");
					}
				out.print("</tr>");	
				
			
				ResultSetMetaData metadata = rs.getMetaData();
				int columns = metadata.getColumnCount();
				String quest = "";
				do {
					out.print("<tr>");	
					for (int i = 1; i < columns + 1; i++) {
						out.print("<td>");
							out.print((String) rs.getString(i));
						out.print("</td>");
					}
					
					out.print("<td>");
						out.print("<form action='"
							+"/cs336sample1/code/customerRep/mainPortal/faq"
							+"/submitQuestion.jsp'"
						);
						out.print("<input type='hidden' id='question' name='question'>"); 
						out.print("<input type='submit' value='Enter'>");
						out.print("</form>");
					out.print("</td>");
					
					out.print("</tr>");
				}	while(rs.next());			
			out.println("</table>");
			} else {
				out.println("No questions, asked");
			}				
	} catch (Exception e) {
		out.println(e);
	}
%>