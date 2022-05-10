 <%
	session.getAttribute("user"); 
	session.invalidate(); 
	response.sendRedirect("login.jsp");
%>
