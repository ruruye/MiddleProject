<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml'>
    <head>
        <title>Real-time Rank</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link href="stylesheet.css" media="screen" rel="stylesheet" type="text/css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script src="application.js" type="text/javascript"></script>
        <script>
            $(function() {
                var count = $('#rank-list li').length;
                var maxHeight = 0;
        
                // Find the maximum height among all list items
                $('#rank-list li').each(function() {
                    var listItemHeight = $(this).height();
                    if (listItemHeight > maxHeight) {
                        maxHeight = listItemHeight;
                    }
                });
        
                function step(index) {
                    $('#rank-list ol').delay(2000).animate({
                        top: -maxHeight * index,
                    }, 500, function() {
                        step((index + 1) % count);
                    });
                }
        
                step(1);
            });
        </script>
        </head>
        <style>
            body {
                font-size: 12px;
                background: #FFF;
                color: #333;
                margin: 0;
            }
        
            #content {
                margin: 20px;
                padding: 10px;
                background: #212529;
                width: 100px;
            }
        
            #rank-list a {
                color: #FFF;
                text-decoration: none;
            }
        
            #rank-list a:hover {
                text-decoration: underline;
            }
        
            #rank-list {
                overflow: hidden;
                width: 200px;
                height: 15px;
                margin: 0;
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
            }
        </style>
        


    <body>
        <div id="content">
            <dl id="rank-list">
                <dt>실시간 인기 도서 순위</dt>
                <dd>
                    <ol>
                        <li><a href="#">1. 커피의 향미</a></li>

                        <li><a href="#">2. 춘향전</a></li>

                        <li><a href="#">3. 청소년문화론</a></li>

                        <li><a href="#">4. 말의 트렌드</a></li>

                        <li><a href="#">5. 전력질주</a></li>

                        <li><a href="#">6. 법인세 기본</a></li>

                        <li><a href="#">7. 생명의 정거장</a></li>

                        <li><a href="#">8. 취미는 식물</a></li>

                        <li><a href="#">9. 마흔의 품격</a></li>

                        <li><a href="#">10. 리먼 트릴로지</a></li>
                    </ol>
                </dd>
            </dl>
        </div>
    </body>
</html>