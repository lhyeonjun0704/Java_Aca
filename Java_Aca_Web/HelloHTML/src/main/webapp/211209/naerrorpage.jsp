<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true" %>
<% response.setStatus(200); %> <!-- ������ ������ ���� ��������� ����� ��. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<pre>
		������ ���� ������ �߻��Ͽ����ϴ�.
		��� ������ �߻��ϰԵȴٸ� ������ ��ȭ�Ͻñ� �ٶ��ϴ�.
		��ȭ��ȣ : 02-1111-1111
	</pre>
	<hr>
	
	<!-- ���尴ü out re~ -->
	�������� <h3> <%= exception.getMessage() %></h3>
	<!-- ��: ���̸� ��ĭ���� ó���� ��� ���������� For input string: isErrorPage="true" ������ exception ��ü ��� ����. -->
	
</body>
</html>