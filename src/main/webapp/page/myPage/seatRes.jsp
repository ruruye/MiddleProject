<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    
    <title>마이페이지-좌석예약현황</title>

    <style>
        h3, table {
            text-align: center;
        }

        .container {
            display: flex;
            flex-direction: column; 
            align-items: center;
            justify-content: center;
            margin-top: 50px;
        }

        table {
            border: 2px solid #b4b4b4;
            border-collapse: collapse;
            width: 550px;
            height: 100px;
            font-size: 17px;
        }

        table th {
            height: 50px;
        }

        table td {
            height: 60px;
        }

        #sBtn {
            width: 555px;
            height: 40px;
            background-color: darkgray;
            color: white;
            border-radius: 5px;
            font-size: 17px;
            border: 1px solid white;
            align-items: center;
            margin-top: 20px; 
        }

        h3 {
            font-weight: bold;
            margin-top: 50px;
            margin-bottom: 180px;
        }
    </style>
</head>
<body>
    <h3>좌석예약현황</h3>
    <div class="container">
        <table border="1">
            <tr>
                <th>좌석구역</th>
                <th>좌석번호</th>
                <th>입실시간</th>
                <th>퇴실예정시간</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <input type="button" value="좌석반납" id="sBtn">
    </div>

    <script>
        $(function(){
            $('#sBtn').on('click', function(){
                alert('좌석 반납이 완료되었습니다.');
                $('table td').text('');
            })
        });
    </script>
</body>
</html>
    