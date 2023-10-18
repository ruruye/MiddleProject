<%@page import="kr.or.ddit.admin.vo.BlackListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>블랙리스트 관리</title>
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

   <style type="text/css">
    table, h3 {
      text-align: center;
    }

    h3 {
      margin-top: 30px;
      font-weight: bold;
    }
  
    .editbtn, .deletebtn {
      width: 50%; 
      height: 100%;
      display: inline-block; 
    }
  
    .editbtn {
      width: 25%; 
    }
  
    .deletebtn {
      width: 60%; 
    }
  
    .profile-img {
      width: 100px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
    }
  
    table {
      table-layout: fixed;
      padding-bottom : 100px;
    }
  
    td, th {
      width: 20%; 
    }

    #blisttable{
      text-align: center;
      margin: auto;
      width: 70%;
      margin-top: 10px;
    }
    
	.modal {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0, 0, 0, 0.4);
	}
	
	.modal-content {
	  background-color: #fefefe;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 300px;
	}

	button {
	  margin-top: 10px;
	}
	div#footercon{
		width : 100%;
	}
	div#btable{
		margin-bottom : 0;
	}
  </style> 
  
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/import.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sidebar2.css">
  
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
	// 서블릿에서 보낸 자료 받기
	List<BlackListVO> blackList = (List<BlackListVO>)request.getAttribute("blackList");

%>




<body>
	<div id="header"></div>
	<div id="sidebar"></div>

    <h3>블랙리스트 관리</h3><br>

     <div id="blisttable">
<%
	if(blackList==null || blackList.size()==0){
%>
	<table class="table table-bordered align-middle">
		<tr>
			<td colspan="7">파일 목록이 하나도 없습니다.</td>
		</tr>	
	</table>		
<%
	}else{
		for(BlackListVO blackListVo : blackList){
			
%>

  <div id="btable">
<!--         <hr> -->
        <table class="table table-bordered align-middle">
        <tr>
<!--           <td rowspan="2"> -->
<%--             <img src="<%=request.getContextPath() %>/images/<%= blackListVo.getMemVo().getMem_name() %>.png" alt="<%= blackListVo.getMemVo().getMem_name() %>.png" class="profile-img"> --%>
<!--           </td> -->
          <th>ID</th>
          <td ><%= blackListVo.getBlack_id() %></td>
          <th>블랙리스트 사유</th>
          <td rowspan="2">
            <button class="editbtn" data-blackid="<%= blackListVo.getBlack_id() %>" data-memname="<%= blackListVo.getMemVo().getMem_name() %>" data-blankreason="<%= blackListVo.getBlank_reason() %>">수정</button>          
            <button data-blackid="<%= blackListVo.getBlack_id() %>" class="deletebtn">블랙리스트 삭제</button>
          </td>
        </tr>
        <tr>
          <th>NAME</th>
          <td><%= blackListVo.getMemVo().getMem_name() %></td>
          <td><%= blackListVo.getBlank_reason() %></td>
        </tr>
      </table>
	</div>

	
	<div id="editModal" class="modal">
    <div class="modal-content">
      <!-- 회원 정보 수정 폼 -->
      <form id="editForm" method="POST" action="editServlet">
        <h2>블랙리스트 정보 수정</h2>
        <label for="blackId">블랙리스트 아이디</label><br>
        <input type="text" id="blackId" name="blackid" value="<%= blackListVo.getBlack_id() %>" readonly="readonly"><br>
        <label for="memName">이름</label><br>
        <input type="text" id="memName" name="memname" value="<%= blackListVo.getMemVo().getMem_name() %>" readonly="readonly" ><br>
         <input type="hidden" id="memId" name="memid" value="<%= blackListVo.getMemVo().getMem_id() %>"><br>
         
         
        <label for="blankReason">블랙리스트 사유</label><br>
        <input type="text" id="blankReason" name="blankreason" value="<%= blackListVo.getBlank_reason() %>"><br>
     
        <!-- 필요한 회원 정보 입력 필드를 추가합니다. -->
        <button data-blackid="<%= blackListVo.getBlack_id() %>" type="button" class="update" >수정</button>
        <button type="button" class="close" >닫기</button>
      </form>
    </div>
  </div>
 

<%
		}
	}
%>
</div>
<div id="footer"></div>

</body>

<script>

$(document).ready(function() {

//회원 정보 수정 버튼 클릭 이벤트 처리- 모달창 띄우기 

$(".editbtn").on("click", function() {
  // 모달을 보여줍니다.
  $("#editModal").css("display", "block");

  // 모달 내의 입력 필드에 해당 정보 설정
  var blackId = $(this).data("blackid");
  var memName = $(this).data("memname");
  var blankReason = $(this).data("blankreason");

  $("#blackId").val(blackId);
  $("#memName").val(memName);
  $("#blankReason").val(blankReason);
  // 모달 닫기 버튼 클릭 이벤트 처리
  
});


$(".close").on("click", function() {
    // 모달을 숨깁니다.
   $("#editModal").css("display", "none");
  });
  


	  // 삭제 버튼 클릭 이벤트 처리
	  $(".deletebtn").on("click",function() {
		  alert("삭제가 완료되었습니다!");
	    // AJAX 요청을 통해 서버로 데이터 전송
	    $.ajax({
	      url: "<%=request.getContextPath() %>/Blackdelete.do", // 삭제를 처리하는 서버 측 코드가 있는 파일 경로
	      type: "POST",
	      data: { "blackId" : $(this).data("blackid") }, // 삭제할 블랙리스트 ID를 서버로 전송
	      success: function(response) {
	    	  console.log(response);

	      },
	      error: function(xhr, status, error) {
	        // 오류 처리
	        console.log(error);
	      }
	    });
	  });

	

	  // 모달창  입력후 수정 버튼 클릭 이벤트 처리
	  $(".update").on("click",function() {
		  alert("수정이 완료되었습니다!");
	    // AJAX 요청을 통해 서버로 데이터 전송
	    $.ajax({
	      url: "<%=request.getContextPath() %>/Blackupdate.do", // 수정을 처리하는 서버 측 코드가 있는 파일 경로
	      type: "POST",
	      data: { 
	    	    "memId" : $('#editForm #memId' ).val(),
	    	    "blankReason" : $('#editForm #blankReason' ).val()
	    	   
	      
	      }, // 수정할 블랙리스트 ID를 서버로 전송
	      success: function(response) {
	    	  console.log(response);
// 	    	  alert(response);
	    	  
			

// 			    // 수정된 블랙리스트 사유를 해당 행에 업데이트
// 			    var newBlankReason = $('#editForm #blankReason').val();
// 			    $(this).closest('tr').find('td:last-child').prev().text(newBlankReason);
				location.href = "<%=request.getContextPath()%>/BlackList.do";
	      },
	      error: function(xhr, status, error) {
	        // 오류 처리
	        console.log(error);
	      }
	    });
	  });
	  
	  
	});
	



</script>


</html>