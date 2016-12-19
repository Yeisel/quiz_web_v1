<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/ie/respond.min.js"></script>
<script src="assets/js/main.js"></script>
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
<h3>신규 회원 가입</h3>
<h3>ID</h3>
<h3>PASSWORD</h3>
<h3>NAME</h3>
<h3>EMAIL</h3>
<h3>PHONE NUMBER</h3>
<h3>ADDRESS</h3>
<label>*. QUIZ BOOK 이용 약관 (반드시 읽어 주세요.)</label>
<select multiple class="form-control" style="width:1000px; height:600px;">
  <option>1. 관리자님께 욕 하면 강퇴.</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
</select>
<div class="checkbox">
	<input type="checkbox" id="policy" name="policy"/>
	<label for="policy">약관에 동의 함.</label>
</div>
<button type="submit"><strong style="font-size:18px; color:orange;">가입 신청</strong></button>
</body>
</html>