<%@page import="kr.or.ddit.book.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/import/header.html">
    <link rel="stylesheet" href="/import/footer.html">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/sidebar.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
  	
  	<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>







<style>
.fc-w {
	color: #ffffff;
}

button {
	white-space: nowrap; /* 한글 세로 방지 */
}

section {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	box-sizing: content-box;
	border-radius: 20px;
}

section>h1 {
	margin: 120px 0 50px;
}

.backImg {
	background-color: #f9f9f9;
	width: 70%;
	padding: 10px;
	text-align: center;
	margin: 0 0 100px;
}

table tr {
	display: flex;
	align-items: center;
}

table td {
	line-height: 60px;
}

tbody {
	display: block;
	height: 600px;
	overflow: auto;
}

table th:nth-child(1), table td:nth-child(1) {
	flex: 1 1 15%;
}

table th:nth-child(2), table td:nth-child(2) {
	flex: 1 1 46%;
}

table th:nth-child(3), table td:nth-child(3) {
	flex: 1 1 15%;
}

table th:nth-child(4), table td:nth-child(4) {
	flex: 1 1 7%;
}

table th:nth-child(5), table td:nth-child(5) {
	flex: 1 1 7%;
}



</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
<link rel="manifest"
	href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function () {
        $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
        $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
        $('#sidebar').load("<%=request.getContextPath()%>/import/sidebar2.jsp");
	});
</script>


</head>
<%
List<BookVO> list = (List<BookVO>) request.getAttribute("bookList");
%>
<body>



	<div id="header"></div>
	<div id="sidebar"></div>


	<section>
		
		<div class="backImg">
			<h2 class="m-4">도서관리</h2>
			<div>
				<table class="table table-striped table-light">
					<thead class="table-dark">
						<tr class="fs-5">
							<th>ID</th>
							<th>제목</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (BookVO bookVO : list) {
						%>
						<tr class="fs-5">
							<td><%=bookVO.getBook_id()%></td>
							<td><%=bookVO.getBook_tit()%></td>
							<td><%=bookVO.getBook_author()%></td>
							<td><button id="editButton_<%=bookVO.getBook_id()%>"
									type="button" class="btn btn-primary fc-w">수정</button></td>
							<td><button id="delButton_<%=bookVO.getBook_id()%>"
									type="button" class="btn btn-danger fc-w">삭제</button></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<div class="justify-content-end m-5 ">
					<button id="bookInsert" type="button"
						class="btn btn-success px-4 py-2 fs-5">도서 입고</button>
				</div>
			</div>
		</div>
	</section>

	<div id="footer"></div>

	<script>
  $(document).ready(function() {
	  <% if (request.getAttribute("updateCheck") != null) { %>
	  	alert("도서 수정이 완료되었습니다!");
	  <% } %>
	  <% if (request.getAttribute("deleteCheck") != null) { %>
	  	alert("도서 삭제가 완료되었습니다!");
	  <% } %>
    <%for (BookVO bookVO : list) {%>
      // 버튼 클릭 이벤트 핸들러
      $("#editButton_<%=bookVO.getBook_id()%>").click(function() {
        window.location.href = "<%=request.getContextPath()%>/book/bookUpdate.do?id=<%=bookVO.getBook_id()%>";
      });
      $("#delButton_<%=bookVO.getBook_id()%>").click(function() {
    	  if (confirm("정말로 삭제하시겠습니까?")) {
   		    window.location.href = "<%=request.getContextPath()%>/book/bookDelete.do?id=<%=bookVO.getBook_id()%>";
   		  } else {
   		    return false;
   		  }
      });
    <%}%>

    $("#bookInsert").click(function() {
      location.href = "<%=request.getContextPath()%>/book/bookInsert.jsp";
	});
  }); // ready 함수 끝
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		
		
</body>
</html>