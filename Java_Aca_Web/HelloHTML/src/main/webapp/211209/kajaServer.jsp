<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="naerrorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int na2Soo1 = Integer.parseInt(request.getParameter("na2")); //na2의 값이 "숫자" 로 넘어오기 때문에 parseInt 해줘야됨
		out.println("나이는 " + na2Soo1);
		
	%>
</body>
</html>