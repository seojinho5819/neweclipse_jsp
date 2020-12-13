<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="board.model.Board" %>
<%@ page import="board.model.BoardDAO" %>
<%
	String board_id=request.getParameter("board_id");

	BoardDAO dao = new BoardDAO();
	Board board = dao.select(Integer.parseInt(board_id));
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
* {
	box-sizing: border-box;
}
input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}
input[type=button] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
input[type=button]:hover {
	background-color: #45a049;
}
.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	var bt_list=$("input[type='button']")[0];
	var bt_update=$("input[type='button']")[1];
	var bt_del=$("input[type='button']")[2];
	$(bt_list).click(function(){
		location.href="list.jsp";
	});
	$(bt_update).click(function(){
		update();			
	});
	$(bt_del).click(function(){
		del();
	});
	
});

	

function update(){
	$("form").attr({
		enctype:"multipart/form-data",
		action:"/board/update.jsp", 
		method:"post"
	});			
	$("form").submit();
}
function del(){
	$("form").attr({
		enctype:"multipart/form-data",
		action:"/board/del.jsp", 
		method:"post"
	});			
	$("form").submit();
}
</script>
</head>
<body>
	<h3>상세보기</h3>
	<div class="container">
		<form>
			<input type="text" name="title" value="<%=board.getTitle()%>">
			<input type="text" name="writer" value="<%=board.getWriter()%>"> 
			<textarea name="content"  style="height: 200px"><%=board.getContent() %></textarea>
			<img src="/data/<%=board.getFilename()%>" width="100px">
			<input type="file" name="photo" value="<%=board.getFilename()%>"><p>
			
			<input type="button" value="목록보기">
			<input type="button" value="글수정"> 
			<input type="button" value="삭제">
		</form>
	</div>

</body>
</html>