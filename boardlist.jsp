<%@page import="dto.HkDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.HkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록 보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    body {font-family: "Times New Roman", Georgia, Serif;}
    h1, h2, h3, h4, h5, h6 {
      font-family: "Playfair Display";
      letter-spacing: 5px;
    }
</style>
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
        <!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
    <a href="/" class="w3-bar-item w3-button">Main page</a>
    <!-- Right-sided navbar links. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#about" class="w3-bar-item w3-button">About</a>
      <a href="#menu" class="w3-bar-item w3-button">Menu</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a>
    </div>
  </div>
</div>
    <!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
  <!--<img class="w3-image" src="https://www.w3schools.com/w3images/hamburger.jpg" alt="Hamburger Catering" width="1600" height="300"> -->
  <div class="w3-display-bottomleft w3-padding-large ">
    <h1 class="w3-xxlarge">Le Catering</h1>
  </div>
</header>
<!-- Page content -->
<div class="w3-content" style="max-width:1100px">
    <!-- About Section -->
  <div class="w3-row w3-padding-64" id="about">
    <div class="w3-col  w3-padding-large ">
    <h1 class="w3-xxlarge">Board List</h1>
     <form action="HkController.do" method="post">
        <input type="hidden" name="command" value="muldel"/>
        <table border="1" class="w3-table-all">
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
                    <tr  class="w3-light-grey w3-hover-blue">
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
                    <a href="HkController.do?command=insertform"><button type="button" class="w3-button w3-black">글쓰기</button></a>
                    <input type="submit" value="글삭제" class="w3-button w3-red">
                    <a href="HkController.do?command=main"><button type="button" class="w3-button w3-teal">메인</button></a>
                </td>
            </tr>
        </table>
        </form>   
    </div>

    
  </div>

</div>

</body>
</html>