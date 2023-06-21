<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align:center;"> New Auction</h1>
<form action="createAuction.jsp">

  <label for="category">Category:</label><br>
        <select name="category" id="category" required>
        	<option value="" disabled selected hidden="true">Select Category</option>
				<option value="sweaters">Sweaters</option>
				<option value="skirts">Skirts</option>
				<option value="shorts">Shorts</option>
		</select> <br><br>
		<label for="gender">Gender: </label>
        <select name="gender" id="gender">
        	<option value="" disabled selected hidden="true">Gender Section</option>
				<option value="womens">Womens</option>
  				<option value="mens">Mens</option>
  				<option value="girls">Girls</option>
  				<option value="boys">Boys</option>
  				<option value="unisex">Unisex</option>
		</select> <br><br>
		<label for="quality">Quality: </label>
        <select name="quality" id="quality">
        	<option value="" disabled selected hidden="true">Select Quality</option>
  				<option value="used">Used</option>
  				<option value="goodcond">Good Condition</option>
  				<option value="brandNew">Brand New</option>
		</select> <br><br>
		<label for="size">Size: </label>
        <select name="size" id="size">
        	<option value="" disabled selected hidden="true">Select Size</option>
  <option value="xs">XS</option>
  <option value="s">S</option>
  <option value="m">M</option>
  <option value="l">L</option>
  <option value="xl">XL</option>
  <option value="0x">0X</option>
  <option value="1x">1X</option>
  <option value="2x">2X</option>
  <option value="3x">3X</option>
  <option value="4x">4X</option>
  <option value="5x">5X</option>
		</select> <br><br>
		<label for="color">Color: </label>
        <select name="color" id="color">
        	<option value="" disabled selected hidden="true">Select Color</option>
  <option value="red">Red</option>
  <option value="orange">Orange</option>
  <option value="yellow">Yellow</option>
  <option value="green">Green</option>
  <option value="blue">Blue</option>
  <option value="purple">Purple</option>
  <option value="pink">Pink</option>
  <option value="white">White</option>
  <option value="black">Black</option>
  <option value="brown">Brown</option>
  <option value="tan">Tan</option>
		</select> <br><br>
		
	
  <label for="enddate"> End date:</label><br>
  <input type="date" id="enddate" name="enddate"><br>
  
  
  <label for="description">Description (max Char:100):</label><br>
  <textarea style="font-size: 14pt" rows="5" cols="60" maxlength="250"
				name="description" placeholder = 'Enter your product description.' required></textarea>
			<br><br>
 
  <label for="hbid"> Starting price of auction </label><br>
  <input type="number" maxlength="100" id="hbid" name="hbid" value="9.00"><br>
    
  <label for="rprice"> Minimum price for auction item (will be hidden to buyer):</label><br>
  <input type="number" maxlength="100" id="rprice" name="rprice" value="10.00"><br>
  
   <input type="submit" value="Enter">
   </form>
</body>
</html>