<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true" %>
<% response.setStatus(200); %> <!-- 강제로 에러가 없는 페이지라고 만드는 것. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<pre>
		다음과 같은 에러가 발생하였습니다.
		계속 에러가 발생하게된다면 상담원과 통화하시기 바랍니다.
		전화번호 : 02-1111-1111
	</pre>
	<hr>
	
	<!-- 내장객체 out re~ -->
	에러내용 <h3> <%= exception.getMessage() %></h3>
	<!-- 예: 나이를 빈칸으로 처리한 경우 에러내용은 For input string: isErrorPage="true" 없으면 exception 객체 사용 못함. -->
	
</body>
</html>