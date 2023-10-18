<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.ddit.book.vo.BookVO" %>
<!DOCTYPE html>
<html>
<head>
  <title>Book Details</title>
  <link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/sidebar.css">
  <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
  <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>
  
  
 
  <script>
  	
  
  
    $(function() {
      $(document).on('click', '.btn.btn-primary', function() {
    	  
        $.ajax({
          url: '<%=request.getContextPath() %>/bookLoan.ajax',
          type: 'get',
          success: function(res) {
        	  if(res.loanYn=="y"){
        		  alert("대출 완료")
        	  }else{
        		  alert("대출 실패")
        	  }

          },
          error: function(xhr) {
            alert(xhr.status);
          },
          dataType: 'json',
          data: {"book_id": $("#book_id").val()}
        });
      });
    });
  </script>

  <style>
    body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 3px solid #ccc; 
            padding: 20px; 
        }

        .book-title {
            text-align: center;
        }

        .book-details {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .book-image {
            flex: 1;
            max-width: 400px;
        }

        .book-info {
            flex: 1;
        }

        .borrow-button {
            width: 100%;
            text-align: center;
            margin-top: 20px;
        }

        .borrow-button button {
            padding: 10px 20px;
            font-size: 18px; 
        }
        img{
        height: 400px;
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
<!--   <div id="header"></div> -->

<!--   <section> -->
<!--     <div id="iframePlaceholder"> -->
<!--       <iframe id="iframeArea" src="../introduce/bookDtail.html"></iframe> -->
<!--     </div> -->
<!--   </section> -->

<!--   <div id="footer"></div> -->

<%
BookVO vo = (BookVO)request.getAttribute("requestDetail");
%>


<div id="header"></div>
  <section>
    <div class="container">
      <div class="book-title">
        <h1><%=vo.getBook_tit() %></h1>
      </div>
      <div class="book-details">
        <div class="book-image">
          <img src="<%=request.getContextPath() %>/images/<%=vo.getBook_img() %>" alt="Book Cover">
        </div>
        <div class="book-info">

          <p>저자: <%=vo.getBook_author() %></p>
          <p>출판사: <%=vo.getBook_publi() %></p>
          <p>출판일: <%=vo.getBook_publidate() %></p>
          <p>장르:  <%=vo.getBook_genre() %></p>
          <p>ISBN: <%=vo.getBook_isbn() %> </p> 
          <p>가격: <%=vo.getBook_price() %>원</p>
          <p>청구기호: <%=vo.getBook_callsign() %></p>

        </div>
        <div class="borrow-button">
          <button class="btn btn-primary">대출</button>
        </div>
      </div>
    </div>
    <input type="hidden" name="book_id" id="book_id" value="<%=vo.getBook_id() %>">
  </section>
  
  <div id="footer"></div>
</body>
</html>