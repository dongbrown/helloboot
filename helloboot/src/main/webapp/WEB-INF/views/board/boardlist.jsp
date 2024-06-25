<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 조회</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	
	<tbody>
		<c:if test="${not empty boards }">
			<c:forEach var="b" items="${boards }">
				<tr>
					<td>${b.boardNo}</td>
					<td>${b.boardTitle}</td>
					<td>${b.writer }</td>
					<td>${b.boardContent}</td>
					<td>${b.boardDate}</td>
					<td>${b.boardReadCount}</td>
				</tr>	
			</c:forEach>
		</c:if>
	</tbody>
	</table>
</body>
</html>