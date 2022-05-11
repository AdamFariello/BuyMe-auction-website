<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, java.util.Date, 
				 java.time.LocalDate, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
<%@ page import="com.cs336.pkg.ApplicationDB" %>

<a href="/cs336sample1/code/main/main.jsp">
   Log out</a>
<br>

<%
try {
	//Connection
	ApplicationDB db = new ApplicationDB();    
	Connection connection = db.getConnection();   
	String query;
	Statement statement = connection.createStatement();
	ResultSet rs;
	
	//Setup
	String acessor = (String) request.getParameter("user");
	String profile = (String) request.getParameter("profile");
	%>profile: <% out.print(profile);
	
	query = "SELECT * "
	      + "FROM customerRep "
	      + "WHERE username = '" +acessor + "' "
	;
	rs = statement.executeQuery(query);
	if (acessor.equals(profile) || rs.next()) {		
		//Changing password
		%>
			<br><br>
			<a href="/cs336sample1/code/endUser/register/register.jsp">
			   Change password</a> 
			<form action="updatePassword.jsp" method="post">
				<label for="New Password:"> </label>
				<input type="text" name="nPassword">
				<input type="hidden" name="user" value=<%=acessor%>>
				</form>
		<%
		
		//Handing the alerts 
		%><h1 style="text-align:center"> Alerts</h1> <%
		query = "SELECT time, message "
			  + "FROM alert "
			  + "WHERE username = '" +profile+ "' ";
		;
		rs = statement.executeQuery(query);
		if (rs.next()) {
			%>
			<table border='1' >	
				<tr>
					<td>Date</td>
					<td>Message</td>	
				</tr>
			<%	do {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
					</tr>
					<%
				} while (rs.next());
			%></table> <br><%	
		} else {
			%>No Alerts<%
		}
	} 
	
	/*REST OF TABLE*/
	//Displaying auctions currently Bidding in 
	%><h1 style="text-align:center;">Currently Buying</h1> <%
	query = "SELECT i.itemName, max(b.bidAmount) "
		  + "FROM bid b, endUser u, item i "
		  + "WHERE u.username = '" +profile+ "' "
		  + "  AND u.username = b.bidderUsername "
		  + "  AND i.itemID   = b.itemID "
		  + "GROUP BY b.itemID "
	;
	rs = statement.executeQuery(query);
	if (rs.next()) {
		%>
		<table border='1'>	
			<tr>
				<td>item</td>
				<td>bidding</td>	
			</tr>
			
		<%	do {
				 %>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
				</tr>
				<%
			} while (rs.next());
		%></table><%	
	} else {
		%>Not buying anything yet<%
	}
	
	//Displaying auctions currently Bidding in 
	%><h1 style="text-align:center;">Currently Selling</h1> <%
	query = "SELECT i.itemName, max(b.bidAmount) "
		  + "FROM bid b, endUser u, item i "
		  + "WHERE username = '" +profile+ "' "
		  + "  AND u.username = i.vendorName "
		  + "  AND i.itemID = b.itemID "
		  + "GROUP BY b.itemID "
	;
	rs = statement.executeQuery(query);
	if (rs.next()) {
		%>
		<table border='1'>	
			<tr>
				<td>Item</td>
				<td>selling for</td>	
			</tr>
		<%	do {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
				</tr>
				<%
			} while (rs.next());
		%></table><%	
	} else {
		%>Not selling anything yet<%
	}
} catch (Exception e) {
	out.println(e);
}
%>