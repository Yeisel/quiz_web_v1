<%@page import="myboard.bean.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

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

<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("패스워드를 입력하세요.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
<jsp:useBean id="dao" class="myboard.bean.BoardDao" />
<%
	int num = Integer.parseInt(request.getParameter("b_num"));
	String pass = request.getParameter("pass");
	
	if(pass != null){
		BoardDto dto = dao.getBoard(num, "delete");
		if(dto.getB_pass().equals(pass)){
			dao.deleteBoard(num);
			response.sendRedirect("List.jsp");
		}
		else{
%>
		<script>
			alert("패스워드가 틀렸습니다.");
			history.back();
		</script>
<%
		}
	}
%>
<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="Delete.jsp" >
<input type="hidden" name="b_num" value="<%=num%>" />
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pass" size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
	<!-- Scripts -->
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="../assets/js/main.js"></script>

</html>