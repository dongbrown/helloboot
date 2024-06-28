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
<script>

// 수정 사항
// 시작 날짜보다 이전 종료 날짜 선택 못하도록
// 드래그앤 드롭 일정 수정 가능하도록
// 참석자 추가 버튼 눌러 (type : share)만 가능하도록 -> 해당 참석자에게도 일정 추가
// type : my / share 선택해서 해당 일정 select


jQuery(document).ready(function($) {
    // jQuery의 $ 대신 jQuery 사용 (noConflict 모드 사용) -> 다른 라이브러리에서 $ 사용 가능
    // Query 대신 jQuery()를 사용하여 jQuery 코드를 작성해야 함

    // FullCalendar 초기화
    $('#calendar').fullCalendar({
        timeZone: 'local',
        editable: true,
        events: function(start, end, timezone, callback) {
            // 이벤트 데이터 가져오기
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
            // 이벤트 드롭 시 처리
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
            // 이벤트 렌더링 시 배경색 설정
            element.css('background-color', event.color);
        },
        dayClick: function(date, jsEvent, view) {
            // 날짜 클릭 시 "일정 추가" 모달 열기
            $('#scheduleModal').modal('show');
            $('#scheduleDate').val(date.format('YYYY-MM-DD')); // 클릭한 날짜를 모달의 시작 날짜 필드에 설정
        },
        eventClick: function(calEvent, jsEvent, view) {
            // 이벤트 클릭 시 "일정 상세 보기/수정" 모달 열기
            $('#viewScheduleModal').modal('show');
            $('#viewScheduleId').val(calEvent.id);
            $('#viewScheduleTitle').val(calEvent.title);
            $('#viewScheduleStart').val(moment(calEvent.start).format('YYYY-MM-DD'));
            $('#viewScheduleEnd').val(calEvent.end ? moment(calEvent.end).format('YYYY-MM-DD') : '');
            $('#viewScheduleAllDay').prop('checked', calEvent.allDay);
            $('#viewScheduleColor').val(calEvent.color);
            $('#viewScheduleType').val(calEvent.type);
        }
    });

    // "일정 추가" 폼 제출 시 처리
    $('#addScheduleForm').on('submit', function(e) {
        e.preventDefault();
        var formData = {
            title: $('#scheduleTitle').val(),
            start: $('#scheduleDate').val(),
            end: $('#scheduleEnd').val(),
            allDay: $('#scheduleAllDay').is(':checked'),
            color: $('#scheduleColor').val(),
            type: $('input[name="scheduleType"]:checked').val() // 추가한 코드
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/schedule/addSchedule',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert('일정이 성공적으로 추가되었습니다.');
                $('#scheduleModal').modal('hide'); // 모달 닫기
                $('#calendar').fullCalendar('refetchEvents'); // 캘린더 이벤트 다시 불러오기
            },
            error: function(xhr, status, error) {
                alert('일정 추가 중 오류가 발생했습니다.');
            }
        });
    });

    // "일정 수정" 폼 제출 시 처리
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
                $('#viewScheduleModal').modal('hide'); // 모달 닫기
                $('#calendar').fullCalendar('refetchEvents'); // 캘린더 이벤트 다시 불러오기
            },
            error: function(xhr, status, error) {
                alert('일정 수정 중 오류가 발생했습니다.');
            }
        });
    });
});
</script>
</head>
<body>
<div id="calendar"></div>

<!-- 일정 추가 모달 -->
<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="scheduleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="scheduleModalLabel">일정 추가</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
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
    </div>
</div>


 <!-- 일정 상세 보기 및 수정 모달 -->
    <div class="modal fade" id="viewScheduleModal" tabindex="-1" role="dialog" aria-labelledby="viewScheduleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewScheduleModalLabel">일정 상세/수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateScheduleForm">
                    <div class="form-group">
                        <label>타입</label>
                        <input type="radio" id="scheduleTypeMy" name="scheduleType" value="my" checked>
                        <label for="scheduleTypeMy">My</label>
                        <input type="radio" id="scheduleTypeShare" name="scheduleType" value="share">
                        <label for="scheduleTypeShare">Share</label>
                    </div>
                        <input type="hidden" id="viewScheduleId">
                        <div class="form-group">
                            <label for="viewScheduleTitle">제목</label>
                            <input type="text" class="form-control" id="viewScheduleTitle" required>
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
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>