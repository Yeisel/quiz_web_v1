<%@page import="prjdata.QuizUserDTO"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
<script>
	function fnPageMove(page){
		$("#here").load(page);
	}
</script>
<link rel="stylesheet" href="assets/css/main.css" />
<style>
h1, h2, h3, h4, h5, h6{
	color:#3d4449;
	font-family: "���� ���";
	font-weight:800;
	line-height:1.5;
	margin:0 0 1em 0;
} 
strong, b{
	color:#3d4449;
	font-weight: 600;
	font-family: "���� ���";	
	
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
								<section id="banner">
									<div class="here" id="here">
									<header>
										<span class="image object" style="float:right;">
											<img src="images/pic10.jpg" alt="" />
										</span>	
										<h2>QuizBook�� ���Ű��� ȯ���մϴ�.<br />
										by FirstClass Team</h2>
	
										<!-- <p>�پ��� ��� �����غ�����</p> -->
									</header>
																		
									<p>�پ��� ��� �����Ͽ�, <br>���� ���翡 �̸��� �÷�������</p>
									
									<ul class="actions">
									<li><a href="javascript:fnPageMove('quiz/quiz_main.jsp')" class="button big">�����</a></li>
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
			QuizUserDTO dto = (QuizUserDTO)request.getAttribute("dto");
			
			if(session.getAttribute("logged") == null){
%>	
									<form method="post" action="login.do">
										<input type="text" name="user_Id" id="user_Id" placeholder="Id" />
										<input type="text" name="user_Pw" id="user_Pw" placeholder="Password" />
										<input type="submit" value="�α���" />	
									</form>
<%			
			}
			else{
%>					
					<form method="post" action="login.do">
						<input type="hidden" name="logout" value="guest"/>
						<strong style="font-size:25px;font-weight:1000px"><%=session.getAttribute("logged")%></strong> �� �������!!
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
						<button type="submit"><strong style="font-size:13px; color:red;">�α׾ƿ�</strong></button>
						<a href="javascript:fnPageMove('mypage/my_main.jsp')" class="button"><strong style="font-size:13px; color:red;">����������</strong></a><br/>
						<br/>
						��������Ʈ : <%=dto.getUser_Current_Point()%>
						
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
									
									<form method="post" action="login.do">
										<input type="hidden" name="user_Id" value="<%=session.getAttribute("logged")%>"/>
										<input type="hidden" name="home" value="<%=session.getAttribute("logged")%>"/>
										<button type="submit"><strong style="font-size:18px; color:red;">��������</strong></button>
									</form>
									
									<ul>
										<li>
											<span class="opener"><a href="javascript:fnPageMove('quiz/quiz_main.jsp')"><strong style="font-size:18px;">����</strong></a></span>
											<ul>
												<li><a href="javascript:fnPageMove('quiz/quiz_sang.jsp')"><strong style="font-size:14px;">���</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_nsense.jsp')"><strong style="font-size:14px;">�ͼ���</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_sports.jsp')"><strong style="font-size:14px;">������</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_history.jsp')"><strong style="font-size:14px;">����</strong></a></li>
											</ul>
										</li>
										<li>
											<span class="opener"><strong style="font-size:18px;">����Ʈ��</strong></span>
											<ul>
												<li><a href="javascript:fnPageMove('shop/shop_main.jsp')"><strong style="font-size:14px;">���θ�</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_order.jsp')"><strong style="font-size:14px;">�ֹ������ȸ</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_cart.jsp')"><strong style="font-size:14px;">��ٱ���</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_point.jsp')"><strong style="font-size:14px;">����Ʈ��ȸ</strong></a></li>
											
											
											</ul>
										</li>
										<li>
											<span class="opener"><strong style="font-size:18px;">Ŀ�´�Ƽ</strong></span>
											<ul>
												<li><a href="javascript:fnPageMove('f_board/free_board.jsp')"><strong style="font-size:14px;">�����Խ���</strong></a></li>
												<li><a href="javascript:fnPageMove('n_board/notice_board.jsp')"><strong style="font-size:14px;">�����Խ���</strong></a></li>
												<li><a href="javascript:fnPageMove('q_board/up_board.jsp')"><strong style="font-size:14px;">�������ε�</strong></a></li>
											</ul>
										</li>
										<li><a href="#"><strong style="font-size:18px;">������</strong></a></li>
										
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