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
			alert("검색어를 입력하세요.");
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
	// Paging 기법
	
	int totalRecord = 0;	// 전체 글의 갯수
	int numPerPage = 5;		// 한 페이지 당 보여질 글의 갯수
	int pagePerBlock = 3;	// 한 블럭 당 페이지 수
	int totalPage = 0;		// 전체 페이지 수
	int totalBlock = 0;		// 전체 블록의 수
	int nowPage = 0;		// 현재 페이지 번호
	int nowBlock = 0;		// 현재 블럭 번호
	int beginPerPage = 0;	// 페이지 당 시작번호
	
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
<h2 id="content">자유 게시판</h2>
				<p>유저들과 자유로운 소통공간</p>

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
				<td> 번호 </td>
				<td> 제목 </td>
				<td> 이름 </td>
				<td> 날짜 </td>
				<td> 조회수 </td>
			</tr>
		<%
			if(list.size() == 0){
		%>
				<tr><td>등록된 글이 없습니다.</td></tr>
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
	<a href="List.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>">이전 <%=pagePerBlock%>개</a>:::&nbsp;&nbsp;&nbsp;
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
	::: <a href="List.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">다음 <%=pagePerBlock%>개</a> 
	<% } %>
	</td>
	<td align=right>
		<a href="Post.jsp">[글쓰기]</a>
		<a href="List.jsp">[처음으로]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="b_name"> 이름
				<option value="b_subject"> 제목
				<option value="b_content"> 내용
			</select>

			<input type="text" size="16" name="keyWord" >
			<input type="button" value="찾기" onClick="check()">
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