<%@page import="kr.or.ddit.book.vo.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="manifest"
	href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/manifest.json">
  <link rel="mask-icon"
	href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
  <title>Book Information Form</title>
  <script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
	<script>
	    $(document).ready(function () {
	        $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
	        $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
		});
	</script>
  <style>
    .flex {
      display: flex;
    }
    
    section {
      width: 50%;
      margin: 130px auto 50px;
      padding: 30px;
      max-width: 550px;
      border: 1px solid #9c9c9c;
      border-radius: 15px;
      box-shadow: 0 0 5px #0d6efd59;
      background-color: #ffffff;
    }
    .div1 {
    	margin-right: 20px
    }
  </style>
</head>

<% 
	BookVO bookVO = (BookVO)request.getAttribute("bookVO");
%>
<body>
  <div id="header"></div>

  <section class="">
    <div class="container">
      <h1 class="mb-4">도서 정보 수정</h1>
      <form id="bookUpdateForm" method="post" action="<%=request.getContextPath()%>/book/bookUpdate.do?id=<%=bookVO.getBook_id()%>" class="flex flex-column">
        <div class="flex justify-content-between">
          <div class="flex flex-column div1">
            <div class="mb-3">
              <label for="title" class="form-label">제목</label>
              <input type="text" class="form-control" id="title" name="title" value="<%=bookVO.getBook_tit()%>" required>
            </div>
            <div class="mb-3">
              <label for="author" class="form-label">저자</label>
              <input type="text" class="form-control" id="author" name="author" value="<%=bookVO.getBook_author()%>" required>
            </div>
            <div class="mb-3">
              <label for="publisher" class="form-label">출판사</label>
              <input type="text" class="form-control" id="publisher" name="publisher" value="<%=bookVO.getBook_publi()%>" required>
            </div>
            <div class="mb-3">
              <label for="publish-date" class="form-label">출판일</label>
              <input type="date" class="form-control" id="publish-date" name="publish-date" value="<%=bookVO.getBook_publidate()%>" required>
            </div>
          </div>
          <div class="flex flex-column">
            <div class="mb-3">
              <label for="genre" class="form-label">장르</label>
              <select class="form-select" id="genre" name="genre" required>
                <option selected><%=bookVO.getBook_genre()%></option>
                <option value="총류">총류</option>
                <option value="철학">철학</option>
                <option value="종교">종교</option>
                <option value="사회과학">사회과학</option>
                <option value="자연과학">자연과학</option>
                <option value="과학기술">과학기술</option>
                <option value="예술">예술</option>
                <option value="언어">언어</option>
                <option value="문학">문학</option>
                <option value="역사">역사</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="isbn" class="form-label">ISBN</label>
              <input type="text" class="form-control" id="isbn" name="isbn" value="<%=bookVO.getBook_isbn()%>" required>
            </div>
            <div class="mb-3">
              <label for="price" class="form-label">가격</label>
              <input type="number" class="form-control" id="price" name="price" value="<%=bookVO.getBook_price()%>" required  step="1000">
            </div>
            <div class="mb-3">
              <label for="call-sign" class="form-label">청구기호</label>
              <input type="text" class="form-control" id="call-sign" name="call-sign" value="<%=bookVO.getBook_callsign()%>" required>
            </div>
          </div>
        </div>
        <div class="mb-4">
          <label for="image" class="form-label">이미지</label>
          <input type="file" class="form-control mb-3" id="image" name="image">
        </div>
        <button type="submit" class="btn btn-primary">도서 수정 완료</button>
      </form>
    </div>
  </section>

  <div id="footer"></div>

  <script>


    // 날짜 JS
    var today = new Date().toISOString().split('T')[0];
    document.getElementById("publish-date").setAttribute('max', today);
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>
</html>
