<%@page import="prjbean.MainProc"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</head>
<body>

<% 
	MainProc mc = new MainProc();
	mc.testDB();
%>
<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><h1>QuizBook</h1></a>
									<ul class="icons">
										<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon fa-medium"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h2>QuizBook에 오신것을 환영합니다.<br />
											by FirstClass Team</h2>
											<!-- <p>다양한 퀴즈에 도전해보세요</p> -->
										</header>
										
										<p>다양한 퀴즈에 도전하여, <br>명예의 전당에 이름을 올려보세요</p>
										<ul class="actions">
											<li><a href="#" class="button big">퀴즈도전</a></li>
										</ul>
									</div>
									<span class="image object">
										<img src="images/pic10.jpg" alt="" />
									</span>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>커뮤니티</h2>
									</header>
									<div class="features">
										<article>
											<a href="#" class="icon fa-diamond"></a>
											<div class="content">
											
												<!-- Table -->
													<h3>문제 업로드</h3>
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>게시자</th>
																	<th>게시물</th>
																	<th>조회수</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>sjlee</td>
																	<td>역사 문제 제출합니다.</td>
																	<td>3</td>
																</tr>
																<tr>
																	<td>Item2</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item3</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item4</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item5</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
															</tbody>
															<tfoot>
																<tr>
																	<td colspan="2"></td>
																	<td>...</td>
																</tr>
															</tfoot>
														</table>
													</div>
											</div>
										</article>
										<article>
											<a href="#" class="icon fa-paper-plane"></a>
											<div class="content">
												<!-- Table -->
													<h3>공지 게시판</h3>
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>게시자</th>
																	<th>게시물</th>
																	<th>조회수</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>adminsjlee</td>
																	<td>point 관련 공지사항</td>
																	<td>531</td>
																</tr>
																<tr>
																	<td>Item2</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item3</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item4</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item5</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
															</tbody>
															<tfoot>
																<tr>
																	<td colspan="2"></td>
																	<td>...</td>
																</tr>
															</tfoot>
														</table>
													</div>
											</div>
										</article>
										<article>
											<a href="#" class="icon fa-rocket"></a>
											<div class="content">
												<!-- Table -->
													<h3>자유 게시판</h3>
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>게시자</th>
																	<th>게시물</th>
																	<th>조회수</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>sjlee</td>
																	<td>개드립</td>
																	<td>20</td>
																</tr>
																<tr>
																	<td>Item2</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item3</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item4</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item5</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
															</tbody>
															<tfoot>
																<tr>
																	<td colspan="2"></td>
																	<td>...</td>
																</tr>
															</tfoot>
														</table>
													</div>
											</div>
										</article>
										<article>
											<a href="#" class="icon fa-signal"></a>
											<div class="content">
												<!-- Table -->
													<h3>베스트 게시물</h3>
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>게시자</th>
																	<th>게시물</th>
																	<th>조회수</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>sjlee</td>
																	<td>개드립</td>
																	<td>20</td>
																</tr>
																<tr>
																	<td>Item2</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item3</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item4</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
																<tr>
																	<td>Item5</td>
																	<td>...</td>
																	<td>...</td>
																</tr>
															</tbody>
															<tfoot>
																<tr>
																	<td colspan="2"></td>
																	<td>...</td>
																</tr>
															</tfoot>
														</table>
													</div>
											</div>
										</article>
									</div>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>신규 상품</h2>
									</header>
									<div class="posts">
										<article>
											<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
											<h3>상품이름</h3>
											<p>상품 설명 ...</p>
											<ul class="actions">
												<li><a href="#" class="button">자세히</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
											<h3>상품이름</h3>
											<p>상품 설명 ...</p>
											<ul class="actions">
												<li><a href="#" class="button">자세히</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
											<h3>상품이름</h3>
											<p>상품 설명 ...</p>
											<ul class="actions">
												<li><a href="#" class="button">자세히</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
											<h3>상품이름</h3>
											<p>상품 설명 ...</p>
											<ul class="actions">
												<li><a href="#" class="button">자세히</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
											<h3>상품이름</h3>
											<p>상품 설명 ...</p>
											<ul class="actions">
												<li><a href="#" class="button">자세히</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
											<h3>상품이름</h3>
											<p>상품 설명 ...</p>
											<ul class="actions">
												<li><a href="#" class="button">자세히</a></li>
											</ul>
										</article>
									</div>
								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>
								<section id="login" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Id" />
										<input type="text" name="query" id="query" placeholder="Password" />
										
									</form>
									<ul class="actions">
											<li><a href="#" class="button">로그인</a></li>
									</ul>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="index.html">Homepage</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
										<li class="fa-phone">(000) 000-0000</li>
										<li class="fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>
</body>
</html>