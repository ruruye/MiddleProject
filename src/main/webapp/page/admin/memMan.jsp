<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>회원관리</title>
    <style>
        
        h2 {
            font-weight: bold;
            margin-top: 50px;
            text-align: center;
        }
    
        #all{
            justify-content: center;
            flex-direction: column;
            text-align: center;
            align-content: stretch;
			margin: 10px 15% auto;            
        }
        .container {
            margin: 1px;
            display: flex;
            height: 220px;
            justify-content: space-around;
            align-items: center;
            
        }
        img {
            border-radius: 70%;
            overflow: hidden;
            object-fit: cover;

        }
    
    
        .input .delete{
            
            width: 120px;
            height: 40px;
            background-color: #EB0000;
            color: white;
            border-radius: 5px;
            font-size: 17px;
            border: 1px solid white;
            align-items: center;
        }

        .input .black{
            width: 140px;
            height: 40px;
            background-color: darkgray;
            color: white;
            border-radius: 5px;
            font-size: 17px;
            border: 1px solid white;
            align-items: center;
        }
        
        .label .idf{
            font-size: 20px;
            margin-bottom: 7px;
            margin-right:10px;
            
        }
        .label .id{
            height: 33px;
            margin-bottom: -10px;
            border-radius: 5px;
            border : 2px solid #b4b4b4;

        }
        .label .name{
            height: 33px;
            border-radius: 5px;
            border : 2px solid #b4b4b4;
        }
        .one{
            display: flex;
            margin-bottom: 4%;
            justify-content: right;
        }
        
    </style>
</head>
<body>
    <h2>회원관리</h2>
    <div id="all">
    	<hr>
       <div class="container">
        <div class="img"><img src="../images/강아지.png" alt="../images/강아지.png" width="150"></div>
        <div class="label">
            <div class="one">
            <label for="id" class="idf">아이디</label>
            <input type="text" name="id" class="id" placeholder="회원 아이디"><br>
            </div>
            <div class="one">
            <label for="name" class="idf">이름</label>&nbsp;
            <input type="text" name="name" class="name" placeholder="회원 이름">
            </div>
        </div>
        <div class="input">
        <input type="button" value="회원 삭제" class="delete">
        <input type="button" value="블랙리스트 추가" class="black">
        </div>
      </div>
    	<hr>
      <div class="container">
       <div class="img"><img src="../images/강아지.png" alt="../images/강아지.png" width="150"></div>
       <div class="label">
           <div class="one">
           <label for="id" class="idf">아이디</label>
           <input type="text" name="id" class="id" placeholder="회원 아이디"><br>
           </div>
           <div class="one">
           <label for="name" class="idf">이름</label>&nbsp;
           <input type="text" name="name" class="name" placeholder="회원 이름">
           </div>
       </div>
       <div class="input">
       <input type="button" value="회원 삭제" class="delete">
       <input type="button" value="블랙리스트 추가" class="black">
       </div>
     </div>
    	<hr>
     <div class="container">
      <div class="img"><img src="../images/강아지.png" alt="../images/강아지.png" width="150"></div>
      <div class="label">
          <div class="one">
          <label for="id" class="idf">아이디</label>
          <input type="text" name="id" class="id" placeholder="회원 아이디"><br>
          </div>
          <div class="one">
          <label for="name" class="idf">이름</label>&nbsp;
          <input type="text" name="name" class="name" placeholder="회원 이름">
          </div>
      </div>
      <div class="input">
      <input type="button" value="회원 삭제" class="delete">
      <input type="button" value="블랙리스트 추가" class="black">
      </div>
    </div>
    	
    </div>

    <script>
         $(function() {
            $('.delete').on('click', function() {
                $(this).closest('.container').remove();
                alert("회원 삭제가 완료되었습니다.");
            });

            $('.black').on('click', function() {
                $('.black').on('click', function() {
                var container = $(this).closest('.container');
                container.remove();
                alert("블랙리스트에 추가 완료되었습니다.");
                });
            });
        });          
    </script>
</body>
</html>