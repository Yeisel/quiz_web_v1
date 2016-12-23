<%@page import="myboard.bean.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>QuizBook FreeBoard</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />

</head>
<style>
t1 {font-size: 80px;}

t2 {font-size: 15px;}

h1, h2, h3, h4, h5, h6 {
	color: #3d4449;
	font-family: "Open Sans", sans-serif;
	font-weight: 800;
	line-height: 1.5;
	margin: 0 0 1em 0;
}

td {text-align: left;}

th {text-align: left;}
</style>
<body>
<jsp:useBean id="dao" class="myboard.bean.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("b_num"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	BoardDto dto = dao.getBoard(num, "read");
%>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> 이 름 </td>
	 <td bgcolor=#ffffe8><%=dto.getB_name()%></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=dto.getB_regdate()%></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><%=dto.getB_email()%></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="http://<%=dto.getB_homepage()%>" target="_new">http://<%=dto.getB_homepage() %></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=dto.getB_subject() %></td>
   </tr>
   <tr> 
    <td colspan=4><%=dto.getB_content().replace("\n", "<br>") %></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     <%=dto.getB_ip()%>로 부터 글을 남기셨습니다./  조회수 :<%=dto.getB_count() %> 
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	
	[ <a href="#" class="button special" onclick="window.location='List.jsp'">목 록</a> | 
	<a href="Update.jsp?b_num=<%=num%>">수 정</a> |
	<a href="Delete.jsp?b_num=<%=num%>">삭 제</a> |
	<a href="Reply.jsp?b_num=<%=num%>">답 변</a> ]<br>
  </td>
 </tr>
</table>
</body>
	<!-- Scripts -->
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="../assets/js/main.js"></script>

</html>