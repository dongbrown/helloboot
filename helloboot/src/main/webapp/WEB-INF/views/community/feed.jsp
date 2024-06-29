<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community - AI 딥러닝 스터디</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feed.css">
<style>
/* 기존 스타일 유지 */
</style>
</head>
<body>

<div class="header">
<h1>Community</h1>
<button onclick="showAddParticipant()">+ 참석자 추가</button>
</div>

<h2>AI 딥러닝 스터디</h2>
<p>참석자: 김명준, 임성욱, 최선웅, 고재현, 김동훈</p>

<div>
<h3>소개</h3>
<p>생성형 AI 적용 및 알고리즘을 공부하는 스터디입니다.</p>
</div>

<div id="feed-container">
<!-- 게시물들이 여기에-->
</div>

<script>
let page = 1;
const size = 10;
let loading = false;
let hasMore = true;

function loadPosts() {
    if (loading || !hasMore) return;
    loading = true;

    $.ajax({
        url: '${pageContext.request.contextPath}/community/getPosts',
        method: 'GET',
        data: { page: page, size: size },
        success: function(response) {
            $('#feed-container').append(response);
            loading = false;
            page++;
            if (!$(response).find('.post').length) {
                hasMore = false;
            }
        },
        error: function(xhr, status, error) {
            console.error("Error loading posts:", error);
            loading = false;
        }
    });
}

function likePost(feedNo) {
    console.log('좋아요: ' + feedNo);
}

function showComments(feedNo) {
    console.log('댓글 표시: ' + feedNo);
}

$(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
        loadPosts();
    }
});

// 초기 로드
$(document).ready(function() {
    loadPosts();
});
</script>
</body>
</html>