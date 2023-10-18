<%@page import="kr.or.ddit.loan.vo.LoanVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.book.vo.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    
    <title>마이페이지-도서대출기록</title>
    <link href="<%=request.getContextPath() %>/Carousel Template · Bootstrap v5.2_files/carousel.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/import.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/sidebar.css">
  <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
  <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/images/logo.png"/>
    

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
        h3{
            font-weight: bold;
            margin-top: 50px;
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
	
    <h3>도서 대출기록</h3>
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
                    <th>반납현황</th>
                </tr>
                <tr>
                    <td><%=vo.getBook_tit() %></td>
                    <td><%=vo.getLoans_date() %></td>
                    <td> <% if (vo.getReturn_date()==null) { %>
		               도서 미반납
		              <% } else { %>
		                <%=vo.getReturn_date() %>
		              <% } %></td>
                </tr>
            </table>
        </div>
    </div>
	<%
    	}
	%>
	<br><br><br><br><br>
	<div id="footer"></div>
</body>
</html>