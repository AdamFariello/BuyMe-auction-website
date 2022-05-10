 <%
    if ((session.getAttribute("custrep") == null)) {%>
		You are not logged in<br/>
		<a href="/cs336sample1/code/endUser/ebay/custreplogin.jsp">
		Please Login</a>
	<%} else { %>
		<a href='logout.jsp'>Log out</a>
		<br>
		
		Welcome <%=session.getAttribute("custrep")%> 
		this is the customer representative page
		
		<h1 style="text-align:center;"> See Questions from Customers</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='showallQuestions.jsp'">Enter</button>
		</div>
		
		<h1 style="text-align:center;"> View All Accounts</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='showallusers.jsp'">Enter</button>
		</div>
		
		<h1 style="text-align:center;"> View All Bids</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='showBidsfordeletion.jsp'">Enter</button>
		</div>
		
		<h1 style="text-align:center;"> View All Auctions</h1>
		<div style="text-align:center;"> 
		<button onclick="document.location='showAuctionsfordeletion.jsp'">Enter</button>
		</div>
	<%}
%>
