<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feed.css">

<style>
    .feed-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
    }
    .post {
        background-color: #fff;
        border: 1px solid #dbdbdb;
        border-radius: 3px;
        margin-bottom: 60px;
    }
    .post-header {
        display: flex;
        align-items: center;
        padding: 14px 16px;
    }
    .user-icon {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        margin-right: 10px;
    }
    .user-name {
        font-weight: 600;
        color: #262626;
    }
    .post-date {
        color: #8e8e8e;
        font-size: 12px;
        margin-left: auto;
    }
    .post-content {
        padding: 0 16px 16px;
    }
    .post-actions {
        padding: 0 16px;
        margin-bottom: 8px;
    }
    .post-actions button {
        background: none;
        border: none;
        color: #262626;
        font-size: 14px;
        font-weight: 600;
        padding: 8px;
        cursor: pointer;
    }
    #load-more {
        background-color: #0095f6;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 5px 9px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        margin: 20px auto;
        display: block;
    }
</style>

<div class="feed-container">
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <c:forEach var="post" items="${posts}">
        <div class="post">
            <div class="post-header">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <span class="user-name">사용자 ${post.employeeNo}</span>
                <span class="post-date"><fmt:formatDate value="${post.feedEnrollDate}" pattern="yyyy년 MM월 dd일 HH:mm"/></span>
            </div>
            <div class="post-content">
                <p>${post.feedContent}</p>
            </div>
            <div class="post-actions">
                <button onclick="likePost(${post.feedNo})">
                    <i class="far fa-heart"></i>
                    <!-- 좋아요 눌렀으면  -->
                    <img src="${pageContext.request.contextPath }/img/heart.svg" alt="heart" class="heart">
                    <!-- 좋아요 안 눌렀으면 -->
                    <%-- <img src="${pageContext.request.contextPath }/img/empty-heart.svg" alt="emptyheart" class="emptyheart"> --%>
                </button>
                <button onclick="showComments(${post.feedNo})">
                    <i class="far fa-comment"></i> <img src="${pageContext.request.contextPath }/img/comment.svg" alt="comment" class="comment">
                </button>
            </div>
        </div>
    </c:forEach>


</div>