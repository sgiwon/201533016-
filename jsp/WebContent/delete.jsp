<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<center>
<br><br><br>
<body>
<%
	String idx = request.getParameter("idx");	
%>
<form action="deleteOk.jsp?idx=<%=idx %>" method="post" name="frm">
	암호를 입력하세요.
	<input type="password" name="pwd" size="10" />
	<input type="button" onclick="this.form.submit()" value="삭제실행" />
</form>
</body>
</center>
</html>