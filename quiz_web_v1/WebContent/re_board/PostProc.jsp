<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="myboard.bean.BoardDao" />
<jsp:useBean id="dto" class="myboard.bean.BoardDto" />
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertBoard(dto);
%>
<script>
	alert("���� �� ��ϵǾ����ϴ�.");
	location.href="List.jsp";
</script>