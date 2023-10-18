<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.post.vo.PostVO"%>
<%@page import="kr.or.ddit.admin.vo.AdminVO"%>
<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% AdminVO getAdmin = (AdminVO)session.getAttribute("admin");%>
<% PostVO getPostDetail = (PostVO)request.getAttribute("postDetail");%>
<% CommentVO getCommentDetail = (CommentVO)request.getAttribute("commentDetail");%>    
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <meta name="theme-color" content="#712cf9">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/header.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/footer.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Diphylleia&display=swap" rel="stylesheet">
    
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    <title>질문 게시판 답변 등록</title>
    <style>
        .content-column {
            width: 100%;
            max-width: 800px;
            margin-left: 25%;
        }
        
        pre.content {
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 100px;
            height: 300px; /* Adjust the height as needed */
            width: 150%; /* Set the width to 100% */
            font-family: 'Diphylleia', serif;
        }
        
        .bulletin-entry h2 {
            font-size: 24px;
            margin-top: 0;
        }
        
        .author {
            font-style: italic;
            color: #666;
            margin-left: 70%;
        }
        
        .content {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 10px;
            max-width: 120%;
        }

        h2 {
            margin-top: 5%;
            text-align: center;
        }

        .container {
            margin-top: 20px;
            margin-left: 25%;
            max-width: 47%; /* Adjust the max-width as needed */
            display: flex;
            flex-direction: column;
        }

        .comment {
            margin-bottom: 10px;
            padding: 10px;
            border-bottom: 1px solid #ccc;
            background-color: #f9f9f9;
            width: 100%; /* Set the width to 100% */
        }

        .comment .comment-info {
            color: #666;
            margin-bottom: 5px;
            font-size: 20px;
        }

        .comment .comment-content {
            margin-bottom: 5px;
        }

        .comment .comment-date {
            font-size: 12px;
            color: #999;
        }

        .comment-section {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        .comment-button {
            display: flex;
            justify-content: flex-end;
            align-self: flex-start;
            margin-left: 10px;
        }

        .comment-button input {
            margin-left: 10px;
            padding: 10px 20px; /* Increase padding to adjust button size */
            font-size: 16px; /* Increase font size for button text */
            background-color: black;
            color: white;
            border-radius: 10px;
        }

        .comment-form {
            display: none;
            margin-top: 10px;
        }

        .cont {
            width: 100%;
            height: 100px;
            padding: 5px;
            font-size: 16px;
        }
        
        #detail{
            margin-top: 130px; 
            margin-bottom: 120px;
        }
        
        #back {
	      	margin-left: 68%;
		    margin-top: -10%;
		    margin-left: 75%;
	    }
    </style>
    <script>
	    $(document).ready(function () {
	        $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
	        $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
	     });
         
        function toggleCommentForm() {
            var commentForm = document.getElementById("comment-form");
            commentForm.style.display = commentForm.style.display === "none" ? "block" : "none";
        }
        
        $(function(){
        	$("#insert").on("click", function(){
        		var commContent = $(".cont");
        		
        		if (commContent.val().trim() == '') {
        			alert("답변 내용을 입력해주세요.");
        			return;
        		}

        		let data = {
                        post_id: location.href.split("?")[1].split("=")[1], // 임시 대응
                        comm_cn: commContent.val().trim(),
                        admin_id: 'a123'                                    // 임시 대응
                };
        		
        		console.log("체킁1: ", data);
        		
                $.ajax({
                    method:"post",
                    url: "<%=request.getContextPath()%>/comment/commentAdd2.do",
                    data: data,
                    success:function(resp){
                        console.log("체킁2: ",resp);
                    	if(resp == "success"){
                    		alert("답변 등록이 완료되었습니다.");
                    		location.href = location.href;
                    	}
                    }
                })
        		
        	})
        	
        	$("#back").on("click", function(){
    		location.href = "<%=request.getContextPath()%>/manager/listPostAdmin.do";
    	    })
        })
        
        
    </script>
</head>


<body>

<div id="header"></div>

<div id="detail">
    <h2><%=getPostDetail.getPost_tit() %></h2>
    <p class="author"><%=getPostDetail.getMem_id() %></p>
    <div class="content-column">
        <pre class="content"><%=getPostDetail.getPost_cn() %></pre>
    </div>
<% if(getCommentDetail != null){ %>    
    <div class="container">
        <h5>댓글</h5>
        <div class="comment-section">
            <div class="comment">
                <div class="comment-info"><%=getCommentDetail.getAdmin_id() %></div>
                <div class="comment-content"><%=getCommentDetail.getComm_cn() %></div>
                <div class="comment-date"><%=getCommentDetail.getComm_date() %></div>
            </div>
            <div class="comment-button">
                <input type="button" name="insertcomment" value="답변 등록" onclick="toggleCommentForm()">
            </div>
        </div>
        <div id="comment-form" class="comment-form">
            <textarea class="cont" placeholder="답변을 입력하세요"></textarea>
            <input id="insert" type="button" value="등록">
        </div>
    </div>
<%} else { %>
    <div class="container">
        <h3>댓글</h3>
        <div class="comment-section">
            <div class="comment">
                <div class="comment-info"></div>
                <div class="comment-content"></div>
                <div class="comment-date"></div>
            </div>
            <div class="comment-button">
                <input type="button" name="insertcomment" value="답변 등록" onclick="toggleCommentForm()">
            </div>
        </div>
        <div id="comment-form" class="comment-form">
            <textarea class="cont" placeholder="답변을 입력하세요"></textarea>
            <input id="insert" type="button" value="등록">
        </div>
    </div>
<% } %>
       
</div>

<button id="back" type="button" class="btn btn-secondary"><<</button>

<div id="footer"></div>
</body>
</html>
