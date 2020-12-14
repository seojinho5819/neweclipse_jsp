<%@page import="board.model.MybatisBoardDAO"%>
<%@page import="common.board.Pager"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="board.model.Board"%>
<%@page import="board.model.BoardDAO"%>
<%
	MybatisBoardDAO dao = new MybatisBoardDAO();
	Pager pager = new Pager(); 
	List<Board> list = dao.selectAll();
	pager.init(request,list);
	

	
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}
th, td {
	text-align: left;
	padding: 16px;
	
}
tr:nth-child(even) {
	background-color: #f2f2f2;
}
a { text-decoration:none } 
</style>
</head>
<body>

	<table>
		<tr>
			<th width="5%">순번</th>
			<th width="20%">이미지</th>
			<th width="30%">제목</th>
			<th width="15%">작성자</th>
			<th width="20%">등록일</th>
			<th width="10%">조회수</th>
		</tr>
		<%
		int num=pager.getNum(); 
		int curPos=pager.getCurPos();
		int firstPage = pager.getFirstPage();
		int currentPage =  pager.getCurrentPage();
		int lastPage = pager.getLastPage();
		int blocksize = 10;
		int totalPage = pager.getTotalPage();
		
		
		%>
		<%for(int i=1;i<=pager.getPageSize();i++){ %>
		<%if(num<1)break; %>
		<%Board board = list.get(curPos++); %>
		
		
		<tr onMouseOver="showColor(this)" onMouseout="hideColor(this)">
			<td><%=num-- %></td>
			<td><img src="/data/<%=board.getFilename()%>" width="50px"></td>
			<td><a href="detail.jsp?board_id=<%=board.getBoard_id() %>"><%=board.getTitle() %></a></td>
			<td><%=board.getWriter()%></td>
			<td><%=board.getRegdate().substring(0,10) %></td>
			<td><%=board.getHit() %></td>
		</tr>
		<%} %>
		
			
		<tr>
			<td colspan="6" style="text-align:center">
				<%if(firstPage-1>=1){ %>
				<a href="list.jsp?currentPage=<%=currentPage-1%>">◀</a>
				<%}else{%>
				<a href="javascript:alert('첫번째 블록입니다');">◀</a>
				<%} %>
				<%for(int i=firstPage;i<blocksize;i++){ %>
				<%if(i>totalPage)break; %>
				<a href="/board/list.jsp?currentPage=<%=i%>">[<%=i %>]</a>
				<%} %>
				<%if((lastPage+1)<totalPage){ %>
				<a href="list.jsp?currentPage=<%=currentPage+1%>">▶</a>
				<%}else {%>
				<a href="javascript:alert('마지막 블록입니다');">▶</a>
				<%} %>
			</td>
		</tr>
		<tr >
			<td colspan="6">
				<button onClick="location.href='regist_form.jsp'">글등록</button>
			</td>
		</tr>
	</table>
</body>
</html>