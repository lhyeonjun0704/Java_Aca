<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		String bang = "C:/Users/ih919/GitHub/JSP_IMG";
		MultipartRequest mr1 = new MultipartRequest(request, bang, 10*1024*1024, "euc-kr", new DefaultFileRenamePolicy()); //cos.jar�� �ִ� ��ü�̴�.
		// default~ �� ���� �̸��� ���� �� �̸��� ����Ǿ ���ε� �ȴ�.
		// spring������ CommonsMultipartResolver ���
		
		String virum1 = mr1.getParameter("irum1");
		/* String vfilename1 = mr1.getFilesystemName("file1"); */
		
		out.println("������̸���" + virum1 + "�̽ñ���" + "<br>");
		out.println("���� �ø��� ����");
		
		/* if(vfilename1 != null){
			out.println("����� �̸���" + virum1 + " �̽ñ���" + "<br />");
			out.println("��ī��ī" + vfilename1 + "��� ���� �ø��� ����");
		} else out.println("����"); */
		
		
	%>
</body>
</html>