<%@page import="board.model.MybatisBoardDAO"%>
<%@page import="common.file.FileManager"%>
<%@page import="board.model.BoardDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="/inc/lib.jsp" %>
<%
	//넘겨받은 board_id를이용하여 글 한건삭제
	String board_id = request.getParameter("board_id");
	String filename = request.getParameter("filename");
	MybatisBoardDAO dao = new MybatisBoardDAO();
	
	//이미지 삭제하고 db레코드 지우기
	String path = application.getRealPath("/data");
	System.out.print(path+"/"+filename);
	if(FileManager.deleteFile(path+"/"+filename)){
		int result = dao.delete(Integer.parseInt(board_id));
	if(result==0){
		out.print(getMsgBack("게시물삭제 불가"));
	}else{
		out.print(getMsgURL("삭제성공","list.jsp"));
	}
		
	}else{
		out.print(getMsgBack("파일삭제 불가"));
	}
	
	



%>