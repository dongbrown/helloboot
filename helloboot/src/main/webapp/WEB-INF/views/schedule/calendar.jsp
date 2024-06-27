<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FullCalendar with Drag and Drop</title>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
<script>
$(document).ready(function() {
	$('#calendar').fullCalendar({
	    timeZone: 'local',
	    editable: true,
	    events: function(start, end, timezone, callback) {
	        $.ajax({
	            url: '${pageContext.request.contextPath}/schedule/schedule',
	            type: 'GET',
	            dataType: 'json',
	            success: function(response) {
	                console.log("서버에서 받은 데이터:", response);
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
            console.log('날짜 클릭:', date.format());
            // 여기에 새 일정 추가 로직을 구현할 수 있습니다.
        },
        eventClick: function(event, jsEvent, view) {
            console.log('일정 클릭:', event.title);
            // 여기에 일정 상세 보기 또는 수정 로직을 구현할 수 있습니다.
        }
    });
});
</script>
</head>
<body>
	<div>
		<button onclick="">일정 추가</button>
	</div>
    <div id="calendar"></div>

</body>
</html>