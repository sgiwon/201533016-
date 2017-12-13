<%@page import="board.BoardQuery"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<center>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정하기</title>
<br>
<h1>수정하기!</h1>
</head>
<body>
<br>
<jsp:useBean id="boardBean" class="board.BoardBean" />
<jsp:useBean id="boardQuery" class="board.BoardQuery" />

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	boardBean = boardQuery.boardView(idx);
	
%>
<form action="editOk.jsp" method="post" name="frm">
<input type="hidden" value="<%=boardBean.getIdx() %>" name="idx">
<table>
	<tr>
		<th>이름<br></th>
		<td><input type="text" name="name" value="<%=boardBean.getName() %>" /></td>
	<tr>
		<th>이메일<br></th>
		<td><input type="text" name="email" value="<%=boardBean.getEmail() %>"/></td>
	</tr>
	<tr>
		<th>홈페이지<br></th>
		<td><input type="text" name="homepage" value="<%=boardBean.getHomepage()%>" /></td>
	</tr>
	<tr>
		<th>제목<br></th>
		<td><input type="text" name="title" value="<%=boardBean.getTitle()%>"/></td>
	</tr>
	<tr>
		<th>내용<br></th>
		<td><textarea name="content"><%=boardBean.getContent() %></textarea></td>
	</tr>
	<tr>
		<th>비밀번호<br></th>
		<td><input type="password" name="pwd" /></td>
	</tr>								
</table>
<div>
	<input type="button" value="작성완료" onclick="checkFrm(this.form);"/>
	<input type="reset" value="다시쓰기" />
	<input type="button" value="목록으로" onclick="location.href='list.jsp'"/>
</div>
</form>
<script type="text/javascript">
function checkFrm(frm){
	if(frm.name.value==""){
		alert("이름을 입력하세요");
		frm.name.focus();
		return false;
	}
	if(frm.email.value==""){
		alert("이메일을 입력하세요");
		frm.email.focus();
		return false;
	}
	if(frm.homepage.value==""){
		alert("홈페이지를 입력하세요");
		frm.homepage.focus();
		return false;
	}
	if(frm.title.value==""){
		alert("제목을 입력하세요");
		frm.title.focus();
		return false;
	}
	if(frm.content.value==""){
		alert("내용을 입력하세요");
		frm.content.focus();
		return false;
	}
	if(frm.pwd.value==""){
		alert("비밀번호를 입력하세요");
		frm.pwd.focus();
		return false;
	}
	frm.submit();
}
</script>
</body>
</center>
</html>