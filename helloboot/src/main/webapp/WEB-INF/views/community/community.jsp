<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Community</title>
    <style>
        .community-container {
            font-family: Arial, sans-serif;
        }
        .section {
            margin-bottom: 20px;
        }
        .group {
            display: inline-block;
            border: 1px solid #ccc;
            padding: 10px;
            margin: 5px;
            width: 200px;
        }
        .group-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .user-icon {
            width: 30px;
            height: 30px;
            margin-right: 5px;
        }
        .star {
            color: gold;
            font-size: 20px;
        }
        .add-group {
            border: 1px dashed #ccc;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 200px;
            height: 100px;
            font-size: 24px;
            cursor: pointer;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
        }
        .modal-title {
            color: #6980ff;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
        }
        .radio-group {
            display: flex;
            justify-content: space-around;
            margin-bottom: 15px;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
        }
        .btn {
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }
        .btn-primary {
            background-color: #6980ff;
            color: white;
        }
        .btn-secondary {
            background-color: #f0f0f0;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="community-container">
        <h1>Community</h1>

        <div class="section">
            <h2>즐겨찾는 커뮤니티</h2>
            <div class="group">
                <div class="group-title">축구 모임 <span class="star">★</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
            <div class="group">
                <div class="group-title">AI 딥러닝 스터디 <span class="star">★</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
            <div class="group">
                <div class="group-title">주말 등산 모임 <span class="star">★</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
        </div>

        <div class="section">
            <h2>내 커뮤니티</h2>
            <div class="group">
                <div class="group-title">축구 모임 <span class="star">★</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
            <div class="group">
                <div class="group-title">AI 딥러닝 스터디 <span class="star">★</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
            <div class="group">
                <div class="group-title">주말 등산 모임 <span class="star">★</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
            <div class="group">
                <div class="group-title">아이디어 브레인 스토밍 <span class="star">☆</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
            <div class="group">
                <div class="group-title">마케팅 업무 <span class="star">☆</span></div>
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
                <img src="${pageContext.request.contextPath}/img/undraw_profile_1.svg" alt="User" class="user-icon">
            </div>
            <div class="add-group" id="addGroupBtn">
                +
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="createCommunityModal" class="modal">
        <div class="modal-content">
            <h2 class="modal-title">커뮤니티 만들기</h2>
            <form id="createCommunityForm">
                <div class="form-group">
                    <label for="communityName">커뮤니티명</label>
                    <input type="text" id="communityName" name="communityName" required>
                </div>
                <div class="form-group">
                    <label for="communityDescription">소개</label>
                    <textarea id="communityDescription" name="communityDescription" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label>공개 여부</label>
                    <div class="radio-group">
                        <label>
                            <input type="radio" name="visibility" value="public" checked> 공개
                        </label>
                        <label>
                            <input type="radio" name="visibility" value="private"> 비공개
                        </label>
                    </div>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        var modal = document.getElementById("createCommunityModal");
        var btn = document.getElementById("addGroupBtn");
        var cancelBtn = document.getElementById("cancelBtn");

        btn.onclick = function() {
            modal.style.display = "block";
        }

        cancelBtn.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        document.getElementById("createCommunityForm").onsubmit = function(e) {
            e.preventDefault();
            // Here you would typically send the form data to the server
            // For now, we'll just close the modal
            modal.style.display = "none";
        }
    </script>
</body>
</html>