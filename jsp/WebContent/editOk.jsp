<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����Ȯ��</title>
</head>
<body>
<jsp:useBean id="boardBean" class="board.BoardBean" />
<jsp:setProperty property="*" name="boardBean"/>
<jsp:useBean id="boardQuery" class="board.BoardQuery" />
<%
	int idx = boardBean.getIdx();
	boolean result = false;
	
	result = boardQuery.boardUpdate(boardBean);
	
	if(result){
		out.println("<script>");
		out.println("alert('���̼����Ǿ����ϴ�.')");
		out.println("location.href='content.jsp?idx="+idx);
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('��ȣ�� ��ġ���� �ʽ��ϴ�.')");
		out.println("history.back();");
		out.println("</script>");		
	}
%>
success
</body>
</html>