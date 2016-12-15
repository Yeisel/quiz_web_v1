<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
<%
	String id = "kskim1";
	String pass = "4444";
	String guest = "guest";
		
	if(id.equals(request.getParameter("userId")) && pass.equals(request.getParameter("userPw"))){
		System.out.println("첫번째 if문 진입");
		session.setAttribute("logged", id);
		response.sendRedirect("index.jsp");
	}
	else if(guest.equals(request.getParameter("logout"))){
		System.out.println("2번째 if문 진입");
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
	else{
		System.out.println("3번째 if문 진입");
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>