<%@page import="board.BoardQuery"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<center>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ϱ�</title>
<br>
<h1>�����ϱ�!</h1>
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
		<th>�̸�<br></th>
		<td><input type="text" name="name" value="<%=boardBean.getName() %>" /></td>
	<tr>
		<th>�̸���<br></th>
		<td><input type="text" name="email" value="<%=boardBean.getEmail() %>"/></td>
	</tr>
	<tr>
		<th>Ȩ������<br></th>
		<td><input type="text" name="homepage" value="<%=boardBean.getHomepage()%>" /></td>
	</tr>
	<tr>
		<th>����<br></th>
		<td><input type="text" name="title" value="<%=boardBean.getTitle()%>"/></td>
	</tr>
	<tr>
		<th>����<br></th>
		<td><textarea name="content"><%=boardBean.getContent() %></textarea></td>
	</tr>
	<tr>
		<th>��й�ȣ<br></th>
		<td><input type="password" name="pwd" /></td>
	</tr>								
</table>
<div>
	<input type="button" value="�ۼ��Ϸ�" onclick="checkFrm(this.form);"/>
	<input type="reset" value="�ٽþ���" />
	<input type="button" value="�������" onclick="location.href='list.jsp'"/>
</div>
</form>
<script type="text/javascript">
function checkFrm(frm){
	if(frm.name.value==""){
		alert("�̸��� �Է��ϼ���");
		frm.name.focus();
		return false;
	}
	if(frm.email.value==""){
		alert("�̸����� �Է��ϼ���");
		frm.email.focus();
		return false;
	}
	if(frm.homepage.value==""){
		alert("Ȩ�������� �Է��ϼ���");
		frm.homepage.focus();
		return false;
	}
	if(frm.title.value==""){
		alert("������ �Է��ϼ���");
		frm.title.focus();
		return false;
	}
	if(frm.content.value==""){
		alert("������ �Է��ϼ���");
		frm.content.focus();
		return false;
	}
	if(frm.pwd.value==""){
		alert("��й�ȣ�� �Է��ϼ���");
		frm.pwd.focus();
		return false;
	}
	frm.submit();
}
</script>
</body>
</center>
</html>