<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글쓰기</title>
<link href="style.css" type="text/css" rel="stylesheet" />

</head>
<body>
<center>

<form action="writeOk.jsp" method="post" name="writeFrm">


<h1><br>글쓰기 창!</h1>
<br><br>
<table>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" /></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" /></td>
	</tr>
	<tr>
		<th>홈페이지</th>
		<td><input type="text" name="homepage" /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content"></textarea></td>
	</tr>
	<tr>
		<th>비밀번호</th>
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
</center>
</body>

</html>