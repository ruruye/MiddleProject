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
<title>좌석 관리</title>
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
	background-color: #EB0000;
	color: white;
}

#readingRoom .occupied {
	background-color: gray;
	color: white;
}

#readingRoom .selected {
	background-color: #EB0000;
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
	background-color: #EB0000;
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
	background-color: #c30000;
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
	color: #000000;
	border-radius: 15%;
	padding: 10px 7px;
	-webkit-appearance: none;
	margin: auto;
	font-weight: bold;
}

#dateSet input[type="date"]::-webkit-datetime-edit-day-field {
	width: 15px;
}

#timeSet input[type="time"]::-webkit-datetime-edit-ampm-field {
	background-color: #EB0000;
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
		List<SeatResVO> list = (List<SeatResVO>) request.getAttribute("seatsList");
    	String check = (String) session.getAttribute("returnCheck");
    	
    	if (check != null) {
	%>
			alert("좌석을 반납 처리했습니다.");
	<% 
		}
		session.removeAttribute("returnCheck");
	%>
      });

      

</script>
</head>

<body>

	<div id="header"></div>

	<div id="readingRoom">
		<h1>열람실 관리</h1>
		<form action="<%=request.getContextPath()%>/seats/seatReturn.do"
			method="get" id="reservationForm">
			<div class="seating-chart-container">
				<input type="hidden" id="selectedSeat" name="selectedSeat" value="">
				<input type="hidden" id="seatId" name="seatId" value="">
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
					<button type="submit" id="reservation-button">좌석 반납</button>
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
					<input type="date" id="dateInput" name="dateInput" disabled>
				</div>
				<div id="middleText">
					<span>:</span>
				</div>
				<div id="startSet" class="flexcolumn">
					<p id="startText">시작 시간</p>
					<input type="time" id="startTime" name="startTime" disabled>
				</div>
				<div id="middleText">
					<span>:</span>
				</div>
				<div id="endSet">
					<p id="endText">종료 시간</p> 
					<input type="time" id="endTime" name="endTime" disabled>
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
	    var seatIds = seatsList.map(function(seatRes) {
	    	  return seatRes.seats_id.slice(2);
    	});

    	var seatElements = document.querySelectorAll('.seat');

	    	seatElements.forEach(function(seatElement) {
	    	  var seatId = seatElement.textContent;

	    	  if (!seatIds.includes(seatId) && !seatElement.classList.contains('occupied')) {
	    	    seatElement.classList.add('occupied');
	    	}
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
	
	});


    // 좌석 JS
    const seats = document.querySelectorAll('.seat');
	let selectedSeat = null;
	const selectedSeatInput = document.getElementById('selectedSeat');
	
	seats.forEach(seat => {
	  seat.addEventListener('click', () => {
	    if (seat.classList.contains('occupied')) {
	      return; // occupied인 경우 클릭 무시
	    }

	    if (selectedSeat !== null && selectedSeat !== seat) {
	      selectedSeat.classList.remove('selected');
	      selectedSeat.removeAttribute('name');
	    }

	    if (seat.classList.contains('selected')) {
	      seat.classList.remove('selected');
	      seat.removeAttribute('name');
	      selectedSeat = null;
	      selectedSeatInput.value = ''; // 선택된 좌석이 없으므로 hidden 필드의 값을 비움
	    } else {
	      seat.classList.add('selected');
	      seat.setAttribute('name', 'selected');
	      selectedSeat = seat;
	      selectedSeatInput.value = seat.textContent; // 선택된 좌석의 값을 hidden 필드에 설정
	     
	      var selectSeats = selectedSeatInput.value;
		  <% for (SeatResVO vo : list) {
			  String id = vo.getSeats_id().substring(2);
		  %>
			  if (selectSeats === '<%= id %>') {
				  document.getElementById('dateInput').value = '<%= vo.getSres_date() %>';
				  document.getElementById('startTime').value = '<%= vo.getStart_time() %>';
				  document.getElementById('endTime').value = '<%= vo.getEnd_time() %>';
				  document.getElementById('seatId').value = '<%= vo.getSres_id() %>';
			  }
		  <% } %>
	    }
	    
	  });
	  
	});


  </script>
</body>

</html>