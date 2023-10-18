<%@page import="kr.or.ddit.member.vo.AuthorityVO"%>
<%@page import="kr.or.ddit.book.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0051)https://getbootstrap.kr/docs/5.2/examples/carousel/ -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
	; pageEncoding="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>main</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/carousel/">
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/images/logo.png" />

<link
	href="<%=request.getContextPath()%>/Carousel Template · Bootstrap v5.2_files/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="manifest"
	href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">

<meta name="theme-color" content="#712cf9">
<link rel="stylesheet" href="<%=request.getContextPath()%>/import/header.html">
<link rel="stylesheet" href="<%=request.getContextPath()%>/import/footer.html">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/Carousel Template · Bootstrap v5.2_files/carousel.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
    $(document).ready(function () {
        $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
        $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
	});
</script>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f9fa;
}

div.carousel-caption {
	position: absolute;
	bottom: 110px;
}
.carousel-inner {
height: 100%
}

.slide-img {
	width: 100%; 
	height: 100%; 
	object-fit: cover; 
	object-position: center;
}
</style>

</head>


<body>

	<%
	//Session객체를 생성하거나 현재 세션 가져오기 
	//HttpSession hSession=request.getSession();
	AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
	String check = (aVo != null) ? aVo.getAuthority() : null;

	//memVO를 header.jsp에 전달 
	request.setAttribute("user", aVo);
	List<BookVO> list = (List<BookVO>) request.getAttribute("requestList");
	%>

	<div id="header"></div>

	<main>

		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2" class="active"
					aria-current="true"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/slide1.jpg"
						alt="배경 이미지" class="slide-img">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777"></rect></svg>
					<div class="container">
						<div class="carousel-caption text-start">

							<h1>최신소식</h1>

							<p>
								<a id="more" class="btn btn-lg btn-light" href=
								<% if("admin".equals(check)) { %>
									"<%=request.getContextPath()%>/notice/listNoticeAdmin.do"	
								<% } else { %>
									"<%=request.getContextPath()%>/notice/listNoticeSearch.do"									
								<% } %>
								>
								더보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item active">
					<img src="<%=request.getContextPath()%>/images/slide2.jpg"
						alt="배경 이미지" class="slide-img">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777"></rect></svg>

					<div class="container">
						<div class="carousel-caption">
							<h1>질문게시판</h1>

							<p>
								<a class="btn btn-lg btn-light" href=
								<% if("admin".equals(check)) { %>
									"<%=request.getContextPath()%>/manager/listPostAdmin.do"	
								<% } else { %>
									"<%=request.getContextPath()%>/post/listPostSearch.do"									
								<% } %>
								>더보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/slide3.jpg"
						alt="배경 이미지"  class="slide-img">
					<svg class="bd-placeholder-img" width="100%" height="10%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777"></rect></svg>

					<div class="container">
						<div class="carousel-caption text-end">
							<h1>인사말</h1>

							<p>
								<a class="btn btn-lg btn-light"
									href="<%=request.getContextPath()%>/introduce/welcome.jsp">더보기</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<%
		int cnt = 0;
		for (BookVO vo : list) {
			cnt++;
			if (cnt % 3 == 1) {
		%>
		<div class="container marketing">
			<hr class="featurette-divider">
			<!-- Three columns of text below the carousel -->
			<div class="row">

				<%
				}
				%>

				<div class="col-lg-4">
					<!-- <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg> -->
					<img
					<% if(vo.getBook_img() != null) { %>
						src="<%=request.getContextPath()%>/images/<%=vo.getBook_img()%>"
					<% } else { %>
						src="https://via.placeholder.com/210x300"
					<% } %>
						alt="<%=vo.getBook_img()%>.png" class="book"> <br>
					<br>
					<h4 class="fw-normal" style="font-weight: bold;"><%=vo.getBook_tit()%></h4>
					<p><%=vo.getBook_author()%>,
						<%=vo.getBook_publi()%></p>
					<p>
						<a class="btn btn-secondary"
							href="<%=request.getContextPath()%>/book/bookDetail.do?id=<%=vo.getBook_id()%>">상세정보
							»</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->

				<%
				if (cnt % 3 == 0) {
				%>
			</div>
			<!-- /.row -->

		</div>
		<!-- /.row -->
		<%
		}

		}
		%>
		
		
	</main>

	<br>
	<br>

	<div id="footer"></div>




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>