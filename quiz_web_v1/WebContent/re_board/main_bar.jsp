<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function fnPageMove(page){
		$("#here").load(page);
	}
	
	<script>
	function goBack() {
	    window.history.go(-2);
	}
	
</script>

<link rel="stylesheet" href="assets/css/main.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
h1, h2, h3, h4, h5, h6{
	color:#3d4449;
	font-family: "���� ����";
	font-weight:800;
	line-height:1.5;
	margin:0 0 1em 0;
} 
strong, b{
	color:#3d4449;
	font-weight: 600;
	font-family: "���� ����";	
	
}
</style>
</head>
	<body>

		

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
										<input type="submit" value="�α���" />	
									</form>
<%			
			}
			else{
%>					<form method="post" action="login.jsp">
						<input type="hidden" name="logout" value="guest"/>
						<img src="images/android-contact.png" width="18" height="18"/><br/>
						<%=session.getAttribute("logged")%> �� �氡!!
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
						<input type="submit" value="�α׾ƿ�"/>
						<a href="javascript:fnPageMove('mypage/my_main.jsp')"><input type="button" value="����������" /></a><br/>
						��������Ʈ : 
						
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
												<li><a href="javascript:fnPageMove('board/board_list.do')"><strong style="font-size:14px;">�����Խ���</strong></a></li>
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