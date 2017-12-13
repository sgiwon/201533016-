<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삭제실행</title>
</head>
<body>
<jsp:useBean id="boardQuery" class="board.BoardQuery" />

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pwd = request.getParameter("pwd");
	boolean result = false;
	result = boardQuery.boardDelete(idx, pwd);
	if(result){
%>

<script type="text/javascript">
alert("글이삭제되었습니다.");
location.href="list.jsp"
</script>
<%
	
	}else{
%>
<script type="text/javascript">
alert("암호가 다릅니다.");
history.back();
</script>
<% 
	}
%>
</body>
</html>
