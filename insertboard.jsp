<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 추가하기</title>
<script type="text/javascript">
	function boardList(){
		//JS: BOM ---> 위치와 관련있는 객체 --> Location
		location.href="HkController.do?command=boardlist";
	}
</script>
</head>
<body>
<h1>게시글 작성하기</h1>
<form action="HkController.do" method="post">
	<input type="hidden" name="command" value="insertboard"/>
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록" />
<!-- 			<button>submit이 기본임(타입을 button으로 설정)</button> -->
				<input type="button" value="목록" onclick="boardList()" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>