<%@page import="admin.member.Admin"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/lib.jsp" %>
<%
	String admin_id="scott";
	String admin_pass="1234";
	/*
		원래는 DB조회를 해야하지만 추후 하기로하고 
		일단 스트링으로 비교해본다
	*/
	String mid =request.getParameter("mid");
	String password = request.getParameter("password");
	
	
	
	if(mid.equals(admin_id)&&password.equals(password)){
		//로그인 성공에 대한 보상!! 관리자페이지 보여주기
		//js의 location.href와 동일한 기능의 jsp기능 이용해보자
		Admin admin = new Admin();
		//관리자 VO를 담자!
		admin.setMid(mid);
		admin.setPassword(password);
		response.sendRedirect("/admin/index.jsp?admin_id="+admin.getMid());//클라이언트로 하여금 지정한 url로 요청을 시도하게끔 하는 기능 
	}else{
		out.print(getMsgBack("로그인실패"));
	}
	
%>