<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>  

<jsp:useBean id="dto" class="prjdata.QuizF_boardDTO"></jsp:useBean>

<<jsp:setProperty property="*" name="dto"/>


<%
   request.setCharacterEncoding("utf-8");

   Class.forName("com.mysql.jdbc.Driver");
   
   String url = "jdbc:mysql://192.168.1.54:3306/quiz_web_v1";
   String id = "firstclass";
   String pass = "1111";
   String userid = request.getParameter("userid");
   String subject = request.getParameter("subject");
   String contents = request.getParameter("contents");

   try {   
      Connection conn = DriverManager.getConnection(url,id,pass);
      
      String sql = "INSERT INTO f_board(f_board_subject,f_board_contents,f_board_id,f_board_date) VALUES (?,?,?,now())";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, subject);
      pstmt.setString(2, contents);
      pstmt.setString(3, userid);
      
      pstmt.executeUpdate();
      pstmt.close();
      conn.close();
      }
   
   catch(Exception e) {
      System.out.println(e);
   }
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="board_list.jsp"; 

</script>