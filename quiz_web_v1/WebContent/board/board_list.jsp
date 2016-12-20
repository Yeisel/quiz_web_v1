<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header"> <a href="#" class="logo"> <t1>
					<strong>Quiz Book</strong></t1> &nbsp;&nbsp;&nbsp; by firstclass
				</a> </header>

				<br />
				<br />
				<br />
				<h2 id="content">COMMUNITY</h2>
				<p>유저들과 자유로운 소통공간</p>
				<hr class="major" />
				
				<!-- Table -->
				<h3>자유 게시판</h3>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th width="5%"><t2>선택</t2></th>
								<th width="10%"><t2>번호</t2></th>
								<th width="35%"><t2>게시물 제목</t2></th>
								<th width="15%"><t2>게시자</t2></th>
								<th width="10%"><t2>조회수</t2></th>
								<th width="15%"><t2>게시일</t2></th>
								<th width="10%"><t2>좋아요</t2></th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="dto">
							<tr>
								<tr height="25" align="center">
								<td style="text-align: left">
									<div class="6u$ 12u$(small)">
										<input type="checkbox" id="select${dto.f_board_number}"
											name="select"> <label
											for="demo-human${dto.f_board_number}"></label>
									</div>
								</td>
								<td>${dto.f_board_number}</td>
								<td><a href="board_read.do?idx=${dto.f_board_number}">${dto.f_board_subject}</a></td>
								<td>${dto.f_board_id}</td>
								<td>${dto.f_board_count}</td>
								<td>${dto.f_board_date}</td>
								<td>${dto.f_board_good}</td>
							</tr>
							

						
						</c:forEach>


					</table>
				</div>

				<span style="float: left"> <input type="text"> <a
					href="#" class="button special">검색</a>
				</span> <span style="float: right"> <a href="#"
					class="button special" onclick="window.location='board_insert.jsp'">글쓰기</a>
					<a href="#" class="button special"
					onclick="javascript:history.back(-1)">처음으로</a>
				</span> <br />
				<br />



				<ul class="pagination" align="center">
					<li><span class="button disabled">이전</span></li>
					<li><a href="#" class="page active">1</a></li>
					<li><a href="#" class="page">2</a></li>
					<!-- <li><span>&hellip;</span></li> -->
					<li><a href="#" class="page">3</a></li>
					<li><a href="#" class="page">4</a></li>
					<li><a href="#" class="page">5</a></li>
					<li><a href="#" class="button">다음</a></li>
				</ul>

				<br /><br /><br /><br /><br /><br />
			</div>
		</div>
	</div>

</body>
	<!-- Scripts -->
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="../assets/js/main.js"></script>

</html>