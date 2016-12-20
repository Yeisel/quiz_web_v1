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
                           
                           <!-- Form -->
                                       <h2>글쓰기</h2>

                                       <form method="post" action="board_insert_proc.jsp">
                                          <div class="row uniform">
                                             <div class="6u 12u$(xsmall)">
                                                <input type="text" name="userid" placeholder="ID" />
                                             </div>
                                             <!-- <div class="6u$ 12u$(xsmall)">
                                                 <input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" /> 
                                             </div> -->
                                             <!-- Break -->
                                             <div class="12u$">
                                                <div class="select-wrapper">
                                                   <input type="text" name="subject" placeholder="Title" />
                                                </div>
                                             </div>
                                             <!-- Break -->
                                             <div class="12u$">
                                                <textarea name="contents" placeholder="Enter your message" rows="6"></textarea>
                                             </div>
                                             <!-- Break -->
                                             <div class="12u$">
                                                <ul class="actions">
                                                   <li><input type="submit" value="글올리기" class="special" onclick="javascript:writeCheck();"/></li>
                                                   <li><input type="reset" value="다시쓰기" onclick="javascript:history.back(-1)"/></li>
                                                </ul>
                                             </div>
                                          </div>
                                       </form>
                           
                           
                           
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

					</section>


      <!-- Scripts -->
         <script src="../assets/js/jquery.min.js"></script>
         <script src="../assets/js/skel.min.js"></script>
         <script src="../assets/js/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="../assets/js/main.js"></script>


</body>
</html>