<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://192.168.1.54:3306/quiz_web_v1";
	String id = "firstclass";
	String pass = "1111";

	int num = Integer.parseInt(request.getParameter("idx"));

	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT f_board_id, f_board_subject, f_board_contents, f_board_date, f_board_count FROM f_board WHERE f_board_number=" + num;
		ResultSet rs = stmt.executeQuery(sql);

		 if(rs.next()){
				String f_board_id = rs.getString(1);
				String f_board_subject = rs.getString(2);
				String f_board_contents = rs.getString(3);
				String f_board_date = rs.getString(4);
				int f_board_count = rs.getInt(5);

				f_board_count++;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Elements - Editorial by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="../assets/css/main.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>

   <style>
   a1 {
      font-size: 80px;
      
   }
   
   a2 {
      font-size: 15px;
   }
   
   
   h1, h2, h3, h4, h5, h6 {
      color: #3d4449;
      font-family: "Open Sans", sans-serif;
      font-weight: 800;
      line-height: 1.5;
      margin: 0 0 1em 0;
   }
   
   </style>


<body>

      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Main -->
               <div id="main">
                  <div class="inner">

                     <!-- Header -->
                        <header id="header">
                           <a href="#" class="logo"><a1><strong>Quiz Book</strong></a1>&nbsp;&nbsp;&nbsp; by firstclass</a>
                           
                        </header>

                     <!-- Content -->
                        <section>
                        <!-- 
                           <header class="main">
                              <h1>하이하이하이</h1>
                           </header>
                         -->
                           <!-- Content -->
                              <h2 id="content">COMMUNITY</h2>
                              <p>유저들과 자유로운 소통공간</p>
                              
                           <hr class="major" />
                           
                          <!-- Content -->
                          		<h2 id="content"><%=f_board_subject %></h2>

                          		<!-- Table -->
                          		
													<div class="table-wrapper">


   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=white width=10%> 이 름 </td>
	 <td bgcolor=white><%=f_board_id %></td>
	 <td align=center bgcolor=white width=10%> 등록날짜 </td>
	 <td bgcolor=white><%=f_board_date %></td>
	</tr>
    <tr>
	 <td align=center bgcolor=white width=10%> 메 일 </td>
	 <td bgcolor=white >몰라 ㅅㅂ</td> 
	 <td align=center bgcolor=white width=10%> 홈페이지 </td>
	 <td bgcolor=white ><a href="http://aaaa" target="_new">http://aaaa</a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=white> 제 목</td>
     <td bgcolor=white colspan=3><%=f_board_subject %></td>
   </tr>
   
   
   </table>
  
													</div>
													
                          		<p><%=f_board_contents %></p>
<% 
 	sql = "UPDATE f_board SET f_board_count=" + f_board_count + " where f_board_number=" +num;
 	stmt.executeUpdate(sql);
 	rs.close();
 	stmt.close();
 	conn.close();
	} 
	}
	catch(Exception e) {
		System.out.println("update" + e);
}

%>
	
								<br/><br/><br/><br/>
								<hr/>
								

								<tr>
								  <td align=center colspan=2>
									[ <input type="button" onclick="window.location='board_list.jsp'" value="목 록"> |
									<input type="button" onclick="" value="수 정"> |
									<input type="button" onclick="" value="삭 제"> |
									<input type="button" onclick="" value="답 변"> ]<br>
								  </td>
								 </tr>
								
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
                           		
                           		
                           <br/><br/>
                           <!-- Table -->
                                <h3>자유 게시판</h3>
                                <div class="table-wrapper">
                                   <table>
                                      <thead>
                                         <tr>
                                            <th style="text-align:left" width="10%"><a2>번호</a2></th>
                                            <th style="text-align:left" width="40%"><a2>게시물 제목</a2></th>
                                            <th style="text-align:left" width="15%"><a2>게시자</a2></th>
                                            <th style="text-align:left" width="10%"><a2>조회수</a2></th>
                                            <th style="text-align:left" width="15%"><a2>게시일</a2></th>
                                            <th style="text-align:left" width="10%"><a2>좋아요</a2></th>
                                            
                                         </tr>
 


                          
                    </table>
                 </div>
                           

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




      <!-- Scripts -->
         <script src="../assets/js/jquery.min.js"></script>
         <script src="../assets/js/skel.min.js"></script>
         <script src="../assets/js/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="../assets/js/main.js"></script>


</body>
</html>