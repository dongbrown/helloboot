<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>나의 boot페이지</h2>
	<h3>경로 : ${path }</h3> <!-- "/" -> 여기가 root -->
	<c:if test="${1 == 1 }">
		<h3>되니?</h3>
	</c:if>
	<h3>
		<a href="${path }/board/boardlist.do">게시글</a>
	</h3>

	<h3>
		<a href="${path }/schedule">일정관리</a>
	</h3>



	<h3>파일 업로드처리하기</h3>
	<form action="${path }/fileupload.do" method="post" enctype="multipart/form-data">
		<input type="file" name="upFile">
		<input type="file" name="upFile">
		<input type="file" name="upFile">
		<input type="file" name="upFile">
		<input type="submit" value="저장">
	</form>

	<button onclick="accessChatting();">채팅 접속하기</button>
	<div id="chattingcontainer">

	</div>

	<script>
		let chatServer
		const accessChatting = () => {
			chatServer = new WebSocket("ws://localhost:9090/chat");
			chatServer.onopen = (response) => {
				console.log("서버 접속");
			}
		}
	</script>

</body>
</html>