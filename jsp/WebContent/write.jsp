<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۾���</title>
<link href="style.css" type="text/css" rel="stylesheet" />

</head>
<body>
<center>

<form action="writeOk.jsp" method="post" name="writeFrm">


<h1><br>�۾��� â!</h1>
<br><br>
<table>
	<tr>
		<th>�̸�</th>
		<td><input type="text" name="name" /></td>
	</tr>
	<tr>
		<th>�̸���</th>
		<td><input type="text" name="email" /></td>
	</tr>
	<tr>
		<th>Ȩ������</th>
		<td><input type="text" name="homepage" /></td>
	</tr>
	<tr>
		<th>����</th>
		<td><input type="text" name="title" /></td>
	</tr>
	<tr>
		<th>����</th>
		<td><textarea name="content"></textarea></td>
	</tr>
	<tr>
		<th>��й�ȣ</th>
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
</center>
</body>

</html>