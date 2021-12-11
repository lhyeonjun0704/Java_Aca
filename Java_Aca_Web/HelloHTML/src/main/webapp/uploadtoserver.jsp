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
		MultipartRequest mr1 = new MultipartRequest(request, bang, 10*1024*1024, "euc-kr", new DefaultFileRenamePolicy()); //cos.jar에 있는 객체이다.
		// default~ 는 같은 이름이 있을 때 이름이 변경되어서 업로드 된다.
		// spring에서는 CommonsMultipartResolver 사용
		
		String virum1 = mr1.getParameter("irum1");
		/* String vfilename1 = mr1.getFilesystemName("file1"); */
		
		out.println("사용자이름은" + virum1 + "이시구요" + "<br>");
		out.println("파일 올리기 성공");
		
		/* if(vfilename1 != null){
			out.println("사용자 이름은" + virum1 + " 이시구요" + "<br />");
			out.println("추카추카" + vfilename1 + "라는 파일 올리기 성공");
		} else out.println("에러"); */
		
		
	%>
</body>
</html>