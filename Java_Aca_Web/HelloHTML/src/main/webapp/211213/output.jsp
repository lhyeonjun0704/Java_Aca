<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String irum = request.getParameter("irum");
	String score = request.getParameter("score");
	int score_r = Integer.parseInt(score);
	
	String kaja = null;
	if(score_r >= 90)
		kaja = "A";
	else if(score_r >= 80)
		kaja = "B";
	else if(score_r >= 70)
		kaja = "C";
	else
		kaja = "F";	
%>

이름은 <%= irum %> 이고<br />
학점은 <%= kaja %> 입니다.

<!-- 만일 출력을 따로 한다면 방향을 바꾸어서 해야되므로 remember? sendRedirect() 하지만 다른방식으로. -->

<!-- 
RequestDispatcher rd1 = request.getRequestDispatcher("../jspview/" + kaja + ".jsp");
rd1.forward(request, response);
 -->
<%
	request.setAttribute("babo", "ondal");
	request.getRequestDispatcher("../jspview/" + kaja + ".jsp").forward(request, response);
%>

</body>
</html>