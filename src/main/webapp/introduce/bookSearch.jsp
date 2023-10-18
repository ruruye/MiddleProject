<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.book.vo.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="us">
<head>
	<title>Book Search Results</title>
	<meta charset="utf-8">
	<link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>


	<script>
	$(function(){
	  $(".write").on("click", function(){
	    window.location.href = "<%=request.getContextPath()%>/book/bookDetail.do";
	  });
	});
   </script>
	
	<style>
	  th {
	    width: 10%;
	    text-align: center;
	  }
	  
	  img {
	    max-width: 100%;
	    height: auto;
	  }
	
	  h2 {
	    text-align: center;
	    font-weight: bold;
	  }
	  
	  #booklist {
	    text-align: center;
	  }
	  
	  td, th {
	    padding: 10px;
	    vertical-align: middle;
	  }
 	  .container p{ 
 	  	text-align: center;
 	  	font-size: 20px;
 	  	font-weight: bold; 
	  } 
	  td{
	  	text-align: center;
	  }
	  div#footercon{
	  	
	  }
	</style>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script>
    $(document).ready(function () {
      $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
      $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
    });
  	</script>

</head>
<body>

<%-- <% --%>
<!-- // BookVO vo = (BookVO)request.getAttribute("requestDetail"); -->
<%-- %> --%>


<div id="header"></div>

<div class="container mt-3">
<br><br><br><br><br><br>
  <h2>도서 검색 결과</h2><br>
  
  <% List<BookVO> list = (List<BookVO>)request.getAttribute("listBook"); %>
  
  <% if (list != null && !list.isEmpty()) { %>
    <!-- Display search results -->
    <div id="boollist">
      <table class="table table-hover">
        <thead>
          <tr>
            <th>책 이미지</th>
            <th>책 제목</th>
            <th>저자</th>
            <th>출판사</th>
            <th>출판일</th>
            <th>장르</th>
            <th>ISBN 번호</th>
            <th>책 가격</th>
            <th>청구기호</th>
          </tr>
        </thead>
        <tbody>
          <% for (BookVO vo : list) { %>
            <tr>
              <td><img src="<%=request.getContextPath()%>/images/<%=vo.getBook_img() %>" alt="샘플이미지"></td>
              <td><%=vo.getBook_tit() %></td>
              <td><%=vo.getBook_author() %></td>
              <td><%=vo.getBook_publi() %></td>
              <td><%=vo.getBook_publidate() %></td>
              <td><%=vo.getBook_genre() %></td>
              <td><%=vo.getBook_isbn() %></td>
              <td><%=vo.getBook_price() %></td>
              <td><%=vo.getBook_callsign() %></td>
            </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  <% } else { %>
    <!-- Display message when there are no search results -->
    
    <br><br>
    <p>-----  관련된 도서가 없습니다  -----</p>
  <% } %>
  </div>


<%-- 	<% --%>
<!-- //     	} -->
<%-- 	%> --%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="footer"></div>	

</body>
</html>
