<%@page import="util.PagingCount"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<jsp:useBean id="boardQuery" class="board.BoardQuery" />

<%
	///pagging
	int limit = 10;
	int offset = 0;
	int pagelink = 1;
	
	String offset_get = request.getParameter("offset");
	if(offset_get == null){
		offset = 0;
	}else{
		offset = Integer.parseInt(offset_get);
	}
	
	String pagelink_get = request.getParameter("pagelink");
	if(pagelink_get == null){
		pagelink = 1;
	}else{
		pagelink = Integer.parseInt(pagelink_get);
	}
	///pagging
	request.setCharacterEncoding("euc-kr");
	
	String find = request.getParameter("find");
	String search = request.getParameter("search");
	int rcnt = boardQuery.boardCount(find, search);


%>
<center>
<h1>검색결과!</h1>
<table>
	<tr>
		<th>번호</th>
		<th>일자</th>
		<th>제목</th>
		<th>이름</th>
		<th>조회</th>
	</tr>

	<% 
		Vector listVector = boardQuery.getBoardList(offset, limit, find, search);
		for(int i=0;i<listVector.size();i++){
			BoardBean boardBean = (BoardBean)listVector.elementAt(i);	
	%>
	<tr>
		<td><%=boardBean.getIdx() %></td>
		<td><%=boardBean.getWdate() %></td>
		<td><a href="content.jsp?idx=<%=boardBean.getIdx()%>&pagelink=1&offset=0"><%=boardBean.getTitle() %></a></td>
		<td><%=boardBean.getName() %></td>
		<td><%=boardBean.getHit() %></td>
	</tr>
	<%} %>
</table>
<%
	//페이징
	PagingCount pc = new PagingCount(rcnt);
%>
<%=pc.showPaging(pagelink, "search.jsp", find, search) %>


<a href="write.jsp" class="btn_write">글쓰기</a>


<form action="search.jsp" method="get" name="sform">
	<select name="find">
		<option value="name">이름</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
	</select>
	<input type="text" name="search" value="<%=search%>"/>
	<input type="button" value="글 찾기" onclick="searchChk(this.form);"/>
</form>
<script type="text/javascript">

	function searchChk(frm){

		if(frm.find.value == ""){
			alert("검색하실 내용을 선택해주세요");
			frm.find.focus();
			return false;
		}
		if(frm.search.value == ""){
			alert("검색할 내용을 입력해주세요");
			frm.search.focus();
			return false;
		}
		frm.submit();

	}
</script>
</center>
</body>
</html>