<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�� ��?</h2>
	<%
		String vid1 = request.getParameter("id1");
		String vpw1 = request.getParameter("pw1");
	%>
	
	id : <%= vid1 %><br />
	pw : <%= vpw1 %>
	
	
	<!--  �������� �۾� �ϱ� ���ؼ�~ -->
	
	<%
		session.setAttribute("sid1", vid1);
		session.setAttribute("spw1", vpw1);
		
		//session.invalidate() ==> ���� ����
	%>
	
	������� <a href="kabang.jsp" > ���� </a> �� ��������<br />
	���μ����� <a href="koodoo.jsp">����</a> �� ����Ѽ���<br/>
	
	
</body>
</html>