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
		String sid1 = (String)session.getAttribute("sid1");
		String spw1 = (String)session.getAttribute("spw1");
	
		if(!sid1.equals("babo") || !spw1.equals("ondal")){
			out.println("<h2>id �� ��ȣ �Է¿����Դϴ�. �α���ȭ������ ���ư��ϴ�</h2>");
			out.println("<a href='index.html'> ����</a>�� ��������<br />");
		} else{
			out.println("<img src='koodoo.jpg'>");
		}
	
	
	%><br /><br />
</body>
</html>

<!-- cos.jar �ٿ�ε� �� ��ġ
	http://servlets.com/cos/���� cos-26Dec2008.zip �ٿ�ε� �� ����Ǯ��
	���� Ǭ ������ cos-26Dec2008/lib�� cos.jar ������ ����(cos-20.08.zipǬ��)
	/WebContent/WEB-INF/lib �ȿ� cos.jar�� ���� (cf) ������ �� ���� 3�� �� ���� standard.jar jstl.jar ojdbc8.jar
	���� ���� ������Ʈ�̸� ���ΰ�ħ, upload ���� d:�� upbang���� ����.
	����ȭ�鿡 �ø����� �ϳ�(��:kabang.jpg)�غ�, "�����"�� ����ȭ�鿡 �ִ� 
	kabang.jpg�� ������ "d����̺� upbang ����(d:/upbang)�� �ø���. -->