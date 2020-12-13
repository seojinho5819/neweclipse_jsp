<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="board.model.Board"%>
<%@page import="board.model.BoardDAO"%>
<%
	BoardDAO dao = new BoardDAO();
	List<Board> list = dao.selectAll();
	
	int totalRecord = list.size(); //총 레코드의 수
	int pageSize = 10;//페이지당 보여질 레코드 수
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize);//총 페이지 수
	int blocksize =10;//블록안에 보여질 페이지 수
	int currentPage =1;//현재 페이지
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int firstPage=currentPage -(currentPage-1)%blocksize;
	int lastPage=firstPage+(blocksize - 1);
	int curPos = (currentPage-1)*pageSize;
	int num= totalRecord-curPos;
	
	
	
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
			<th width="40%">제목</th>
			<th width="15%">작성자</th>
			<th width="25%">등록일</th>
			<th width="15%">조회수</th>
		</tr>
		<%for(int i=1;i<=pageSize;i++){ %>
		<%if(num<1) break;%>
		<%Board board = list.get(curPos++); %>
		
		<tr onMouseOver="showColor(this)" onMouseout="hideColor(this)">
			<td><%=num-- %></td>
			<td><a href="detail.jsp?board_id=<%=board.getBoard_id() %>"><%=board.getTitle() %></a></td>
			<td><%=board.getWriter()%></td>
			<td><%=board.getRegdate().substring(0,10) %></td>
			<td><%=board.getHit() %></td>
		</tr>
		<%} %>
		
		<tr>
			<td colspan="3" style="text-align:center">
				<%if(firstPage-1>=1){ %>
				<a href="list.jsp?currentPage=<%=currentPage-1%>">◀</a>
				<%}else{%>
				<a href="javascript:alert('첫번째 페이지입니다');">◀</a>
				<%} %>
				<%for(int i=firstPage;i<blocksize;i++){ %>
				<%if(i>totalPage)break; %>
				<a href="/board/list.jsp?currentPage=<%=i%>">[<%=i %>]</a>
				<%} %>
				<%if((lastPage+1)<totalPage){ %>
				<a href="list.jsp?currentPage=<%=currentPage+1%>">▶</a>
				<%}else {%>
				<a href="javascript:alert('마지막 페이지입니다');">▶</a>
				<%} %>
			</td>
		</tr>
		<tr >
			<td colspan="3">
				<button onClick="location.href='regist_form.jsp'">글등록</button>
			</td>
		</tr>
	</table>
</body>
</html>