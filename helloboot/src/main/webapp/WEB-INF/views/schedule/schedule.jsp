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
                editable: true,
                events:
                	/* '/schedule' */
                	[
                		{
                			title : 'event1',
                			start : '2024-06-27',
                			end : '2024-06-29'
                		},
                		{
                			title : 'event2',
                			start : '2024-06-16',
                			end : '2024-06-22'
                		}

                	]
                	, // 이벤트 데이터를 가져올 경로
                eventDrop: function(event, delta, revertFunc) {
                    if (!confirm("Are you sure about this change?")) {
                        revertFunc();
                    } else {
                        $.ajax({
                            url: '/updateSchedule',
                            data: JSON.stringify({
                                id: event.id,
                                start: event.start.format(),
                                end: event.end ? event.end.format() : null
                            }),
                            contentType: 'application/json',
                            type: 'POST',
                            success: function(response) {
                                alert('Schedule updated successfully');
                            },
                            error: function() {
                                alert('There was an error while updating the schedule');
                                revertFunc();
                            }
                        });
                    }
                }
            });
        });
    </script>
</head>
<body>
    <div id='calendar'></div>
</body>
</html>
