<%@ page contentType="text/html;charset=utf-8"%>
<%
	//세션은 객체이므로 개발자가 직접 메모리에서 제거할 수 없다
	//따라서 세션을 더이상 가용하지 않도록 무요화 시미자
	session.invalidate();
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="/admin/login_form.jsp";
</script>