<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글보기</title>
</head>
<body>
<center>
<h1>게시글!</h1>
<jsp:useBean id="boardBean" class="board.BoardBean" />
<jsp:useBean id="boardQuery" class="board.BoardQuery" />
<%
	int idx = Integer.parseInt(request.getParameter("idx"));

	
	boardQuery.boardHitUp(idx);
	
	boardBean = boardQuery.boardView(idx);
%>
<div>조회수 : <%=boardBean.getHit() %></div>
<table>
	<tr>
		<th>이름<br></th>
		<td><%=boardBean.getName() %></td>
	</tr>
	
	<tr>
		<th>이메일<br></th>
		<td><%=boardBean.getEmail() %></td>
	</tr>
	
	<tr>
		<th>홈페이지<br></th>
		<td><%=boardBean.getHomepage() %></td>
	</tr>
	
	<tr>
		<th>제목<br></th>
		<td><%=boardBean.getTitle() %></td>
	</tr>
	
	<tr>
		<th>내용<br></th>
		<td><%=boardBean.getContent() %></td>
	</tr>
			<br>					
</table>
<br><br>
<div>
	<input type="button" value="수정하기" onclick="editsend(<%=boardBean.getIdx()%>)"/>
	<input type="button" value="삭제하기" onclick="delsend(<%=boardBean.getIdx()%>)"/>
	<input type="button" value="목록으로" onclick="location.href('list.jsp')"/>	
</div>
<script type="text/javascript">
function editsend(idx){
	location.href="edit.jsp?idx="+idx;
}
function delsend(idx){
	location.href="delete.jsp?idx="+idx;
}
</script>
</center>
</body>
</html>