Welcome <%=session.getAttribute("user")%> 
<a href='logout.jsp'>Log out</a>
<h1 style="text-align:center;"> Start a new Auction</h1>
	<div style="text-align:center;"> 
	<button onclick="document.location=
			'/cs336sample1/code/endUser/ebay/auctions/newAuction.jsp'">
			Enter</button>
	</div>

<h1 style="text-align:center;"> Browse Auctions</h1>
	<div style="text-align:center;"> 
	<button onclick="document.location=
			'/cs336sample1/code/endUser/ebay/auctions/showallAuctions.jsp'">
			Browse All</button>
	</div>

<h1 style="text-align:center;"> Search Auction by Categories</h1>
	<div style="text-align:center;"> 
	<button onclick="document.location=
			'/cs336sample1/code/endUser/ebay/auctions/searchProducts.jsp'">
			Enter</button>
	</div>

<h1 style="text-align:center;"> Post a Question to Customer Service</h1>
	<div style="text-align:center;"> 
	<button onclick="document.location=
			'/cs336sample1/code/endUser/ebay/faq/postQuestions.jsp'">
			Enter</button>
	</div>

<h1 style="text-align:center;">Browse FAQ</h1>
	<div style="text-align:center;"> 
	<button onclick="document.location=
			'/cs336sample1/code/endUser/ebay/faq/searchFAQ.jsp'">
			Enter
			</button>
	</div>		