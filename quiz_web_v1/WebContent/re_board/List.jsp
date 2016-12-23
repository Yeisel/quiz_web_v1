<%@page import="myboard.bean.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>QuizBook FreeBoard</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />

</head>
<style>
t1 {font-size: 80px;}

t2 {font-size: 15px;}

h1, h2, h3, h4, h5, h6 {
	color: #3d4449;
	font-family: "Open Sans", sans-serif;
	font-weight: 800;
	line-height: 1.5;
	margin: 0 0 1em 0;
}

td {text-align: left;}

th {text-align: left;}
</style>

<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
	
	function fnRead(num){
		document.read.b_num.value = num;
		document.read.submit();
	}
</script>
<BODY>
<jsp:useBean id="dao" class="myboard.bean.BoardDao" />
<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	List list = dao.getBoardList(keyField, keyWord);
	//////////////////////////////////////////////
	// Paging ���
	
	int totalRecord = 0;	// ��ü ���� ����
	int numPerPage = 5;		// �� ������ �� ������ ���� ����
	int pagePerBlock = 3;	// �� �� �� ������ ��
	int totalPage = 0;		// ��ü ������ ��
	int totalBlock = 0;		// ��ü ����� ��
	int nowPage = 0;		// ���� ������ ��ȣ
	int nowBlock = 0;		// ���� �� ��ȣ
	int beginPerPage = 0;	// ������ �� ���۹�ȣ
	
	totalRecord = list.size();
	totalPage = (int)Math.ceil(((double)totalRecord/numPerPage));
	totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
	
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock")!=null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	beginPerPage = nowPage * numPerPage;
%>
<center><br>
<h2 id="content">���� �Խ���</h2>
				<p>������� �����ο� �������</p>

<table align=center border=0 width=80%>
<tr>
	<td align=left>Total :  Articles(
		<font color=red>  <%=nowPage+1%> / <%=totalPage%> Pages </font>)
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td> ��ȣ </td>
				<td> ���� </td>
				<td> �̸� </td>
				<td> ��¥ </td>
				<td> ��ȸ�� </td>
			</tr>
		<%
			if(list.size() == 0){
		%>
				<tr><td>��ϵ� ���� �����ϴ�.</td></tr>
		<%	
			}
			else{
				for(int i=beginPerPage; i<beginPerPage+numPerPage; i++){
					if(i == totalRecord)
						break;
					
					BoardDto dto = (BoardDto)list.get(i);
		%>
				<tr align="center">
					<td><%=dto.getB_num()%></td>
					<td align="left">
						<%=dao.useDepth(dto.getB_depth())%>
						<%
							if(dto.getB_depth()>0){
						%>
							<img src="../images/re.gif" />
						<%
							}
						%>
						<a href="javascript:fnRead('<%=dto.getB_num()%>')"><%=dto.getB_subject() %></a>
					</td>
					<td><%=dto.getB_name() %></td>
					<td><%=dto.getB_regdate() %></td>
					<td><%=dto.getB_count() %></td>
				</tr>
		<% 
				}
			}
		%>
		</table>
	</td>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>
	<td align="left">Go to Page &nbsp;&nbsp;&nbsp;
	<% if(nowBlock > 0){ %>
	<a href="List.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>">���� <%=pagePerBlock%>��</a>:::&nbsp;&nbsp;&nbsp;
	<% } %>
	<%
		for(int i=0; i<pagePerBlock; i++){
			if(i+(nowBlock * pagePerBlock) == totalPage)
				break;
	%>
		<a href="List.jsp?nowPage=<%=i+(nowBlock*pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock*pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
	<% 
		}
	%>
	<% if(totalBlock > nowBlock+1){ %>
	::: <a href="List.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">���� <%=pagePerBlock%>��</a> 
	<% } %>
	</td>
	<td align=right>
		<a href="Post.jsp">[�۾���]</a>
		<a href="List.jsp">[ó������]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="b_name"> �̸�
				<option value="b_subject"> ����
				<option value="b_content"> ����
			</select>

			<input type="text" size="16" name="keyWord" >
			<input type="button" value="ã��" onClick="check()">
			<!-- <input type="hidden" name="page" value= "0"> -->
		</td>
	</tr>
	</table>
</form>
</center>	

<form name="read" method="post" action="Read.jsp">
	<input type="hidden" name="b_num"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/>
	<input type="hidden" name="keyField" value="<%=keyField%>"/>
</form>

<jsp:include page="/re_board/main_bar.jsp" flush="false"/>
</body>
	<!-- Scripts -->
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="../assets/js/main.js"></script>

</html>