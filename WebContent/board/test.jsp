<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="board.model.Board" %>
<%@ page import="board.model.BoardDAO" %>
<%
	String board_id=request.getParameter("board_id");

	out.print(board_id);
%>