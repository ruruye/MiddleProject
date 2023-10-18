<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <meta name="theme-color" content="#712cf9">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/header.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/footer.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
    
    <script>
    $(function(){
    	
    	  $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
          $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
    	
    	  $("#insertBtn").on("click", function(){
    	    var form = document.getElementById("noticeForm");
    	    
    	    var titleInput = $("#title");
    	    var contentInput = $("#cont");
    	    
    	    if (titleInput.val().trim() === '') {
    	      alert("제목을 입력해주세요.");
    	      return;
    	    }
    	    
    	    if (contentInput.val().trim() === '') {
    	      alert("내용을 입력해주세요.");
    	      return;
    	    }
    	    form.method = "POST";
    	    form.action = "<%=request.getContextPath()%>/notice/insertNotice.do";
    	    form.submit();
    	    
 
    	  });
    	  
    	  $("#deleteBtn").on("click", function(){
    		  location.href = "<%=request.getContextPath()%>/notice/listNoticeAdmin.do";
    	  });
    	  
    });
    </script>

<style>
    .write, input[type=text] {
        width: 700px;
        margin: 0 auto;
        border-top: 3px solid gray;
        border-bottom: 3px solid gray;
    }
    #cont {
        width: 700px; 
        padding: 10px; 
        margin: 12px auto 0;
    }
    .write .text {
        table-layout: fixed;
        height: 300px; 
        white-space: pre-line; 
        word-break: break-all;
    }
    .write .button {
        display: flex;
        justify-content: center;
        margin: 15px auto;
    }
    .button input {
        border: 1px solid black; 
        background: gainsboro;
        margin: 10px; 
        padding: 5px;
        text-decoration: none; 
        color: black;
        width: 100px;
    }
    h1 {
        text-align: center;
        margin-bottom: -2%;
    }
    header{
        margin-bottom: 5%;
    }
    main #noticeForm{
        margin-bottom: 10%;
    }
    </style>
</head>
<body>

<div id="header"></div>

    <h1>공지 사항</h1>
    <header>
        <div class="homebox">
            <div>
                <a href=# class="logo"></a>
            </div>
        </div>
    </header> 

    <main>
        <form class="write" id="noticeForm">
            <input type="text" id="title" name="title" placeholder="제목을 입력해주세요." required><br>
            <hr>
            <textarea id="cont" name="content" placeholder="내용을 입력해주세요." class="text" required></textarea>
            <div class="button">
                <input id="insertBtn" type="button" value="글쓰기">
                <input id="deleteBtn" type="button" value="취소">
            </div>
        </form>
    </main>
<div id="footer"></div>
</body>
</html>