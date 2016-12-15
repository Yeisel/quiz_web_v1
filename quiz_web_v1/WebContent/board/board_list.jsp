<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
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

<%
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://192.168.1.54:3306/quiz_web_v1";
   String id = "firstclass";
   String pass = "1111";
   int total = 0;
   
   try {
      Connection conn = DriverManager.getConnection(url,id,pass);
      Statement stmt = conn.createStatement();

      String sqlCount = "SELECT count(*) FROM f_board";
      ResultSet rs = stmt.executeQuery(sqlCount);
      
      if(rs.next()){
         total = rs.getInt(1);
      }
      rs.close();
      
      String sqlList = "SELECT * from f_board order by f_board_number ASC";
      rs = stmt.executeQuery(sqlList);      
%>


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
                           
                           <!-- Table -->
                                <h3>자유 게시판</h3>
                                <div class="table-wrapper">
                                   <table>
                                      <thead>
                                         <tr>
                                         	
                                            <th style="text-align:left" width="5%"><a2>선택</a2></th>
                                            <th style="text-align:left" width="10%"><a2>번호</a2></th>
                                            <th style="text-align:left" width="35%"><a2>게시물 제목</a2></th>
                                            <th style="text-align:left" width="15%"><a2>게시자</a2></th>
                                            <th style="text-align:left" width="10%"><a2>조회수</a2></th>
                                            <th style="text-align:left" width="15%"><a2>게시일</a2></th>
                                            <th style="text-align:left" width="10%"><a2>좋아요</a2></th>
                                            
                                         </tr>
                                       </thead>
<%
		if(total==0) {
%>
         <tr>
          <td colspan="6">등록된 글이 없습니다.</td>
         </tr>
<%
       } else {
          
      while(rs.next()) {
         int num = rs.getInt(1);
         String subject = rs.getString(2);
         String contents = rs.getString(3);
         String userid = rs.getString(4);
         int count = rs.getInt(5);
         String date = rs.getString(6);
         String good = rs.getString(7);
         String bad = rs.getString(8);
         int pos = rs.getInt(9);
         int depth = rs.getInt(10);   
%>

						<tr height="25" align="center">
						   <td style="text-align:left">
						   
						   <div class="6u$ 12u$(small)">
								<input type="checkbox" id="demo-human<%=num%>" name="demo-human" >
								<label for="demo-human<%=num%>"></label>
							</div>
						   
						   </td>
						   <td style="text-align:left"><%=num %></td>
						   <td style="text-align:left"><%=subject %></td>
						   <td style="text-align:left"><%=userid %></td>
						   <td style="text-align:left"><%=count %></td>
						   <td style="text-align:left"><%=date %></td>
						   <td style="text-align:left"><%=good %></td>
						</tr>
						                                       
                   







<% 
      }
   } 
   rs.close();
   stmt.close();
   conn.close();
} catch(SQLException e) {
   out.println( e.toString() );
}
%>


                          
                    </table>
                 </div>
                           

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




      <!-- Scripts -->
         <script src="../assets/js/jquery.min.js"></script>
         <script src="../assets/js/skel.min.js"></script>
         <script src="../assets/js/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="../assets/js/main.js"></script>


</body>
</html>