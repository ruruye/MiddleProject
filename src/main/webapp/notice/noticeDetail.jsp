<%@page import="kr.or.ddit.member.vo.AuthorityVO"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글 상세보기</title>
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
    
    <%
	AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
	String check = (aVo != null) ? aVo.getAuthority() : null;
    %>
    
    <script>
    $(function() {
        $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
        $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");

        $("#back").on("click", function() {
            <% if ("admin".equals(check)) { %>
            window.location.href = "<%=request.getContextPath()%>/notice/listNoticeAdmin.do";
            <% } else { %>
            window.location.href = "<%=request.getContextPath()%>/notice/listNoticeSearch.do";
            <% } %>
        });
    });

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
            height: 300px; 
            width: 100%; 
            font-family: 'Diphylleia', serif;
        }
        
        .bulletin-entry h2 {
            font-size: 24px;
            margin-top: 0;
        }
        
        .author {
            font-style: italic;
            color: #666;
            margin-left: 65%;
        }
        
        .content {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 10px;
            max-width: 100%;
            margin-left: 5%;
        }

        h2 {
            margin-top: 5%;
            text-align: center;
        }
        
        #back {
            margin-left: 67%;
        
        }
        
        #detail {
            margin-bottom : 10%;
            margin-top : 10%;
        }

    </style>
</head>

<% NoticeVO getNoticeDetail = (NoticeVO) request.getAttribute("notice"); %>

<body>

<div id="header"></div>


<div id="detail">
    <h2><%=getNoticeDetail.getNotice_tit() %></h2>
    <p class="author"><%=getNoticeDetail.getAdmin_id() %></p>
    <div class="content-column">
        <pre class="content"><%=getNoticeDetail.getNotice_cn() %></pre>
    </div>
    <br>
    <button id="back" type="button" class="btn btn-secondary"><<</button>
</div>

<div id="footer"></div>

</body>
</html>