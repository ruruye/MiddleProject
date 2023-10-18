<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>welcome</title>
    <link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/import/header.html">
    <link rel="stylesheet" href="/import/footer.html">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
  	
  	<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Diphylleia&display=swap" rel="stylesheet">

  <style>
    body {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }
    
    .welcome {
      margin-top: 20px;
      height: 400; 
      width: 50%; 
      border: 3px solid #ccc;
      padding: 50px 80px;
      font-family: 'Diphylleia', serif;
      
    }
    
    
   
  </style>

 
  <script>
    $(document).ready(function () {
      $('#header').load("../import/header.jsp");
      $('#footer').load("../import/footer.jsp");
    });
  </script> 
</head>

<body>
	<div id="header"></div>
	
	<br><br><br><br><br><br><br><br>
    <h1 style="text-align: center; font-family: 'Diphylleia', serif;">인사말</h1>
    <div id="welcome" class="welcome">
        <br>
        <h3 style="text-align: center; font-weight: bold;">정보의 중심, 대덕인재도서관에 오신 것을 환영합니다.</h3><br>
        
        <h5>· 2023년 대전광역시 중심에 개관한 대덕인재도서관은 올바른 정책으로 고객이 행복할 수 있도록 정부 및 공공기관의 정책 수립·수행·평가 등 정부의 정책과정을 지원하는 역할을 수행하고 있습니다.<br><br><br>
            · 대덕인재도서관은 정부 각 부처의 공직자들과 연구자 그리고 고객들에게 정책의 든든한 동반자로서 대한민국의 미래를 이끌어 나가는 데 노력하고 있습니다.<br><br><br>
            · 더불어 열린 도서관을 운영하여 이용고객의 폭넓은 교양을 쌓을 수 있도록 장서를 확충하고, 다양한 독서문화프로그램 개발·운영 등에 최선을 다하며 인문·문화예술 활동을 돕는 복합문화공간의 역할도 수행하고 있습니다.<br><br>
            대덕인재도서관은 여러분의 성장과 발전을 응원합니다.
        </h5><br>
        <h4 style="text-align: center; font-weight: bold;">대덕인재도서관장</h4>
    </div>
	
  	<br><br><br><br><br><br><br>

  
   <div id="footer"></div>
</body>
</html>
