<%@page import="java.util.stream.Collectors"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="kr.or.ddit.seats.vo.SeatResVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<title>좌석 예약</title>
<style>
.flex {
	display: flex;
}

.flexcolumn {
	flex-direction: column;
	/*수직 정렬*/
}

#readingRoom .seat {
	width: 50px;
	height: 50px;
	border: 1px solid black;
	display: inline-block;
	margin: 5px;
	text-align: center;
	line-height: 50px;
	font-weight: bold;
}

#readingRoom .seat:not(.occupied):hover {
	background-color: #28AEFF;
	color: white;
}

#readingRoom .occupied {
	background-color: gray;
	color: white;
}

#readingRoom .selected {
	background-color: #28AEFF;
	color: white;
}

#readingRoom .seating-chart {
	margin-right: 20px;
	position: relative;
}

#readingRoom>h1 {
	text-align: center;
	margin-top: 80px;
	margin-bottom: -100px;
}

#readingRoom form {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	padding: 0;
	flex-direction: column;
	/*수직 정렬*/
}

#readingRoom .seating-chart-container {
    background-color: #fdfdfd;
	padding: 90px 65px 60px 65px;
	border-radius: 15px;
	display: flex;
	justify-content: center;
	border: 1px solid #c5c5c5;
    box-shadow: 0 0 5px rgba(0,0,0,0.3);
}

#readingRoom #reservation-button {
	display: inline-block;
	width: 120px;
	height: 45px;
	border: 1px solid white;
	margin-left: 5px;
	text-align: center;
	line-height: 50px;
	font-weight: bold;
	cursor: pointer;
	background-color: #28AEFF;
	color: white;
	border-radius: 5px;
	position: absolute;
	top: -68px;
	left: 0px;
	margin: 5px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#readingRoom #reservation-button:hover {
	background-color: #1b72a8;
}

#readingRoom #timeSet {
	color: black;
	margin-top: 20px;
	justify-content: center;
	align-items: center;
	text-align: center;
}

#readingRoom #timeSet p {
	margin: 0;
	font-size: 20px;
}

#timeSet input[type="time"], #timeSet input[type="date"] {
	margin: 10px;
	padding: 10px 10px;
	text-align: center;
	border-radius: 10px;
	border: 4px solid rgb(58, 57, 57);
	font-family: Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #2a2c2d;
	width: 180px;
}

#timeSet input[type="time"]::-webkit-datetime-edit-fields-wrapper,
	#timeSet input[type="date"]::-webkit-datetime-edit-fields-wrapper {
	display: flex;
	justify-content: center;
	/* 가로 중앙 정렬 */
}

#timeSet input[type="time"]::-webkit-datetime-edit-text, #timeSet input[type="date"]::-webkit-datetime-edit-text
	{
	padding: 10px 4px;
}

#timeSet input[type="time"]::-webkit-datetime-edit-hour-field, #timeSet input[type="time"]::-webkit-datetime-edit-minute-field,
	#dateSet input[type="date"]::-webkit-datetime-edit-year-field, #dateSet input[type="date"]::-webkit-datetime-edit-month-field,
	#dateSet input[type="date"]::-webkit-datetime-edit-day-field {
	height: 20px;
	background-color: #f2f4f5;
	color: #2a2c2d;
	border-radius: 15%;
	padding: 10px 7px;
	-webkit-appearance: none;
	margin: auto;
}

#dateSet input[type="date"]::-webkit-datetime-edit-day-field {
	width: 15px;
}

#timeSet input[type="time"]::-webkit-datetime-edit-ampm-field {
	background-color: #256aff;
	border-radius: 15%;
	color: #fff;
	width: 50px;
	height: 20px;
	padding: 10px 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#timeSet input[type="time"]::-webkit-clear-button, #timeSet input[type="date"]::-webkit-clear-button
	{
	display: none;
}

#timeSet input[type="time"]::-webkit-inner-spin-button, #timeSet input[type="date"]::-webkit-inner-spin-button
	{
	display: none;
}

#readingRoom #timeSet #middleText {
	margin: 10px 10px 0;
	font-size: 25px;
	font-weight: bold;
}
</style>
<link
	href="<%=request.getContextPath()%>/Carousel Template · Bootstrap v5.2_files/carousel.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/import.css">
<script>
      $(document).ready(function () {
        $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
        $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
        <%
        MemberVO memVO = (MemberVO) session.getAttribute("loginMember");
		List<SeatResVO> list = (List<SeatResVO>) request.getAttribute("seatsList");
		String message = (String) session.getAttribute("message");
		
		if (message != null) {
	%>
		alert("이미 예약한 좌석이 있습니다!");
	<%
		}
		session.removeAttribute("message");
	%>
      });

      

</script>
</head>

<body>

	<div id="header"></div>

	<div id="readingRoom">
		<h1>열람실 예약</h1>
		<form action="<%=request.getContextPath()%>/seats/seatReservation.do"
			method="get" id="reservationForm">
			<div class="seating-chart-container">
				<input type="hidden" id="selectedSeat" name="selectedSeat" value="">
				<input type="hidden" name="userId" value="<%=memVO.getMem_id()%>">
				<div class="seating-chart">
					<!-- Section A -->
					<div class="seat">A1</div>
					<div class="seat">A2</div>
					<br>
					<div class="seat">A3</div>
					<div class="seat">A4</div>
					<br>
					<div class="seat">A5</div>
					<div class="seat">A6</div>
					<br>
					<div class="seat">A7</div>
					<div class="seat">A8</div>
					<br>
					<div class="seat">A9</div>
					<div class="seat">A10</div>
					<br>
					<div class="seat">A11</div>
					<div class="seat">A12</div>
					<br>
				</div>
				<div class="seating-chart">
					<!-- Section B -->
					<div class="seat">B1</div>
					<div class="seat">B2</div>
					<br>
					<div class="seat">B3</div>
					<div class="seat">B4</div>
					<br>
					<div class="seat">B5</div>
					<div class="seat">B6</div>
					<br>
					<div class="seat">B7</div>
					<div class="seat">B8</div>
					<br>
					<div class="seat">B9</div>
					<div class="seat">B10</div>
					<br>
					<div class="seat">B11</div>
					<div class="seat">B12</div>
					<br>
				</div>
				<div class="seating-chart">
					<!-- Section C -->
					<div class="seat">C1</div>
					<div class="seat">C2</div>
					<br>
					<div class="seat">C3</div>
					<div class="seat">C4</div>
					<br>
					<div class="seat">C5</div>
					<div class="seat">C6</div>
					<br>
					<div class="seat">C7</div>
					<div class="seat">C8</div>
					<br>
					<div class="seat">C9</div>
					<div class="seat">C10</div>
					<br>
					<div class="seat">C11</div>
					<div class="seat">C12</div>
					<br>
				</div>
				<div class="seating-chart">
					<!-- Section D -->
					<button type="submit" id="reservation-button">좌석 예약</button>
					<div class="seat">D1</div>
					<div class="seat">D2</div>
					<br>
					<div class="seat">D3</div>
					<div class="seat">D4</div>
					<br>
					<div class="seat">D5</div>
					<div class="seat">D6</div>
					<br>
					<div class="seat">D7</div>
					<div class="seat">D8</div>
					<br>
					<div class="seat">D9</div>
					<div class="seat">D10</div>
					<br>
					<div class="seat">D11</div>
					<div class="seat">D12</div>
					<br>
				</div>
			</div>

			<div id="timeSet" class="flex">
				<div id="dateSet" class="flexcolumn">
					<p id="dateText">예약 날짜</p>
					<input type="date" id="dateInput" name="dateInput">
				</div>
				<div id="middleText">
					<span>:</span>
				</div>
				<div id="startSet" class="flexcolumn">
					<p id="startText">시작 시간</p>
					<input type="time" id="startTime" name="startTime">
				</div>
				<div id="middleText">
					<span>:</span>
				</div>
				<div id="endSet">
					<p id="endText">종료 시간</p>
					<input type="time" id="endTime" name="endTime">
				</div>
			</div>
		</form>
	</div>

	<div id="footer"></div>

	<script>
    // JavaScript 코드
    
    $(document).ready(function() {
	    var seatsList = <%=new Gson().toJson(list)%>; // JSP에서 JavaScript로 seatsList 전달
	
	    // JavaScript에서 seatsList를 순회하며 seat과 value 비교 후 occupied 부여
	    seatsList.forEach(function(seatRes) {
	   	 	var seatId = seatRes.seats_id.slice(2);
	   	 	var seatElements = document.querySelectorAll('.seat');
	     
	     	seatElements.forEach(function(seatElement) {
	       		if (seatElement.textContent === seatId) {
	         		seatElement.classList.add('occupied');
	       		}
	   		});
	    });
    });
   
    
    
    // 예약 전송 버튼
	// Form submit event handler
	document.getElementById('reservationForm').addEventListener('submit', function(event) {
		
	
	// Check if seat is selected
	  if (!selectedSeat) {
	    alert('좌석을 선택해주세요!');
	    event.preventDefault(); // Prevent form submission
	    return;
	  }
	
	  // Check if date is selected
	  var dateInput = document.getElementById('dateInput');
	  if (!dateInput.value) {
	    alert('날짜를 선택해주세요!');
	    event.preventDefault(); // Prevent form submission
	    return;
	  }
	
	  // Check if start time is selected
	  var startTimeInput = document.getElementById('startTime');
	  if (!startTimeInput.value) {
	    alert('시작 시간을 선택해주세요!');
	    event.preventDefault(); // Prevent form submission
	    return;
	  }
	
	  // Check if end time is selected
	  var endTimeInput = document.getElementById('endTime');
	  if (!endTimeInput.value) {
	    alert('종료 시간을 선택해주세요!');
	    event.preventDefault(); // Prevent form submission
	    return;
	  }
	
	});
    
    
    // 시간 JS

        // 분을 10분 단위로 선택할 수 있도록 설정하는 함수
        function setMinutesTo10Interval(inputElement) {
      // 현재 선택된 분
      var selectedMinutes = parseInt(inputElement.value.split(':')[1]);

      // 10분 단위로 가장 가까운 값으로 분 조정
      var adjustedMinutes = Math.round(selectedMinutes / 10) * 10;

      // 조정된 분을 반영하여 표시된 값 업데이트
      var adjustedTime = inputElement.value.split(':')[0] + ':' + adjustedMinutes.toString().padStart(2, '0');
      inputElement.setAttribute('data-value', adjustedTime);

      // 실제 값 업데이트
      var realTime = inputElement.value.split(':')[0] + ':' + adjustedMinutes.toString().padStart(2, '0');
      inputElement.value = realTime;
    }

    // 분이 변경될 때마다 10분 단위로 조정
    document.getElementById('startTime').addEventListener('change', function () {
      setMinutesTo10Interval(this);
    });

    document.getElementById('endTime').addEventListener('change', function () {
      setMinutesTo10Interval(this);
    });

    // 페이지 로드 시에도 초기 설정
    window.addEventListener('load', function () {
      var startTimeInput = document.getElementById('startTime');
      var endTimeInput = document.getElementById('endTime');

      // 시작시간과 종료시간 초기 설정
      setMinutesTo10Interval(startTimeInput);
      setMinutesTo10Interval(endTimeInput);

      // 종료시간 필드에 시작시간을 최소값으로 설정
      endTimeInput.min = startTimeInput.value;
    });


    // 시작시간 값보다 30분 이후만 선택할 수 있도록 설정하는 함수
    function setStartTimeRestriction() {
      var startTimeInput = document.getElementById('startTime');
      var endTimeInput = document.getElementById('endTime');

      // 시작시간 값
      var startTimeValue = startTimeInput.value;

      // 종료시간 값
      var endTimeValue = endTimeInput.value;

      /// Create Date objects for start time and end time
      var startTime = new Date('2023-05-18T' + startTimeValue + ':00');
      var endTime = new Date(startTime.getTime() + 30 * 60000); // Add 30 minutes to start time

      // Format the end time value in the format "HH:mm"
      var endTimeValue = ('0' + endTime.getHours()).slice(-2) + ':' + ('0' + endTime.getMinutes()).slice(-2);

      // Set the end time input value and min attribute
      endTimeInput.value = endTimeValue;
      endTimeInput.min = endTimeValue;
    }

    // 시작시간 값이 변경될 때마다 제한 설정
    document.getElementById('startTime').addEventListener('change', function () {
      setStartTimeRestriction();
    });

    // 페이지 로드 시에도 제한 설정
    window.addEventListener('load', function () {
      setStartTimeRestriction();
    });


    // 날짜 JS
    // 오늘 날짜를 가져옵니다.
    var today = new Date();

    // 1주일 후의 날짜를 계산합니다.
    var oneWeekLater = new Date(today.getTime() + (7 * 24 * 60 * 60 * 1000));

    // 시작 날짜 입력 필드의 최소 날짜를 설정합니다.
    var startDateInput = document.getElementById("dateInput");
    startDateInput.setAttribute("min", today.toISOString().split("T")[0]);

    // 시작 날짜 입력 필드의 최대 날짜를 설정합니다.
    startDateInput.setAttribute("max", oneWeekLater.toISOString().split("T")[0]);


    // 좌석 JS
    const seats = document.querySelectorAll('.seat');
	let selectedSeat = null;
	const selectedSeatInput = document.getElementById('selectedSeat');
	
	seats.forEach(seat => {
	  seat.addEventListener('click', () => {
	    if (selectedSeat !== null && selectedSeat !== seat) {
	      selectedSeat.classList.remove('selected');
	      selectedSeat.removeAttribute('name');
	    }
	
	    if (seat.classList.contains('selected') || seat.classList.contains('occupied')) {
	      seat.classList.remove('selected');
	      seat.removeAttribute('name');
	      selectedSeat = null;
	      selectedSeatInput.value = ''; // 선택된 좌석이 없으므로 hidden 필드의 값을 비움
	    } else {
	      seat.classList.add('selected');
	      seat.setAttribute('name', 'selected');
	      selectedSeat = seat;
	      selectedSeatInput.value = seat.textContent; // 선택된 좌석의 값을 hidden 필드에 설정
	    }
	  });
	});


  </script>
</body>

</html>