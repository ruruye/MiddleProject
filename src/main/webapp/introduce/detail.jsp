<%@page import="kr.or.ddit.book.vo.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
BookVO vo = (BookVO)request.getAttribute("requestDetail");

%>    

{
"id" : "<%=vo.getBook_id() %>",
"tit" : "<%=vo.getBook_tit() %>",
"author" : "<%=vo.getBook_author() %>",
"publi" : "<%=vo.getBook_publi() %>",
"publidate" : "<%=vo.getBook_publidate() %>",
"genre" : "<%=vo.getBook_genre() %>",
"isbn" : "<%=vo.getBook_isbn() %>",
"yn" : "<%=vo.getBook_yn() %>",
"price" : "<%=vo.getBook_price() %>",
"callsign" : "<%=vo.getBook_callsign() %>",
"img" : "<%=vo.getBook_img() %>"

}