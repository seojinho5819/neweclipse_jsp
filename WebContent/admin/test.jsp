<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>
고양이가 발급한 세션 아이디는
<%
	/*
	jsp의 내장객체
	-request,response,out,application,session
	
	*/
	String id = session.getId();
	out.print(id);
	//고양이가 발급한 세션 아이디는 C25C0E4C58E397B0D3DCED5C203E3D88
%>
</body>
</html>