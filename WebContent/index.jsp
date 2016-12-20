<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function fnPageMove(page){
		$("#here").load(page);
	}
</script>

<link rel="stylesheet" href="assets/css/main.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
h1, h2, h3, h4, h5, h6{
	color:#3d4449;
	font-family: "맑은 고딕";
	font-weight:800;
	line-height:1.5;
	margin:0 0 1em 0;
} 
strong, b{
	color:#3d4449;
	font-weight: 600;
	font-family: "맑은 고딕";	
	
}
</style>
</head>
	<body>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.jsp" class="logo"><strong style="font-size:60px;">QuizBook</strong></a>
								</header>

							<!-- Banner -->
								<section >
									<div class="here" id="here">
									<header>
										<span class="image object" style="float:right;">
											<img src="images/pic10.jpg" alt="" />
										</span>	
										<h2>QuizBook에 오신것을 환영합니다.<br />
										by FirstClass Team</h2>
	
										<!-- <p>다양한 퀴즈에 도전해보세요</p> -->
									</header>
																		
									<p>다양한 퀴즈에 도전하여, <br>명예의 전당에 이름을 올려보세요</p>
									
									<ul class="actions">
									<li><a href="javascript:fnPageMove('quiz/quiz_main.jsp')" class="button big">퀴즈 도전</a></li>
									</ul>

									</div>
									
								</section>

							
							<!-- Section -->
								

						</div>	
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- login -->

								<section id="login" class="alt">
<%         
			if(session.getAttribute("logged") == null){
%>	
									<form method="post" action="login.jsp">
										<input type="text" name="userId" id="userId" placeholder="Id" />
										<input type="text" name="userPw" id="userPw" placeholder="Password" />
										<input type="submit" value="로그인" />	
									</form>
<%			
			}
			else{
%>					<form method="post" action="login.jsp">
						<input type="hidden" name="logout" value="guest"/>
						<img src="images/android-contact.png" width="18" height="18"/><br/>
						<%=session.getAttribute("logged")%> 님 어서오세요!!
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
						<input type="submit" value="로그아웃"/>
						<a href="javascript:fnPageMove('mypage/my_main.jsp')"><input type="button" value="마이페이지" /></a><br/>
						보유포인트Ʈ : 
						
					</form>
<%
			}
%>									
									
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="index.jsp"><strong style="font-size:18px;">HomePage</strong></a></li>
										<li>
											<span class="opener"><a href="javascript:fnPageMove('quiz/quiz_main.jsp')"><strong style="font-size:18px;">퀴즈</strong></a></span>
											<ul>
												<li><a href="javascript:fnPageMove('quiz/quiz_sang.jsp')"><strong style="font-size:14px;">상식 퀴즈</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_nsense.jsp')"><strong style="font-size:14px;">넌센스 퀴즈</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_sports.jsp')"><strong style="font-size:14px;">스포츠 퀴즈</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_history.jsp')"><strong style="font-size:14px;">역사 퀴즈</strong></a></li>
											</ul>
										</li>
										<li>
											<span class="opener"><strong style="font-size:18px;">포인트몰</strong></span>
											<ul>
												<li><a href="javascript:fnPageMove('shop/shop_main.jsp')"><strong style="font-size:14px;">쇼핑몰</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_order.jsp')"><strong style="font-size:14px;">주문배송조회</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_cart.jsp')"><strong style="font-size:14px;">장바구니</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_point.jsp')"><strong style="font-size:14px;">포인트조회</strong></a></li>
											
											
											</ul>
										</li>
										<li>
											<span class="opener"><strong style="font-size:18px;">커뮤니티</strong></span>
											<ul>
												<li><a href="javascript:fnPageMove('f_board/free_board.jsp')"><strong style="font-size:14px;">자유게시판</strong></a></li>
												<li><a href="javascript:fnPageMove('n_board/notice_board.jsp')"><strong style="font-size:14px;">공지게시판</strong></a></li>
												<li><a href="javascript:fnPageMove('q_board/up_board.jsp')"><strong style="font-size:14px;">문제업로드</strong></a></li>
											</ul>
										</li>
										<li><a href="#"><strong style="font-size:18px;">놀이터</strong></a></li>
										
									</ul>
								</nav>
							
							


							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/ie/respond.min.js"></script>
			<script src="assets/js/main.js"></script>


	</body>
</html>