<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<button onclick="document.location='userAccount.jsp';">Home</button><br>
</div>
<div>
<h2 style="text-align:center;"> Ask a Question:</h2>
	<form style="text-align:center;" action="questionsCon.jsp" method="post">
			<textarea style="font-size: 14pt" rows="5" cols="60" maxlength="250"
				name="question" placeholder = 'Enter your question here.' required></textarea>
			<br><br> <input type="submit" value="submit">
	</form>
</div><br>
<p style="text-align:center;">
<a href="allquestions.jsp">Browse through Questions</a><br>
<a href="questionSearch.jsp">Search for Questions</a>
</p>
</body>
</html>