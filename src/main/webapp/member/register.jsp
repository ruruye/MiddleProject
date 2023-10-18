<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <meta name="theme-color" content="#712cf9">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">

        <style>
			        
			#signupInput {
				width: 250px;
			}
			
			.mainDiv #id, #postcode {
			    width: 61.5%
			}
			
            .mainDiv {

                margin: 100px auto 50px;
            }

            .mainDiv input,
            .mainDiv select,
            .mainDiv label {
                font-size: 14px;
                margin-bottom: 10px;
                width: 243px;
            }


            .mainDiv>div>div {
                margin: 5px 0;
            }

            .mainDiv>div>div * {
                margin: 1px;
            }

        </style>

        <script>
            $(document).ready(function () {
                $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
                $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
            });	
        </script>
    </head>

    <body>

        <div id="header"></div>

        <!-- 회원가입 폼 -->
        <form class="mainDiv" action="<%=request.getContextPath()%>/member/memberAddSave.do" method="post">
            <h2>회원가입</h2>
            <div id="signupInput">
                <div>
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" required>
                    <input type="button" value="중복확인" id="idBtn">
                </div>
                <div>
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" required>
                    <label for="password-confirm">비밀번호 확인</label>
                    <input type="password" id="password-confirm" name="password-confirm" required>
                    <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                    <div class="valid-feedback">비밀번호가 일치합니다.</div>
                </div>

                <div>
                    <label>이름</label>
                    <input type="text" id="name" name="name" required>
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
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" required placeholder="abc123@naver.com">
                </div>

                <div>
                    <label for="phone">전화번호</label>
                    <input type="tel" id="phone" name="phone" required placeholder="010-1234-1234">
                </div>

                <div>
                    <label for="add1">주소</label>

                    <input type="text" id="postcode" name="postcode" required readonly placeholder="우편번호">
                    <input type="button" value="주소 검색" id="addBtn" onclick="findAddr()">

                    <label for="add1"></label>
                    <input type="text" id="add1" name="add1" required readonly placeholder="주소">
                    <label for="add2"></label>
                    <input type="text" id="add2" name="add2" required placeholder="상세 주소">
                </div>


                <div id="signupBtn">
                    <input type="submit" value="회원가입" id="insertBtn">
                </div>
            </div>
        </form>

        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.5.1/js/bootstrap.bundle.min.js"></script>
        <script>

            $(function () {
                $('#idBtn').on('click', function () {
                    // 입력된 ID 값 가져오기
                    var idValue = $('#id').val();

                    // 서블릿 URL 설정
                    var servletUrl = '<%=request.getContextPath()%>/member/checkId.do';

                    // AJAX 요청 보내기
                    $.ajax({
                        url: servletUrl,
                        type: 'POST',
                        data: { id: idValue },
                        success: function (response) {
                            // 서블릿에서 받은 응답 처리
                            if (response === '중복') {
                                alert('중복된 ID입니다.');
                            } else {
                                alert('사용 가능한 ID입니다.');
                                $('#id').prop('readonly', true); // 읽기 전용으로 설정
                            }
                        },
                        error: function (xhr) {
                            alert('오류 : ' + xhr.status);
                            $('#id').prop('readonly', false); // 편집 가능하도록 변경
                        }
                    });
                });


            });


            // 비밀번호 입력 필드 값이 변경될 때마다 유효성 검사 실행
            document.getElementById('password-confirm').addEventListener('input', validatePasswords);
            document.getElementById('password').addEventListener('input', validatePasswords);

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
                    document.getElementById('password-confirm').classList.add('is-invalid');
                    document.getElementById('password').classList.remove('is-valid');
                    document.getElementById('password-confirm').classList.remove('is-valid');
                    passwordError.style.display = 'block';
                    passwordSuccess.style.display = 'none';
                    return false;
                } else {
                    document.getElementById('password').classList.remove('is-invalid');
                    document.getElementById('password-confirm').classList.remove('is-invalid');
                    document.getElementById('password').classList.add('is-valid');
                    document.getElementById('password-confirm').classList.add('is-valid');
                    passwordError.style.display = 'none';
                    passwordSuccess.style.display = 'block';
                    return true;
                }

                // Add the following code after the if-else statement:
                if (password === '' && passwordConfirm === '') {
                    document.getElementById('password').classList.remove('is-invalid');
                    document.getElementById('password-confirm').classList.remove('is-invalid');
                    document.getElementById('password').classList.remove('is-valid');
                    document.getElementById('password-confirm').classList.remove('is-valid');
                    passwordError.style.display = 'none';
                    passwordSuccess.style.display = 'none';
                }
            }

            const currentYear = new Date().getFullYear();
            const selectYear = document.getElementById("birthday-year");
            for (let year = currentYear; year >= 1940; year--) {
                const option = document.createElement("option");
                option.value = year;
                option.textContent = year + "년";
                selectYear.appendChild(option);
            }
            const selectMonth = document.getElementById("birthday-month");
            for (let month = 1; month <= 12; month++) {
                const option = document.createElement("option");
                option.value = month < 10 ? "0" + month : month;
                option.textContent = month + "월";
                selectMonth.appendChild(option);
            }
            const selectDay = document.getElementById("birthday-day");
            for (let day = 1; day <= 31; day++) {
                const option = document.createElement("option");
                option.value = day < 10 ? "0" + day : day;
                option.textContent = day + "일";
                selectDay.appendChild(option);
            }
            function findAddr() {
                new daum.Postcode({
                    oncomplete: function (data) {

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