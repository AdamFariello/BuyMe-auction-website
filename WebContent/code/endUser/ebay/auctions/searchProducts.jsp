<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search products</title>
</head>
<body>
<a href="success.jsp" >HOME<br/> </a>

	<h1 style="text-align:center;"> "Search for Products"</h1>
	
	<form style="text-align:center;" action="searchProductsCon.jsp" style="text-align:center;">
        <label for="category">Category:</label><br>
        <select name="category" id="category" required>
        	<option value="" disabled selected hidden="true">Select Category</option>
				<option value="sweaters">1</option>
				<option value="skirts">2</option>
				<option value="shorts">3</option>
		</select> <br><br>
		<label for="gender">Gender: </label>
        <select name="gender" id="gender" required>
        	<option value="" disabled selected hidden="true">Gender Section</option>
				<option value="womens">Womens</option>
  				<option value="mens">Mens</option>
  				<option value="girls">Girls</option>
  				<option value="boys">Boys</option>
  				<option value="unisex">Unisex</option>
		</select> <br><br>
		<label for="quality">Quality: </label>
        <select name="quality" id="quality" required>
        	<option value="" disabled selected hidden="true">Select Quality</option>
  				<option value="used">Used</option>
  				<option value="goodcond">Good Condition</option>
  				<option value="brandNew">Brand New</option>
		</select> <br><br>
		<label for="size">Size: </label>
        <select name="size" id="size" required>
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
        <select name="color" id="color" required>
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
		<label for="price">Price: </label>
    	<input type="text" name="price" id="price" required><br><br>
        <input type="submit" value="Search">
        
    </form>
</body>
</html>