<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action= "${pageContext.request.contextPath}/logintest" method="post">
		<input name="username" type="text">
		<input name="password" type="password">
		<input type="submit" value="로그인">

	</form>
</body>
</html>