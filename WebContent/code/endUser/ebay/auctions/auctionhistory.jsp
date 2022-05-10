<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction History</title>
</head>
<body>
	<br>
		 <%   
		 	 String itemID 	   = request.getParameter("itemID");
		 	 String itemName   = request.getParameter("custId");				
			 String vendorName = request.getParameter("vendor");
			 String caption    = request.getParameter("caption");
			 String closeDate  = request.getParameter("closedate");
			 String mainCat    = request.getParameter("maincat");
			 String subCat 	   = request.getParameter("subcat");
			 String tags 	   = request.getParameter("tags");
		 %>
		 <a href="showallAuctions.jsp" >Back<br/> </a>
		 
		 <h1 style="text-align:center;"> Auction Information</h1>
		 
		<div style="text-align:center;"> 
		<strong>Item Name:</strong> 
		<% out.print(itemName + "  "); %> <br>
		<strong>Vendor Name:</strong> <% out.print(vendorName + "  ");%> <br>
		<strong>Caption:</strong> <% out.print(caption + "  "); %> <br>
		<strong>Closing Date:</strong> <% out.print(closeDate + "  ");%> <br>
		<strong>Main Category:</strong><%		 out.print(mainCat + "  ");%> <br>
		<strong>Sub Category:</strong><%		 out.print(subCat + "  "); %> <br>
		<strong>Product Tags:</strong><% out.print(tags + "  "); %> <br>

	</div>
	<h1 style="text-align:center;"> Bid History</h1>
		<div style="text-align:center;"> 
		<form action='/cs336sample1/code/endUser/ebay/bid/showAllBids.jsp'>
			<input type="submit" value="Enter">
			<%
				//You can't invoke a jsp variable from html
				out.print("<input type='hidden' id='itemID' name='itemID' value='"); 
                out.print(itemID);
                out.print("'>");
			%>
		</form>
		</div>
		
	<h1 style="text-align:center;"> Bid on this Item</h1>
		<div style="text-align:center;"> 
		<form action="/cs336sample1/code/endUser/ebay/bid/createBid.jsp">
			<label for="fname"> Enter Bid:</label><br>
	  		<input type="text" maxlength="10" id="bid" name="bid"><br>
			<input type="submit" value="Enter">
			<%
				out.print("<input type='hidden' id='itemID' name='itemID' value='"); 
                out.print(itemID);
                out.print("'>");
			%>	
		</form>			
	<h1 style="text-align:center;"> "Want to set an automatic bid?"</h1>
		<form action="/cs336sample1/code/endUser/ebay/bid/bid_createAutoBid.jsp">
			<label for="fname"> Set Bid Limit:</label><br>
		  	<input type="text" maxlength="10" id="bidLimit" name="bidLimit"><br>
		  	<label for="fname"> Set Bid Increment:</label><br>
		  	<input type="text" maxlength="10" id="bidIncrement" name="bidIncrement"><br>
		  	<input type="submit" value="Enter">	
		  	<%
				out.print("<input type='hidden' id='itemID' name='itemID' value='"); 
                out.print(itemID);
                out.print("'>");
			%>	
	  	</form>
	</div>
</body>
</html>