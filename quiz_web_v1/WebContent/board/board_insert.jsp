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
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
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
		
		var id = $("#f_id").val();
		var title = $("#f_title").val();
		var content = $("#f_content").val();
		
		
		
		var requestData = {
			"f_board_id" : id,
			"f_board_title" : title,
			"f_board_content" : content
		};
		
		
		if(title=="" || content==""){
			alert("내용을 입력하세요");			
		} else {
			
		$.ajax({
			url : "/quiz_web_v1/board/board_insert.do",
			type : "post",
			data : requestData,
			//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result) {
				if (result == 1) {
					alert("작성하신 글이 등록되었습니다");
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
				<header id="header"> <a href="#" class="logo"><t1>
					<strong>Quiz Book</strong></t1>&nbsp;&nbsp;&nbsp; by firstclass</a></header>

				<br /> <br /> <br />
				<h2 id="content">COMMUNITY</h2>
				<p>유저들과 자유로운 소통공간</p>
				<hr class="major" />

				<!-- Form -->
				<h2>글쓰기</h2>

				<form method="post" action="">
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">
							<input type="text" id="f_id" name="" placeholder="ID" />
						</div>
						<div class="6u$ 12u$(xsmall)">
							<input type="email" id="email" name="" value="" placeholder="Email" />
						</div>
						<!-- Break -->
						<div class="12u$">
							<div class="">
								<input type="text" id="f_title" name="" placeholder="Title" />
							</div>
						</div>

						<!-- Break -->
						<div class="12u$">
							<textarea id="f_content" name="" placeholder="Enter your message" rows="10"></textarea>
						</div>
						<!-- Break -->
						<div class="12u$">
							<ul class="actions">
								<li><input type="button" value="글올리기" class="special" onclick="javascript:writeCheck();" /></li>
								<li><input type="reset" value="다시쓰기" onclick="" /></li>
								<li><input type="button" value="목록으로"
									onclick="window.location='board_list.do'" /></li>
							</ul>
						</div>
					</div>
				</form>
				
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
</body>
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../assets/js/main.js"></script>
</html>