<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>introduction</title>
    <link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/sidebar.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>

  <style>
   
    #mainPage{
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 90vh;
      margin: 0;
      margin-top: 20px;
      margin-bottom: 100px;
    }
    
    #mainPage>h1 {
    	text-align: center;
	    margin-top: 80px;
	    font-weight: 900;
    }
    
    .intro {
      margin-top: 20px;
      width:50%; 
      border: 3px solid #ccc;
      padding: 30px;
    }
    th{
      background-color: #ebebeb;
      border: 1px gray solid;
    }
    td{
      border: 1px gray solid;
      padding: 10px;
    }
    .font-middle {
		color: #688eff;
	    font-size: 20px;
	    font-weight: bold;
    }
    
  </style>

  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
    $(document).ready(function () {
      $('#header').load("../import/header.jsp");
      $('#footer').load("../import/footer.jsp");
    });
  </script>
</head>

<body>
<div id="header"></div>

 <div id="mainPage">
  <h1>도서관 이용 · 소개</h1>
  <div id="intro" class="intro">
    <div class="font-middle">· 위치/규모</div>
    <div>1층 쉼터(자판기) / 37석</div>
    <div>4층 쉼마루 / 약 70석</div>
    <br>
    <div class="font-middle">· 미개방일 : 도서관의 휴관일(매월 둘째, 넷째, 월요일 및 공휴일)</div>
	<br>
    <table border="1" style="text-align: center;" >
        <tbody>
            <tr>
                <th>구분</th>
                <th>장소</th>
                <th>평일</th>
                <th width="23%">주말</th>
            </tr>
            <tr>
                <th rowspan="2">이용시간</th>
                <td>쉼터(1층)</td>
                <td>09:00~21:00</td>
                <td rowspan="2">09:00~18:00</td>
            </tr>
            <tr>
                <td>쉼마루(4층)</td>
                <td>09:00~18:00</td>
            </tr>
        </tbody>
    </table>
    <br><br>
    
    <div class="font-middle">· 이용자 준수사항</div>
    <div>
    - 많은 이용자들의 원활한 공간 이용을 위해 장시간의 이용은 자제하여 주시기 바랍니다.<br>
    - 고성방가 등 다른 사람에게 방해가 되는 행위를 삼가 주시기 바랍니다.<br>
    - 1층 쉼터에서 커피, 음료와 간단한 과자류의 음식물 취식이 가능합니다.<br>
    - 4층 쉼마루에서 소지하신 음식물(도시락,패스트푸드 등) 취식이 가능합니다.<br>
    - 간단한 음식물(도시락 등) 섭취 후에는 다음 이용자를 위하여 정리를 부탁드리며, 남은 음식물은 다시 가져가 주시기 바랍니다.<br>
    - 모든 아동은 반드시 보호자를 동반하여야 하며, 부주의로 인한 사고에 대해서는 책임지지 않습니다.<br><br>
    도서관 시설물을 깨끗이 이용하여 쾌적한 환경을 유지할 수 있도록 협조하여 주시기 바랍니다.
    </div>
    <div class="font-middle">· 문의: 044-900-9018</div>
    </div>
  </div>

<div id="footer"></div>
</body>
</html>
