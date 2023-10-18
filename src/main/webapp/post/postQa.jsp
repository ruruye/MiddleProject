<%@page import="kr.or.ddit.post.vo.Page2VO"%>
<%@page import="kr.or.ddit.member.vo.AuthorityVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.post.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>질문게시판</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    
    <meta name="theme-color" content="#712cf9">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/header.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/import/footer.html">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
    
<%
	AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
	String check = (aVo != null) ? aVo.getAuthority() : null;
%>


   <script>
    const mypath = "<%=request.getContextPath()%>";
   	 $(function(){
         $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
         $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
   	     $('.page-link').on('click', function(){
   	    	 //alert($(this).attr("idx"));
   	   		 $('#page').val($(this).attr("idx"));
   	   		 $("#postSearchForm").get(0).submit();
         });

	     $(".write-post").on("click", function(){
	    	 
	    	 <% if ("member".equals(check) || "admin".equals(check)) { %>
	    	     location.href ="<%=request.getContextPath()%>/post/insertPost.do";
              <% } else { %>
                 alert("로그인 후 이용 바랍니다.");
              <% } %>
	    });
	     
	     $(document).on('click', '#next', function(){
	    	
	    	 // 다른 곳에 modiform이 열려 있는 지 확인
	    	 if($('#modiform').css('display') != "none") {
	    		 // 열려있다
	    		 replyReset();
	    	 }
	    	 
	    	 currentPage = parseInt($('.pageno').last().text()) +1;
	    	 listPageServer(currentPage);
	     })
	     
	     $(document).on('click', '#prev', function(){
	    	 if($('#modiform').css('display') != "none"){
	    		 replayReset();
	    	 }
	    	 
	    	 currentPage = parseInt($('.pageno').first().text()) -1;
	    	 listPageServer(currentPage);
	     })
	     
	     $(document).on('click', '.pageno', function(){
	    	 
	    	 if($('#modiform').css('display') != "none"){
	    		 
	    		 replayReset();
	    	 }
	    	 
	    	 currentPage = parseInt($(this).text().trim());
	    	 listPageServer(currentPage);
	     }) 
	     
      });
	
	</script>
	    

<style>
    table {
      border-collapse: collapse;
      border-spacing: 0;
    }

    section.notice {
      padding: 80px 0;
      margin-bottom: 150px;
      margin-top: 80px;
      
    }

    .page-title {
      margin-bottom: 60px;
    }

    .page-title h3 {
      font-size: 28px;
      color: #333333;
      font-weight: bold;
      text-align: center;
    }

    #board-search .search-window {
      padding: 15px 0;
      background-color: #f9f7f9;
    }

    #board-search .search-window .search-wrap {
      position: relative;
      /*   padding-right: 124px; */
      margin: 0 auto;
      width: 80%;
      max-width: 564px;
    }

    #board-search .search-window .search-wrap input {
      height: 40px;
      width: 100%;
      font-size: 14px;
      padding: 7px 14px;
      border: 1px solid #ccc;
    }

    #board-search .search-window .search-wrap input:focus {
      border-color: #333;
      outline: 0;
      border-width: 1px;
    }

    #board-search .search-window .search-wrap .btn {
      position: absolute;
      right: 0;
      top: 0;
      bottom: 0;
      width: 108px;
      padding: 0;
      font-size: 16px;
    }

    .board-table {
      font-size: 13px;
      width: 100%;
      border-top: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
    }

    .board-table a {
      color: #333;
      display: inline-block;
      line-height: 1.4;
      word-break: break-all;
      vertical-align: middle;
      text-decoration: none; /* Updated */
    }

    .board-table a:hover {
      text-decoration: underline; /* Updated */
    }

    .board-table a.underline {
    text-decoration: underline;
    }

    .board-table th {
      text-align: center;
    }

    .board-table .th-num {
      width: 100px;
      text-align: center;
    }

    .board-table .th-date {
      width: 200px;
    }

    .board-table th,
    .board-table td {
      padding: 14px 0;
    }

    .board-table tbody td {
      border-top: 1px solid #e7e7e7;
      text-align: center;
    }

    .board-table tbody th {
      padding-left: 28px;
      padding-right: 14px;
      border-top: 1px solid #e7e7e7;
      text-align: left;
    }

    .board-table tbody th p {
      display: none;
    }

    .btn {
      display: inline-block;
      padding: 0 30px;
      font-size: 15px;
      font-weight: 500;
      background: transparent;
      text-align: center;
      white-space: nowrap;
      vertical-align: middle;
      -ms-touch-action: manipulation;
      touch-action: manipulation;
      cursor: pointer;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      border: 1px solid transparent;
      text-transform: uppercase;
      -webkit-border-radius: 0;
      -moz-border-radius: 0;
      border-radius: 0;
      -webkit-transition: all 0.3s;
      -moz-transition: all 0.3s;
      -ms-transition: all 0.3s;
      -o-transition: all 0.3s;
      transition: all 0.3s;
      border-radius: 8px;
    }

    .btn-dark {
      background: #555;
      color: #fff;
    }

    .btn-dark:hover,
    .btn-dark:focus {
      background: #373737;
      border-color: #373737;
      color: #fff;
    }

    .btn-dark {
      background: #555;
      color: #fff;
    }

    .btn-dark:hover,
    .btn-dark:focus {
      background: #373737;
      border-color: #373737;
      color: #fff;
    }

    * {
      list-style: none;
      text-decoration: none;
      padding: 0;
      margin: 0;
      box-sizing: border-box;
    }

    .clearfix:after {
      content: '';
      display: block;
      clear: both;
    }

    .container {
      width: 1100px;
      margin: 0 auto;
    }

    .blind {
      position: absolute;
      overflow: hidden;
      clip: rect(0 0 0 0);
      margin: -1px;
      width: 1px;
      height: 1px;
    }

    #write-post {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-right: 10px;
   }

  #write-post .write-post {
    padding: 0 15px;
    font-size: 15px;
  }

    .board-container {
      position: relative;
      margin-bottom: 60px;
   }

    .pagination {
      list-style: none;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 5%;
    }

    .page-item {
      margin-right: 0.5rem;
    }

    .page-link {
      text-decoration: none;
      padding: 0.5rem 1rem;
      border: 1px solid #ccc;
      color: #333;
      border-radius: 5px;
    }

    .page-item.active .page-link {
      background-color: #ccc;
      background-color: blue;
    }
    
  </style>
</head>

<% 
	int currentPage = 1;
	if(request.getAttribute("currentPage")!=null){
		currentPage = (int)request.getAttribute("currentPage");
	}

	List<PostVO> getAllPost = (List<PostVO>) request.getAttribute("listPost"); 
	int res = (Integer)request.getAttribute("res");
	Page2VO pvo = (Page2VO)request.getAttribute("pvo");
	
	String searchWord = "";
	if(request.getAttribute("searchWord")!=null){
		searchWord = (String)request.getAttribute("searchWord");
	}
%>

<body>

<div id="header"></div>

    <section class="notice">
        <div class="page-title">
              <div class="container">
                  <h3>질문게시판</h3>
              </div>
          </div>
          <div>
            
          </div>
          <!-- board seach area -->
          <div id="board-search">
            <div class="container">
              <div class="search-window">
                <form id="postSearchForm" action="<%=request.getContextPath() %>/post/listPostSearch.do">
                  <div class="search-wrap">
                    <input type="hidden" name="page" id="page" value="1">
                    <input id="searchWord" type="search" name="searchWord" placeholder="검색어를 입력해주세요." value="">
                    <button type="submit" id="searchbtn" class="btn btn-dark">검색</button>
                  </div>
                </form>
                <div id="write-post">
                  <p class="write-post btn btn-dark">글작성</p>
                </div>
              </div>
              </div>
          </div>
         
        <!-- board list area -->
          <div id="board-list">
              <div class="container">
                  <table class="board-table">
                      <thead>
                      <tr>
                          <th scope="col" class="th-num">번호</th>
                          <th scope="col" class="th-title">제목</th>
                          <th scope="col" class="th-date">등록일</th>
                          <th scope="col" class="th-date">작성자</th>
                      </tr>
                      </thead>
                      <tbody>
                      <%
                      for(PostVO postVo : getAllPost){
                      %>
                      <tr>
                          <td><%=postVo.getPost_id() %></td>
                          <th>
                              <a href="<%=request.getContextPath()%>/post/postDetail.do?postid=<%=postVo.getPost_id()%>"><%=postVo.getPost_tit() %></a>
                          </th>
                          <td><%=postVo.getPost_date() %></td>
                          <td><%=postVo.getMem_id() %></td>
   
                      </tr>
                      <%
                      }
                      %>
                      </tbody>
                  </table>
              </div>
          </div>
        <div>
         <div id="container mt-3">
            <ul class="pagination">
           <%if(pvo.getStartPage()>1){ %>   
              <li class="page-item"><a class="page-link" href="#" idx="<%=pvo.getStartPage()-1 %>">&lt;</a></li>
           <%} %>
         
           <%for(int i=pvo.getStartPage() ; i<=pvo.getEndPage(); i++){ %>     
           <%if(i==currentPage){ %>
              <li class="page-item active"><a class="page-link pageno" idx="<%=i %>" href="#"><%=i %></a></li>
           <%}else{ %>
              <li class="page-item"><a class="page-link pageno" idx="<%=i %>" href="#"><%=i %></a></li>
           <%} %>
              
           <%} %>
           <%if(pvo.getEndPage()<pvo.getTotalPage()){ %>
              <li class="page-item"><a class="page-link" idx="<%=pvo.getEndPage() +1 %>" href="#">&gt;</a></li>
           <%} %>   
         
            </ul>
          </div>

        </div>
      </section>
      

<div id="footer"></div>

</body>
</html>
    