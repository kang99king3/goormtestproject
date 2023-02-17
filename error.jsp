<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String msg=(String)request.getAttribute("msg");
%>
<body>
<h1>내부 오류 발생</h1>
<p>내부 오류로 페이지 로딩에 실패하였습니다.</p>
<p>오류 내용:(<%=msg%>)</p>
<a href="HkController.do?command=main">메인으로 돌아가기</a>
</body>
</html>