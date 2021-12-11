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
			out.println("<h2>id 및 암호 입력에러입니다. 로그인화면으로 돌아갑니다</h2>");
			out.println("<a href='index.html'> 여기</a>를 누르세요<br />");
		} else{
			out.println("<img src='koodoo.jpg'>");
		}
	
	
	%><br /><br />
</body>
</html>

<!-- cos.jar 다운로드 및 설치
	http://servlets.com/cos/에서 cos-26Dec2008.zip 다운로드 후 압축풀기
	압축 푼 폴더의 cos-26Dec2008/lib의 cos.jar 파일을 복사(cos-20.08.zip푼다)
	/WebContent/WEB-INF/lib 안에 cos.jar를 복붙 (cf) 앞으로 들어갈 파일 3개 더 있음 standard.jar jstl.jar ojdbc8.jar
	적용 위해 프로젝트이름 새로고침, upload 전에 d:에 upbang폴더 생성.
	바탕화면에 올릴파일 하나(예:kabang.jpg)준비, "사용자"의 바탕화면에 있는 
	kabang.jpg를 서버의 "d드라이브 upbang 폴더(d:/upbang)에 올리기. -->