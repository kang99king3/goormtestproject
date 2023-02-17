<%@page import="dto.HkDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.HkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록 보기</title>
<script type="text/javascript">
	//전체 체크박스 기능
	function allSel(bool){//bool은 체크여부를 받는다(true/false)
		var chks=document.getElementsByName("chk");//chks[chk,chk,chk,chk..]
		for (var i = 0; i < chks.length; i++){
			chks[i].checked=bool;//각각의 체크박스에 체크여부(true/false)를 적용
		}
	}
</script>
</head>
<%  
	//request객체에 저장되는 객체들은 모두 Object로 형변환되기 때문에 
	//다시 downcasting해야한다.
	List<HkDto> list=(List<HkDto>)request.getAttribute("list");
// 이미 저장할 데이터의 타입을 알고 있는 경우
// 	int[] i={1,2,3,4};
// 	List<HkDto> list2;
	if(list==null){
		request.setAttribute("msg", "요청글에 대한  정보가 없습니다");
		pageContext.forward("error.jsp");
	}
	
%>
<body>
<h1>게시판 글목록</h1>
<form action="HkController.do" method="post">
<input type="hidden" name="command" value="muldel"/>
<table border="1">
	<col width="30px">
	<col width="50px">
	<col width="100px">
	<col width="300x">
	<col width="200px">
	<tr>
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)" > </th>
		<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			HkDto dto=list.get(i);//list[dto,dto,dto...]--> 순차적으로 하나씩 꺼낸다(dto)
			%>
			<tr>
				<td><input type="checkbox" name="chk" value="<%=dto.getSeq()%>" /> </td>
				<td><%=dto.getSeq()%></td>
				<td><%=dto.getId()%></td>
				<td><a href="HkController.do?command=detailboard&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
				<td><%=dto.getRegdate()%></td>
			</tr>
			<%
		}
	%>
	<tr>
		<td colspan="5">
			<a href="HkController.do?command=insertform"><button type="button">글쓰기</button></a>
			<input type="submit" value="글삭제" >
			<a href="HkController.do?command=main"><button type="button">메인</button></a>
		</td>
	</tr>
</table>
</form>
</body>
</html>