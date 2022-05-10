<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Auction</title>
</head>
<body>
<div>
<a href="/cs336sample1/code/endUser/ebay/defaultPage.jsp" >HOME<br/> </a>

</div>

<h1 style="text-align:center;"> New Auction</h1>
<form action="createAuction.jsp">
  <label for="fname">Brand (max Char: 30):</label><br>
  <input type="text" maxlength="30" id="brand" name="brand"><br>
 
  <label for="closingdate"> Closing date:</label><br>
  <input type="date" id="closingdate" name="closingdate"><br>
  
  clothing category<br>
  <select name="clothingcat" id="clothingcat">
  <option value="shorts">Shorts</option>
  <option value="skirts">Skirts</option>
  <option value="sweaters">Sweaters</option>
  </select><br>
  
  <select name="gendersection" id="gendersection">
  <option value="womens">Womens</option>
  <option value="mens">Mens</option>
  <option value="girls">Girls</option>
  <option value="boys">Boys</option>
  <option value="unisex">Unisex</option>
  </select><br>
  
  <select name="quality" id="quality">
  <option value="used">Used</option>
  <option value="goodcond">Good Condition</option>
  <option value="brandNew">Brand New</option>
  </select><br>
  
  <select name="size" id="size">
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
  </select><br>
  
  Pick the most dominant color<br>
  <select name="color" id="color">
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
  </select><br>
  
  <label for="fname">Small Description (max Char:100):</label><br>
  <input type="text" maxlength="100" id="s-descrip" name="s-descrip"><br>
 
  <label for="fname"> Starting price of auction </label><br>
  <input type="number" maxlength="100" id="id_startingPrice" name="id_startingPrice"><br>
    
  <label for="fname"> Minimum price for auction item (will be hidden to buyer):</label><br>
  <input type="number" maxlength="100" id="id_minimumPrice" name="id_minimumPrice"><br>
  
  <label for="fname"> Minimum increase needed for a new bid:</label><br>
  <input type="number" maxlength="100" id="id_minimumBidIncrease" name="id_minimumBidIncrease"><br>
  
   <input type="submit" value="Enter">
   </form>

</body>
</html>