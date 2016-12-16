<%@page import="java.util.List"%>
<%@page import="prjbean.MainProc"%>
<%@page import="myboard.bean.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>QuizBook FreeBoard</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="../assets/css/main.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<style>
   a1 {font-size: 80px;}
   a2 {font-size: 15px;}
   
   h1, h2, h3, h4, h5, h6 {
      color: #3d4449;
      font-family: "Open Sans", sans-serif;
      font-weight: 800;
      line-height: 1.5;
      margin: 0 0 1em 0;
   }
   
   td {
		text-align:left;
   }
</style>

<body>
<jsp:useBean id="dao" class="myboard.bean.BoardDao" />
<%
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		List list = dao.getBoardList(keyField, keyWord);
		
		    
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
	if(list.size() == 0){
%>

                  <tr>
                     <td colspan="7">등록된 글이 없습니다.</td>
                  </tr>
<%
	}
	else{
		for(int i=0; i<list.size(); i++){
			BoardDto dto = (BoardDto)list.get(i);
%>

                  <tr height="25" align="center">
                     <td style="text-align:left">
                        <div class="6u$ 12u$(small)">
                           <input type="checkbox" id="demo-human<%=dto.getF_board_number()%>" name="demo-human" >
                           <label for="demo-human<%=dto.getF_board_number()%>"></label>
                        </div>
                     </td>
                     <td style="text-align:left"><%=dto.getF_board_number() %></td>
                     <td style="text-align:left"><a href="board_read.jsp?idx=<%=dto.getF_board_number()%>"><%=dto.getF_board_subject()%></a></td>
                     <td style="text-align:left"><%=dto.getF_board_id()%></td>
                     <td style="text-align:left"><%=dto.getF_board_count() %></td>
                     <td style="text-align:left"><%=dto.getF_board_date() %></td>
                     <td style="text-align:left"><%=dto.getF_board_good() %></td>
                  </tr>
<%
		}
	}


%>
                  
                  


            </table>
         </div>
         
         <span style="float:left">
            <input type="text">
            <a href="#" class="button special">검색</a>
         </span>
         
         <!-- Buttons -->
         
         <span style="float:right">
            <a href="#" class="button special" onclick="window.location='board_insert.jsp'">글쓰기</a>
            <a href="#" class="button special" onclick="javascript:history.back(-1)">처음으로</a>
         </span>
         
         <br/><br/>
         
         
         
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
      
<br/><br/><br/><br/><br/><br/>
</body>
</html>