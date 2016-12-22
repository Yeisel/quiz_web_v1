<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Elements - Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
</head>

<style>
t1 {
	font-size: 80px;
}

t2 {
	font-size: 15px;
}

h1, h2, h3, h4, h5, h6 {
	color: #3d4449;
	font-family: "Open Sans", sans-serif;
	font-weight: 800;
	line-height: 1.5;
	margin: 0 0 1em 0;
}

td {
	text-align: left;
}

th {
	text-align: left;
}
</style>
<script src="../assets/js/jquery.min.js"></script>
<script type="text/javascript">
	function writeCheck() {
		
		var idx = $("#idx").val();
		var id = $("#f_id").val();
		var title = $("#f_title").val();
		var content = $("#f_content").val();
		
		console.log(idx)
		console.log(id)
		console.log(title)
		console.log(content)
		
		var requestData = {
			"idx" : idx,
			"f_board_id" : id,
			"f_board_title" : title,
			"f_board_content" : content
		};
		
		
		if(title=="" || content==""){
			alert("내용을 입력하세요");			
		} else {
			
		$.ajax({
			url : "/quiz_web_v1/board/board_modify_update.do",
			type : "post",
			data : requestData,
			//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result) {
				if (result == 1) {
					alert("수정된 글이 등록되었습니다.");
					location.href = "/quiz_web_v1/board/board_list.do";
				} else {
					alert("fail...");
				}
			}
		});
		}
	}
</script>

<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
				<a href="#" class="logo"><t1>
					<strong>Quiz Book</strong></t1>&nbsp;&nbsp;&nbsp; by firstclass</a></header>

				<br /> <br /> <br />
				<h2 id="content">COMMUNITY</h2>
				<p>유저들과 자유로운 소통공간</p>
				<hr class="major" />

				<!-- Content -->
				<input type="hidden" id="idx" value="${Read.f_board_number }"/>
				<input type="hidden" id="f_id" value="${Read.f_board_id }"/>
				
				<h2 id="content">${Read.f_board_title }</h2>

				<!-- Table -->
				<div class="table-wrapper">
					<table border=0 cellpadding=3 cellspacing=0 width=100%>
						<tr>
							<td align=center bgcolor=white width=10%>이 름</td>
							<td bgcolor=white >${Read.f_board_id }</td>
							<td align=center bgcolor=white width=10%>등록날짜</td>
							<td bgcolor=white>${Read.f_board_date }</td>
						</tr>
						<tr>
							<td align=center bgcolor=white width=10%>메 일</td>
							<td bgcolor=white>aaa@aaaa.aa</td>
							<td align=center bgcolor=white width=10%>홈페이지</td>
							<td bgcolor=white><a href="http://aaaa" target="_new">http://aaaa</a></td>
						</tr>
						<tr>
							<td align=center bgcolor=white>제 목</td>
							<td bgcolor=white colspan=3><textarea id="f_title" name=title rows="1">${Read.f_board_title }</textarea></td>
						</tr>


					</table>

				</div>

				<!-- 본문 -->
				<textarea id="f_content" name=content rows="10">${Read.f_board_content }</textarea>

				<hr />
				<div align="center">
				<input type="button" onclick="window.location='board_list.do'" value="목 록">
				<input type="button" value="글올리기" class="special" onclick="javascript:writeCheck();" />
				<input type="button" onclick="window.location='board_delete.do?id=${Read.f_board_number}'" value="삭 제">
				</div>
				<br /> <br /> <br /> <br />
				
				<ul class="pagination" align="center">
					<li><span class="button disabled">Prev</span></li>
					<li><a href="#" class="page active">1</a></li>
					<li><a href="#" class="page">2</a></li>
					<!-- <li><span>&hellip;</span></li> -->
					<li><a href="#" class="page">3</a></li>
					<li><a href="#" class="page">4</a></li>
					<li><a href="#" class="page">5</a></li>
					<li><a href="#" class="button">Next</a></li>
				</ul>


				<br /> <br />
</body>
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../assets/js/main.js"></script>
</html>