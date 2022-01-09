<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>뭘 삼?</h2>
	<%
		String vid1 = request.getParameter("id1");
		String vpw1 = request.getParameter("pw1");
	%>
	
	id : <%= vid1 %><br />
	pw : <%= vpw1 %>
	
	
	<!--  세션으로 작업 하기 위해서~ -->
	
	<%
		session.setAttribute("sid1", vid1);
		session.setAttribute("spw1", vpw1);
		
		//session.invalidate() ==> 세션 삭제
	%>
	
	가방쇼핑 <a href="kabang.jsp" > 여기 </a> 를 누르세요<br />
	구두쇼핑은 <a href="koodoo.jsp">여기</a> 를 누루ㅡ세요<br/>
	
	
</body>
</html>