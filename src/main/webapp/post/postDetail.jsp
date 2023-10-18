<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@page import="kr.or.ddit.admin.vo.AdminVO"%>
<%@page import="kr.or.ddit.post.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% CommentVO getCommentDetail = (CommentVO)request.getAttribute("commentDetail");%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 상세보기</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <meta name="theme-color" content="#712cf9">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/header.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/footer.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Diphylleia&display=swap" rel="stylesheet">
    
    <script>
    $(document).ready(function () {
        $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
        $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
     });
    
    $(function(){
    	$("#back").on("click", function(){
    		location.href = "<%=request.getContextPath()%>/post/listPostSearch.do";
    	})
    })
    </script>
    
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
            width: 100%; /* Set the width to 100% */
            font-family: 'Diphylleia', serif;
        }
        
        .bulletin-entry h2 {
            font-size: 24px;
            margin-top: 0;
        }
        
        .author {
            font-style: italic;
            color: #666;
            margin-left: 63%;
        }
        
        .content {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 10px;
            max-width: 100%;
        }

        h2 {
            margin-top: 5%;
            text-align: center;
        }

        .container {
            margin-top: 20px;
            margin-left: 25%;
            max-width: 47%; /* Adjust the max-width as needed */
        }

        .comment {
            margin-bottom: 10px;
            padding: 10px;
            border-bottom: 1px solid #ccc;
            background-color: #f9f9f9;
            width: 90%;
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

        .container {
            flex-direction: column;
        }
        
        #area {
            margin-left: 5%;
        
        }
        
        #back {
            margin-left: 67%;
        
        }


    </style>
</head>

<% PostVO getPostDetail = (PostVO)request.getAttribute("post"); %>
<% AdminVO getAdmin = (AdminVO)request.getAttribute("admin"); %>

<body>

<div id="header"></div>
<br><br>

<div id="detail">
    <h2><%=getPostDetail.getPost_tit() %></h2>
    <div id=area>
    <p class="author"><%=getPostDetail.getMem_id() %></p>
    <div class="content-column">
        <pre class="content"> <%=getPostDetail.getPost_cn() %></pre>
    </div>
    <% if(getCommentDetail != null){ %>    
    <div class="container">
        <h3>댓글</h3>
        <div class="comment-section">
            <div class="comment">
                <div class="comment-info"><%=getCommentDetail.getAdmin_id() %></div>
                <div class="comment-content"><%=getCommentDetail.getComm_cn() %></div>
                <div class="comment-date"><%=getCommentDetail.getComm_date() %></div>
            </div>
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
        </div>
    </div>
<% } %>
<br><br>
<button id="back" type="button" class="btn btn-secondary"><<</button>
</div>
</div>
<br><br><br><br><br>
<div id="footer"></div>
</body>
</html>
    