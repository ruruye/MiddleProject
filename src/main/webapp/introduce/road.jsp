<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>찾아오시는 길</title>
<link
	href="<%=request.getContextPath()%>/Carousel Template · Bootstrap v5.2_files/carousel.css"
	rel="stylesheet">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/import.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/images/logo.png" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script charset="UTF-8" class="daum_roughmap_loader_script"
	src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
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

.container {
	max-width: 800px;
	margin: 70px auto 30px;
	padding: 20px;
}

h1 {
	text-align: center;
	font-size: 32px;
}

#daumRoughmapContainer1686886457282 {
	width: 100%;
	height: 500px;
	margin: 0 auto 100px;
}
</style>
</head>
<body>
	<div id="header"></div>
	<section>
		<div class="container">
			<h1 class="animate__animated animate__bounceIn">찾아오시는 길</h1>
		</div>
		<div id="daumRoughmapContainer1686886457282"
			class="root_daum_roughmap root_daum_roughmap_landing"></div>
	</section>

	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1686886457282",
			"key" : "2f7hd",
			"mapWidth" : "960",
			"mapHeight" : "800"
		}).render();
	</script>
	<div id="footer"></div>
</body>

</html>
