<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="oe.market.mem.vo.OeMemVO"%>  
<%@page import="java.util.List"%>
<%@page import="oe.market.common.O_Session" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listLogin");
	if (obj == null) return;

	List<OeMemVO> list = (List<OeMemVO>)obj;
	int nCnt = list.size();

	if (nCnt == 1){
		String oid = list.get(0).getOid();
%>
		<script>
			alert("<%= oid %> 님 로그인 성공");
			window.opener.updateLoginStatus("<%= oid %>"); // 메인 페이지의 함수 호출
			window.close();
		</script>
<% 	
	} else {
%>	
	<script>
		var confirmMessage = "등록된 아이디가 없습니다. 회원가입 페이지로 이동하시겠습니까?";
		if (confirm(confirmMessage)) {
			window.opener.location.href = "memForm.oe"; // 회원가입 페이지로 이동
			window.close();
		} else {
			console.log("사용자가 회원가입을 취소했습니다.");
			window.close();
		}
	</script>
<%
	}
%>
</body>
</html>
