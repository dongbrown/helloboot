<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FullCalendar with Drag and Drop</title>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
<style>
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<script>
jQuery(document).ready(function($) {
    $('#calendar').fullCalendar({
        timeZone: 'local',
        editable: true,
        events: function(start, end, timezone, callback) {
            $.ajax({
                url: '${pageContext.request.contextPath}/schedule/schedule',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    var events = [];
                    $(response).each(function() {
                        events.push({
                            id: $(this).attr('id'),
                            title: $(this).attr('title'),
                            start: $(this).attr('start'),
                            end: $(this).attr('end'),
                            allDay: $(this).attr('allDay'),
                            color: $(this).attr('color')
                        });
                    });
                    callback(events);
                },
                error: function(xhr, status, error) {
                    console.error("일정을 가져오는 중 오류 발생:", error);
                }
            });
        },
        eventDrop: function(event, delta, revertFunc) {
            if (!confirm("이 변경 사항을 저장하시겠습니까?")) {
                revertFunc();
            } else {
                $.ajax({
                    url: '${pageContext.request.contextPath}/updateSchedule',
                    data: JSON.stringify({
                        id: event.id,
                        title: event.title,
                        description: event.description,
                        color: event.color,
                        location: event.location,
                        type: event.type,
                        start: event.start.format(),
                        end: event.end ? event.end.format() : null,
                        allDay: event.allDay
                    }),
                    contentType: 'application/json',
                    type: 'POST',
                    success: function(response) {
                        alert('일정이 성공적으로 업데이트되었습니다.');
                    },
                    error: function(xhr, status, error) {
                        console.error("일정 업데이트 중 오류 발생:", error);
                        alert('일정 업데이트 중 오류가 발생했습니다.');
                        revertFunc();
                    }
                });
            }
        },
        eventRender: function(event, element) {
            element.css('background-color', event.color);
        },
        dayClick: function(date, jsEvent, view) {
            $('#scheduleModal').css('display', 'block');
            $('#scheduleDate').val(date.format('YYYY-MM-DD'));
        },
        eventClick: function(calEvent, jsEvent, view) {
            $('#viewScheduleModal').css('display', 'block');
            $('#viewScheduleId').val(calEvent.id);
            $('#viewScheduleTitle').val(calEvent.title);
            $('#viewScheduleStart').val(moment(calEvent.start).format('YYYY-MM-DD'));
            $('#viewScheduleEnd').val(calEvent.end ? moment(calEvent.end).format('YYYY-MM-DD') : '');
            $('#viewScheduleAllDay').prop('checked', calEvent.allDay);
            $('#viewScheduleColor').val(calEvent.color);
            $(`input[name="viewScheduleType"][value="${calEvent.type}"]`).prop('checked', true);
        }
    });

    $('.close').click(function() {
        $(this).closest('.modal').css('display', 'none');
    });

    $(window).click(function(event) {
        if ($(event.target).hasClass('modal')) {
            $('.modal').css('display', 'none');
        }
    });

    $('#addScheduleForm').on('submit', function(e) {
        e.preventDefault();
        var formData = {
            title: $('#scheduleTitle').val(),
            start: $('#scheduleDate').val(),
            end: $('#scheduleEnd').val(),
            allDay: $('#scheduleAllDay').is(':checked'),
            color: $('#scheduleColor').val(),
            type: $('input[name="scheduleType"]:checked').val()
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/schedule/addSchedule',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert('일정이 성공적으로 추가되었습니다.');
                $('#scheduleModal').css('display', 'none');
                $('#calendar').fullCalendar('refetchEvents');
            },
            error: function(xhr, status, error) {
                alert('일정 추가 중 오류가 발생했습니다.');
            }
        });
    });

    $('#updateScheduleForm').on('submit', function(e) {
        e.preventDefault();
        var formData = {
            id: $('#viewScheduleId').val(),
            title: $('#viewScheduleTitle').val(),
            start: $('#viewScheduleStart').val(),
            end: $('#viewScheduleEnd').val(),
            allDay: $('#viewScheduleAllDay').is(':checked'),
            color: $('#viewScheduleColor').val(),
            type: $('input[name="viewScheduleType"]:checked').val()
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/schedule/updateSchedule',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert('일정이 성공적으로 수정되었습니다.');
                $('#viewScheduleModal').css('display', 'none');
                $('#calendar').fullCalendar('refetchEvents');
            },
            error: function(xhr, status, error) {
                alert('일정 수정 중 오류가 발생했습니다.');
            }
        });
    });

    $(document).on('click', '#deleteScheduleBtn', function(){
        if(!confirm("정말로 이 일정을 삭제하시겠습니까?")){
            return;
        }
        var scheduleId = $('#viewScheduleId').val();

        $.ajax({
            url: '${pageContext.request.contextPath}/schedule/deleteSchedule',
            type: 'POST',
            data: {id: scheduleId},
            success: function(response){
                alert('일정이 삭제되었습니다.');
                $('#viewScheduleModal').css('display', 'none');
                $('#calendar').fullCalendar('refetchEvents');
            },
            error: function(xhr, status, error){
                alert('일정 삭제 중 오류가 발생했습니다: ' + xhr.responseText);
                console.error("Error details:", xhr.responseText);
            }
        });
    });
});
</script>
</head>
<body>
<div id="calendar"></div>

<!-- 일정 추가 모달 -->
<div id="scheduleModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h5>일정 추가</h5>
        <form id="addScheduleForm">
            <div class="form-group">
                <label>타입</label>
                <input type="radio" id="scheduleTypeMy" name="scheduleType" value="my" checked>
                <label for="scheduleTypeMy">내 캘린더</label>
                <input type="radio" id="scheduleTypeShare" name="scheduleType" value="share">
                <label for="scheduleTypeShare">공유 캘린더</label>
            </div>
            <div class="form-group">
                <label for="scheduleTitle">제목</label>
                <input type="text" class="form-control" id="scheduleTitle" required>
            </div>
            <div class="form-group">
                <label for="scheduleContent">내용</label>
                <input type="text" class="form-control" id="scheduleContent" required>
            </div>
            <div class="form-group">
                <label for="scheduleDate">시작 날짜</label>
                <input type="date" class="form-control" id="scheduleDate" required>
            </div>
            <div class="form-group">
                <label for="scheduleEnd">종료 날짜</label>
                <input type="date" class="form-control" id="scheduleEnd">
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="scheduleAllDay">
                <label class="form-check-label" for="scheduleAllDay">종일</label>
            </div>
            <div class="form-group">
                <label for="scheduleColor">색상</label>
                <input type="color" class="form-control" id="scheduleColor">
            </div>
            <button type="submit" class="btn btn-primary">저장</button>
        </form>
    </div>
</div>

<!-- 일정 상세 보기 및 수정 모달 -->
<div id="viewScheduleModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h5>일정 상세/수정</h5>
        <form id="updateScheduleForm">
            <div class="form-group">
                <label>타입</label>
                <input type="radio" id="viewScheduleTypeMy" name="viewScheduleType" value="my">
                <label for="viewScheduleTypeMy">내 캘린더</label>
                <input type="radio" id="viewScheduleTypeShare" name="viewScheduleType" value="share">
                <label for="viewScheduleTypeShare">공유 캘린더</label>
            </div>
            <input type="hidden" id="viewScheduleId">
            <div class="form-group">
                <label for="viewScheduleTitle">제목</label>
                <input type="text" class="form-control" id="viewScheduleTitle" required>
            </div>
            <div class="form-group">
                <label for="viewScheduleContent">내용</label>
                <input type="text" class="form-control" id="viewScheduleContent" required>
            </div>
            <div class="form-group">
                <label for="viewScheduleStart">시작 날짜</label>
                <input type="date" class="form-control" id="viewScheduleStart" required>
            </div>
            <div class="form-group">
                <label for="viewScheduleEnd">종료 날짜</label>
                <input type="date" class="form-control" id="viewScheduleEnd">
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="viewScheduleAllDay">
                <label class="form-check-label" for="viewScheduleAllDay">종일</label>
            </div>
            <div class="form-group">
                <label for="viewScheduleColor">색상</label>
                <input type="color" class="form-control" id="viewScheduleColor">
            </div>
            <button type="submit" class="btn btn-primary">수정</button>
            <button type="button" class="btn btn-danger" id="deleteScheduleBtn">삭제</button>
        </form>
    </div>
</div>
</body>
</html>