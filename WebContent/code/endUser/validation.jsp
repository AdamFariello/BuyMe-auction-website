<%
    if ((session.getAttribute("user") == null)) {%>
		You are not logged in<br/>
		<a href="main.jsp">Please Login</a>
	<%} else { %>
		Welcome <%=session.getAttribute("user")%> 
		<a href='logout.jsp'>Log out</a>
		<h1 style="text-align:center;"> Start a new Auction</h1>
		
		<div style="text-align:center;"> 
		<button onclick="document.location='newAuction.jsp'">Enter</button>
		</div>
		
		<h1 style="text-align:center;"> Browse Auctions</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='showallAuctions.jsp'">Browse All</button>
		</div>
			<h1 style="text-align:center;"> Search Auction by Categories</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='searchProducts.jsp'">Enter</button>
		</div>
		
		<h1 style="text-align:center;"> Post a Question to Customer Service</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='postQuestions.jsp'">Enter</button>
		</div>
		
		<h1 style="text-align:center;">Browse FAQ</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='showFAQ.jsp'">Enter</button>
		</div>
	<%}
%>