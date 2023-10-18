<%@page import="kr.or.ddit.member.vo.AuthorityVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
	String check = (aVo != null) ? aVo.getAuthority() : null;
%>

<style>
  #content {
    margin: 0;
/*     padding: 10px; */
    background: #212529;
    width: 100px;
  }

  #rank-list {
    color: #111;
    text-decoration: none;
    font-size: 20px; /* Adjust the font size as desired */
/*     border : 1px solid white; */
    overflow: hidden;
    width: 130px;
    height: 20px;
    margin: 0;
    margin-top: 10px;
    text-align: center;
    
  }

  #rank-list dt {
    display: none;
  }

  #rank-list dd {
    position: relative;
    margin: 0;
  }

  #rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
  }

  #rank-list li {
    height: auto;
    font-size: 15px; /* Adjust the font size as desired */
  }
  .d-flex{
  	height: 43px;
  }
  * {
    font-family: 'Diphylleia', serif; 
    font-weight: bold;
  } 
  .rankhover{
    display: block;
  }
  
  #rank-list2 {
  	display:none; 
    border: 2px solid brown;
  	position:absolute; 
  	top:45px; 
  	left:1100px; 
  	background-color:white; 
  	padding: 15px 15px 0 10px;
    border-radius: 15px;
  }

</style>


<header>
  <nav class="navbar navbar-expand-md navbar fixed-top">
    <div class="container-fluid1">
      <!-- <a class="navbar-brand" href="https://getbootstrap.kr/docs/5.2/examples/carousel/#">Carousel</a> -->
      
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Dancing+Script&family=Diphylleia&family=Indie+Flower&family=Permanent+Marker&display=swap" rel="stylesheet">
      
      <img src="<%=request.getContextPath() %>/images/mainlogo.png" alt="mainlogo.png" class="logo">
      <a href="<%=request.getContextPath()%>/index.jsp" target="_self" class="font-sil">DDLibrary</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

      <div class="">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <!-- <span class="navbar-toggler-icon"> -->
        </button>
        <div class="collapse navbar-collapse justify-content-center " id="navbarCollapse">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item text-center " >
              <a class="nav-link " aria-current="page" href="<%=request.getContextPath()%>/introduce/Introduction.jsp">도서관이용/소개</a>
            </li>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <li class="nav-item text-center">
              <% if ("member".equals(check)) { %>
              <a class="nav-link" href="<%=request.getContextPath()%>/seats/seatsList.do">좌석예약</a>
              <% } else if ("admin".equals(check)) { %>
              <a class="nav-link" href="<%=request.getContextPath()%>/seats/seatsAdminList.do">좌석관리</a>
              <% } %>
              
            </li>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <form class="d-flex" role="search" action="<%=request.getContextPath()%>/book/listBookSearch.do">
              <input class="form-control me-2" name="searchWord" type="search" placeholder="도서검색" aria-label="Search" style="width: 700px;">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <dl id="rank-list">
          <dt>인기 도서 순위</dt>
          <dd>
            <ol>
              <li>👑 커피의 향미</li>
              <li>💍 춘향전</li>
              <li>🎃 청소년문화론</li>
              <li>🐣 말의 트렌드</li>
              <li>🐳 사장학개론</li>
              <li>🐩 법인세 기본</li>
              <li>🐾 생명의 정거장</li>
              <li>🍀 취미는 식물</li>
              <li>💐 마흔의 품격</li>
              <li>🧸 돈의 심리학</li>
            </ol>
          </dd>
        </dl>
        
        <div id="rank-list2" >
          <dl>
          <h5 style="font-weight:bold;">&nbsp;&nbsp;인기 도서 순위</h5>
          <dd>
            <ol>
              <li>👑 커피의 향미</li>
              <li>💍 춘향전</li>
              <li>🎃 청소년문화론</li>
              <li>🐣 말의 트렌드</li>
              <li>🐳 사장학개론</li>
              <li>🐩 법인세 기본</li>
              <li>🐾 생명의 정거장</li>
              <li>🍀 취미는 식물</li>
              <li>💐 마흔의 품격</li>
              <li>🧸 돈의 심리학</li>
            </ol>
          </dd>
          </dl>
       </div>
       
      
      <script>
	  $(function() {
		  $('#rank-list ol li').on("mouseover", function(){
			  $("#rank-list2").show();
		  });
 		  $('#rank-list ol li').on("mouseout", function(){
			  $("#rank-list2").hide();
		  }); 
		  
		  
	    var count = $('#rank-list li').length;
	    var currentIndex = 0;
	
	    function rollRank() {
	      var currentElement = $('#rank-list ol li').eq(currentIndex);
	      currentIndex = (currentIndex + 1) % count;
	      var nextElement = $('#rank-list ol li').eq(currentIndex);
	
	      currentElement.fadeOut(500, function() {
	        nextElement.fadeIn(500, function() {
	          setTimeout(rollRank, 2000); // Delay between rolls
	        });
	      });
	    }
	
	    rollRank();
	  });
	 </script>

      
      
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li class="nav-item text-center">
              <% if ("member".equals(check)) { %>
              <a class="nav-link" href="<%=request.getContextPath()%>/myPage/loanRecord.do">마이페이지</a>
              <% } else if ("admin".equals(check)) { %>
              <a class="nav-link" href="<%=request.getContextPath()%>/book/bookMgmtPage.do">관리자페이지</a>
              <% } %>
            </li>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%-- 로그인 상태에 따라 로그인 또는 로그아웃 표시 --%>
            <li class="nav-item text-center">
              <% if (check != null) { %>
                <a class="nav-link" href="<%=request.getContextPath()%>/member/sessionLogout.do">로그아웃</a>
              <% } else { %>
                <a class="nav-link" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a>
              <% } %>
            </li>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li class="nav-item text-center">
              <% if ("member".equals(check)) { %>
                  <a class="nav-link" id="hUser" style="color: white;"><%=aVo.getId()%>님</a>
                <% } else if ("admin".equals(check)) { %>
               	  <a class="nav-link" id="hUser" style="color: white;">관리자</a>
                <% } else { %>
                  <a class="nav-link" href="<%=request.getContextPath()%>/member/register.jsp">회원가입</a>
                <% } %>
            </li>
          </ul>
      </div>
      </div>
    </div>
  </nav>
</header>