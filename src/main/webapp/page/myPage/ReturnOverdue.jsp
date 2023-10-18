<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.loan.vo.LoanVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    
    <title>마이페이지-도서반납/연체현황</title>
    <link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/sidebar.css">
  <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
  <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>


	<script>
  	
    $(function() {
      $(document).on('click', '.btn', function() {
    	  
        $.ajax({
          url: '<%=request.getContextPath() %>/bookReturn.ajax',
          type: 'get',
          success: function(res) {
        	  if(res.loanYn=="y"){
        		  alert("반납 완료")
        	  }else{
        		  alert("반납 실패")
        	  }

          },
          error: function(xhr) {
            alert(xhr.status);
          },
          dataType: 'json',
          data: {"loans_id": $(this).data("loans"), "book_id": $(this).data("book")}
        });
      });
    });
  </script>
	

    <style>
        h3 {
            text-align: center;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
        }

        .image-container {
            flex: 1;
            margin-left: 700px;
            margin-right: 50px;
        }

        .table-container {
            flex: 1;
            margin-right: 550px;
            margin-top: -60px;
            text-align: center;
        }

        table {
            border : 2px solid #b4b4b4;
            border-collapse: collapse;
            width: 550px;
            height: 100px;
            font-size: 17px;
        }
        
        table th{
            height : 50px;    
        }

        table td {
            height : 55px;
        }
        /* .bBtn{
            width: 80px;
            height: 40px;
            background-color: darkgray;
            color: white;
            border-radius: 5px;
            font-size: 19px;
            border: 1px solid white;
            align-items: center;
            margin-left: 62px;
            margin-top: 20px;
        } */
        h3{
            font-weight: bold;
            margin-top: 50px;
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
        table.table.table-hover{
			width: 600px;
		}
    </style>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script>
    $(document).ready(function () {
      $('#header').load("<%=request.getContextPath()%>/import/header.jsp");
      $('#footer').load("<%=request.getContextPath()%>/import/footer.jsp");
      $('#sidebar').load("<%=request.getContextPath()%>/import/sidebar.jsp");
    });
  	</script>
  	
</head>
<body>
	
	<div id="header"></div>
	<div id="sidebar"></div>

    <h3>도서반납/연체현황</h3>
    <%
    	List<LoanVO> list = (List<LoanVO>)request.getAttribute("loanList");
    	for (LoanVO vo : list) {
    %>
    
   <div class="container">
        <div class="image-container">
            <img src="<%=request.getContextPath()%>/images/<%=vo.getBook_img() %>" alt="샘플이미지">
        </div>
        <div class="table-container">
            <table border="1" class="table table-hover">
                <tr>
                    <th>제목</th>
                    <th>대출일</th>
                    <th>반납예정일</th>
                    <th>연체일</th>
                </tr>
                <tr>
                    <td><%=vo.getBook_tit() %></td>
                    <td><%=vo.getLoans_date() %></td>
                    <td><%=vo.getOverdue_date()%></td>
                    <td><%=vo.getOverdue() %></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="borrow-button">
          <button class="btn btn-primary" data-book="<%=vo.getBook_id() %>" data-loans="<%=vo.getLoans_id() %>">반납</button>
    </div>
	<%
    	}
	%>
	
	<br><br><br><br><br>
	
	<div id="footer"></div>
</body>
</html>