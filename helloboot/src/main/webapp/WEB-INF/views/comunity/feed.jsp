<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Comunity - AI 딥러닝 스터디</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body { font-family: Arial, sans-serif; }
        .header { display: flex; justify-content: space-between; align-items: center; }
        .post { border-bottom: 1px solid #eee; padding: 10px 0; }
        .post-header { display: flex; justify-content: space-between; }
        .user-icon { width: 30px; height: 30px; border-radius: 50%; }
        .comment-input { width: 100%; padding: 5px; }
        .star { color: gold; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Comunity</h1>
        <button onclick="showAddParticipant()">+ 참석자 추가</button>
    </div>

    <h2>AI 딥러닝 스터디</h2>
    <p>참석자: 김명준, 임성옥, 최선용, 고재현, 김동훈</p>

    <div>
        <h3>소개</h3>
        <p>생성형 AI 적용 및 알고리즘을 공부하는 스터디입니다.</p>
    </div>

    <div id="feed-container">
        <!-- 게시물들이 여기에 로드됩니다 -->
    </div>

    <script>
    let page = 1;
    let loading = false;

    function loadPosts() {
        if (loading) return;
        loading = true;

        $.ajax({
            url: 'getPosts.jsp',
            method: 'GET',
            data: { page: page },
            success: function(response) {
                $('#feed-container').append(response);
                page++;
                loading = false;
            },
            error: function() {
                loading = false;
            }
        });
    }

    function showAddParticipant() {
        // 참석자 추가 모달 표시 로직
        alert("참석자 추가 기능은 아직 구현되지 않았습니다.");
    }

    $(window).scroll(function() {
        if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
            loadPosts();
        }
    });

    // 초기 로드
    loadPosts();
    </script>
</body>
</html>