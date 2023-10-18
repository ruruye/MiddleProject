<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/register.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta name="theme-color" content="#712cf9">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/import.css">

<style>
.mainDiv {
	margin: 100px auto 50px;
}

.mainDiv input, .mainDiv select, .mainDiv label {
	font-size: 14px;
	/* Adjust the font size of the form elements */
	margin-bottom: 10px;
	/* Add spacing below each form element */
}

.mainDiv>div>div {
	margin: 5px;
}

.mainDiv>div>div * {
	margin: 1px;
}

.mainDiv #id {
	width: 255px;
}

.mainDiv #postcode {
	width: 48%;
}
</style>

<script>
	$(document).ready(function () {
	    $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
	    $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
	});	
	</script>
</head>
<%
MemberVO vo = (MemberVO) request.getAttribute("memberVO");
%>
<body>
	<div id="header"></div>

	<!-- 회원가입 폼 -->
	<form class="mainDiv"
		action="<%=request.getContextPath()%>/member/upadteMember.do"
		method="post">
		<h2>회원 정보 수정</h2>
		<div id="signupInput">
			<div>
				<label for="id">아이디</label> <input type="text" id="id" name="id"
					value="<%=vo.getMem_id()%>" readonly required>
			</div>

			<div>
				<label>이름</label> <input type="text" id="name" name="name"
					value="<%=vo.getMem_name()%>" required>
			</div>

			<div>
             <label for="birthday-year">생년월일</label>
            <div id="birthday">
                <select id="birthday-year" name="birthday-year" required>
                    <option value="" disabled selected hidden>년도</option>
                    <!-- 생년월일 범위에 맞게 옵션 추가 -->
                </select>
                <select id="birthday-month" name="birthday-month" required>
                    <option value="" disabled selected hidden>월</option>
                    <!-- 생년월일 범위에 맞게 옵션 추가 -->
                </select>
                <select id="birthday-day" name="birthday-day" required>
                    <option value="" disabled selected hidden>일</option>
                    <!-- 생년월일 범위에 맞게 옵션 추가 -->
                </select>
            </div>
            </div>

			<div>
				<label for="email">이메일</label> <input type="email" id="email"
					name="email" value="<%=vo.getMem_email()%>" required
					placeholder="abc123@naver.com">
			</div>

			<div>
				<label for="phone">전화번호</label> <input type="tel" id="phone"
					name="phone" value="<%=vo.getMem_tel()%>" required
					placeholder="010-1234-1234">
			</div>

			<div>
			<% String[] arr = vo.getMem_adrs().split("_"); %>
				<label for="add1">주소</label> <input type="text" id="postcode"
					name="postcode" value="<%=arr[0]%>" required readonly
					placeholder="우편번호"> <input type="button" value="주소 검색"
					id="addBtn" onclick="findAddr()"> <label for="add1"></label>
				<input type="text" id="add1" name="add1" value="<%=arr[1]%>"
					required readonly placeholder="주소"> <label for="add2"></label>
				<input type="text" id="add2" name="add2" value="<%=arr[2]%>"
					required placeholder="상세 주소">
			</div>


			<div id="signupBtn">
				<input type="submit" value="회원 정보 수정" id="insertBtn">
			</div>
		</div>
	</form>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.5.1/js/bootstrap.bundle.min.js"></script>
	<script>
    
		function showPrompt() {
			alert("미구현 상태입니다.");
		}

		function validatePasswords() {
			var password = document.getElementById('password').value;
			var passwordConfirm = document.getElementById('password-confirm').value;
			var passwordError = document.querySelector('.invalid-feedback');
			var passwordSuccess = document.querySelector('.valid-feedback');

			if (password !== passwordConfirm) {
				document.getElementById('password').classList.add('is-invalid');
				document.getElementById('password-confirm').classList
						.add('is-invalid');
				document.getElementById('password').classList
						.remove('is-valid');
				document.getElementById('password-confirm').classList
						.remove('is-valid');
				passwordError.style.display = 'block';
				passwordSuccess.style.display = 'none';
				return false;
			} else {
				document.getElementById('password').classList
						.remove('is-invalid');
				document.getElementById('password-confirm').classList
						.remove('is-invalid');
				document.getElementById('password').classList.add('is-valid');
				document.getElementById('password-confirm').classList
						.add('is-valid');
				passwordError.style.display = 'none';
				passwordSuccess.style.display = 'block';
				return true;
			}

			// Add the following code after the if-else statement:
			if (password === '' && passwordConfirm === '') {
				document.getElementById('password').classList
						.remove('is-invalid');
				document.getElementById('password-confirm').classList
						.remove('is-invalid');
				document.getElementById('password').classList
						.remove('is-valid');
				document.getElementById('password-confirm').classList
						.remove('is-valid');
				passwordError.style.display = 'none';
				passwordSuccess.style.display = 'none';
			}
		}
		
		const birthDate = "<%=vo.getMem_bir()%>";
		const [y, m, d] = birthDate.split("-");
		
		const currentYear = new Date().getFullYear();
		const selectYear = document.getElementById("birthday-year");
		for (let year = currentYear; year >= 1940; year--) {
			const option = document.createElement("option");
			option.value = year;
			option.textContent = year + "년";
			if (year === parseInt(y)) {
		        option.selected = true; // 해당 연도를 기본 선택값으로 설정
		    }
			selectYear.appendChild(option);
		}
		const selectMonth = document.getElementById("birthday-month");
		for (let month = 1; month <= 12; month++) {
			const option = document.createElement("option");
			option.value = month < 10 ? "0" + month : month;
			option.textContent = month + "월";
			if (month === parseInt(m)) {
		        option.selected = true; // 해당 월을 기본 선택값으로 설정
		    }
		    selectMonth.appendChild(option);
		}
		const selectDay = document.getElementById("birthday-day");
		for (let day = 1; day <= 31; day++) {
			const option = document.createElement("option");
			option.value = day < 10 ? "0" + day : day;
			option.textContent = day + "일";
		    if (day === parseInt(d)) {
		        option.selected = true; // 해당 일을 기본 선택값으로 설정
		    }
			selectDay.appendChild(option);
		}
		function findAddr() {
			new daum.Postcode({
				oncomplete : function(data) {

					console.log(data);

					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var jibunAddr = data.jibunAddress; // 지번 주소 변수
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.querySelector('#postcode').value = data.zonecode;
					if (roadAddr !== '') {
						document.querySelector('#add1').value = roadAddr;
					}
				}
			}).open();

		}
	</script>

	<div id="footer"></div>
</body>

</html>