<%@page import="kr.or.ddit.member.vo.AuthorityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="../js/jquery-3.7.0.min.js"></script> -->
<link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/sidebar.css">
  <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
  <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>

<style>
	*{
	    padding: 0;
	    margin: 0;
	    border: none;
	}
	body{
	    font-size: 14px;
	    font-family: 'Roboto', sans-serif;
	}
	
	.Withdraw-wrapper{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	#Withdraw-form > input{
	    width: 100%;
	    height: 48px;
	    padding: 0 10px;
	    box-sizing: border-box;
	    margin-bottom: 16px;
	    border-radius: 6px;
	    background-color: #F8F8F8;
	}
	#Withdraw-form > input::placeholder{
	    color: #D2D2D2;
	    background-color: #F8F8F8;
	}
	#Withdraw-form > input[type="submit"]{
	    color: #fff;
	    font-size: 16px;
	    background-color: #eb2a10;
	    margin-top: 20px;
	    margin-bottom: 0px;
	}
	.bot {
	    font-size: 12px;
	}
	#botlink{
	    text-align : center;
	}
	#Withdrawtop{
	    text-align : center;
	    margin-top : 0px;
	}
	
	div#entire{
		border : 2px solid #c8c8c8;
		border-radius: 10px;
 		width : 25%;
 		margin : auto;
 		margin-top : 10px;
 		padding : 20px 70px;
 		background-color: #ebebeb;
    	box-shadow: 0 0 5px rgb(255 0 0 / 40%);
	}
	#Withdraw-wrapper{
		margin-bottom : 0px;
	}
	#Withdraw-form{ 
    	padding: 30px 10px;
	}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
    $(document).ready(function () {
      $('#header').load("../import/header.jsp");
      $('#footer').load("../import/footer.jsp");
      
      <% 
      AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
	  String check = (aVo != null) ? aVo.getAuthority() : null;
	  if(check != null) {
      %>
      document.getElementById('userId').value = '<%= aVo.getId() %>';
      <% } %>
      
      
      var deleteMemVo = <%=request.getAttribute("deleteMemVo")%>;
      if (deleteMemVo > 0) {
        alert("회원탈퇴가 완료되었습니다.");
        location.href = "<%=request.getContextPath()%>/member/sessionLogout.do"
      }
    });
    
    
  </script>

</head>
<body>

<div id="header"></div>

    <div id="Withdrawtop">
        <br><br><br><br><h2>회원탈퇴</h2><br><br><br>
    </div>  
    
    <div id=entire>
    <div class="Withdraw-wrapper">
        <form method="post" action="<%=request.getContextPath() %>/member/LibraryWithdraw.do" id="Withdraw-form">
            <input type="text" id="userId" name="userName" placeholder="UserName" readonly>
            <input type="password" id="userPassword" name="userPassword" placeholder="*****">
        
            <input type="submit" value="탈퇴">
           
        </form>
    </div>
    </div>
    
    <div id="footer"></div>
</body>
</html>