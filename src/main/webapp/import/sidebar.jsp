<%@page import="kr.or.ddit.member.vo.AuthorityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- SIDEBAR -->
<%
	AuthorityVO aVo = (AuthorityVO) session.getAttribute("user");
%>

  <div id="sidebar" class="border" style="display: inline-block;">
    <a href="<%=request.getContextPath()%>/member/gotoUpdateMember.do?id=<%=aVo.getId()%>">회원정보수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=request.getContextPath()%>/myPage/loanRecord.do">도서대출기록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=request.getContextPath()%>/myPage/returnRecord.do">도서반납/연체현황</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=request.getContextPath() %>/member/LibraryWithdraw.do">회원탈퇴</a>
  </div>
