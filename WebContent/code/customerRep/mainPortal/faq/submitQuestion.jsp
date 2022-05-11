<h1 style="text-align:center;">
<%
	out.print("Question: ");
	out.print(request.getParameter("question"));
%>
</h1>
<form style="text-align:center;" action="processQuestion.jsp" method="post">
	<label for="answer"> </label><br>
	<input type="answer" name="answer">
    <input type="hidden" name="question" value='<%=request.getParameter("question")%>'>
    <br>
    <button>reply</button>
	</form>