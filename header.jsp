<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	a{
		text-decoration: none;
	}
	button,input[type=submit] {
		border: none;
		cursor: pointer;
	}
	button:hover {
		background-color: orange;
	}
	input[type=submit]:hover{
		background-color: yellow;
	}
	header{
		background-color: orange;
		padding: 1px;
	}
	header > h1 {
		text-align: center;
	}
</style>
<script type="text/javascript">
	function boardList(){
		location.href="HkController.do?command=boardlist";
	}
</script>
</head>
<body>
<header>
	<h1>기본게시판(MVC패턴)</h1>
</header>
</body>
</html>