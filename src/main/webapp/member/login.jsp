<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta name="theme-color" content="#712cf9">
<link rel="stylesheet" href="<%=request.getContextPath()%>/import/header.html">
<link rel="stylesheet" href="<%=request.getContextPath()%>/import/footer.html">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
    
    
<!-- 부트스트랩 CDN 링크 추가 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
    * {
        padding: 0;
        margin: 0;
        border: none;
    }

    body {
        font-size: 14px;
        font-family: 'Roboto', sans-serif;
        background-color: #f5f9fa;
    }

    .login-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
       	
    }

    #login-form > input[type="text"], #login-form > input[type="password"] {
        width: 100%;
        height: 48px;
        padding: 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #F8F8F8;  
    }

    #idBtn {
        width: 100%;
        height: 48px;
        padding: 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
    }


    .bot {
        font-size: 12px;
    }

    #botlink {
        text-align: center;
        margin-bottom : 55px;
       
    }

    #logtop {
        text-align: center;
        margin-top: 38px;
    }
	div.btn-group-toggle{
		margin-left: 260px;
		margin-top : 50px;
		
	}
	.btn-secondary {
		background-color: white;
		border : none;
		color : black;
	}
	.btn.active {
		background-color: white;
		border : none;
		color : black;
	}
	div#entire{
		border : 2px solid #c8c8c8;
		border-radius: 10px;
 		width : 30%;
 		margin : auto;
 		margin-top : 10px;
 		margin-bottom : 40px;
 		padding : 20px 70px;    
 		background-color: #ffffff;
    	box-shadow: 0 0 5px rgb(0 43 255 / 60%);
	}
	
</style>

<script>
$(document).ready(function () {
    $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
    $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
    <% if (request.getAttribute("loginFail") != null) {%>
    	alert("로그인을 실패했습니다!\n아이디나 비밀번호를 확인하고 다시 입력해주요");
    <% } %>
});	
</script>

</head>
<body>

<div id="header"></div>

    <div id="logtop">
        <br><br><br><br><br><br><h1>로그인</h1><br>
    </div>
    
    <div id=entire>
    <div class="btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-secondary active" id="memberToggle">
                <input type="radio" name="toggle" checked> 회원
            </label>
            <label class="btn btn-secondary" id="adminToggle">
                <input type="radio" name="toggle"> 관리자
            </label>
    </div>
      
    <div class="login-wrapper">
        <form method="post" action="<%=request.getContextPath()%>/member/sessionLogin.do" id="login-form">
            <input type="text" name="userId" placeholder="UserName">
            <input type="password" name="userPassword" placeholder="*****">
        
            <input type="submit" value="로그인" class="btn btn-primary" id="idBtn"> <!-- 부트스트랩 버튼 클래스 추가 -->

            <div id="botlink">
                <a class="bot btn btn-link" href="#">아이디 찾기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="bot btn btn-link" href="#">비밀번호 찾기</a>
            </div>
        </form>
    </div>
    
    </div>

    <!-- 부트스트랩 CDN 스크립트 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>

    <br><br><br><br><br>



<div id="footer"></div>

</body>
</html>
