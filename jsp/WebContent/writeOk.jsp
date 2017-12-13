<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<% 
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="boardBean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="boardBean"/>
<jsp:useBean id="boardQuery" class="board.BoardQuery" />
<%
	boardQuery.insertBoard(boardBean);
%>
</head>
<body>
<script type="text/javascript">
	alert("작성되었습니다.");
	location.href="list.jsp";
</script>
</body>
</html>