<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="serviceImpl.BoardServiceImpl"%>
<%@page import="service.BoardService"%>
<%@page import="daoImpl.BoardDAOImpl"%>
<%@page import="dao.BoardDAO"%>
<%@page import="domain.ArticleBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<link rel="stylesheet" href="../../css/hanbit.css" />
</head>
<body>
<div id="wrapper" class="width_full_size">
<div id="header" class="width_full_size" style="height: 100px;position: fixed;height: 68px;z-index: 2; background-color: white;">
	<div class="logo_box width_full_size">
	<img src="../../images/common/index_logo.png"/>
	</div>
	<div class="gnb width_full_size">
	<ul style="margin: 0px;">
		<li><a class="text_no_underline color_black" href="../../index.html">홈으로</a></li>
		<li><a class="text_no_underline color_black" href="../bbs/bbs_list.html">게시판</a></li>
		<li><div class="dropdown">
			<a class="text_no_underline color_black" href="../admin/admin.html">관리자</a>
				<div class="dropdown_content">
				   <p><a class="active" href="../staff/doctors.html">의사</a></p>
				   <p><a class="active" href="../staff/nurses.html">간호사</a></p>
				   <p><a class="active" href="../customer/patients.html">환자</a></p>
				   <p><a class="active" href="../chart/chart_list.html">차트</a></p>
				</div>
			</div>
		</li>
		<li>
			<div class="tooltip">
				<a class="text_no_underline color_black" href="#">병원소개</a>
					<span class="tooltiptext">구현되지 않았습니다.</span>
			</div>
		</li>
		<li style="float:right;margin-right: 45px;"><a class="text_no_underline color_black" href="join.html">회원 가입</a></li>
		<li style="float:right;"><a class="text_no_underline color_black" href="login.html">로그인</a></li>
	</ul>
	</div>
</div>
<div style="height: 140px;"></div>
<div id="container" class="width_full_size" style="height: 300px;">
<%
	BoardService service=BoardServiceImpl.getInstance();
	List<ArticleBean> list=new ArrayList<ArticleBean>();
	String[] param={request.getParameter("property"),request.getParameter("searchKeyword")};
	list=service.findSome(param);
%>
<div class="margin_center" style="width: 500px;height: 180px">
<table class="table_default margin_center" style="width: 500px;height: 180px">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>날짜</th>
	<th>조회수</th>
</tr>
<% for(ArticleBean i :list){ %>
<tr>
	<td><%= i.getSeq() %></td>
	<td><a href="article.jsp?seq=<%= i.getSeq() %>"><%= i.getTitle() %></a></td>
	<td><%= i.getId() %></td>
	<td><%= i.getRegdate() %></td>
	<td><%= i.getReadCount() %></td>
</tr>
<%} %>
</table>
<a href="articleList.jsp">목록으로</a>
</div>
</div>
<div id="footer" class="width_full_size" style="height: 100px; border-top:2px solid black;">
	<dl class="notice">
		<dt><a href="/NOTICE" class="h_notice">공지사항</a></dt>
	</dl>
	<dl class="policy">
		<dt>네이버 정책 및 약관</dt>
		<dd class="f"><a href="http://www.navercorp.com/" target="_blank" id="plc.intronhn">회사소개</a></dd>
		<dd><a href="http://mktg.naver.com/" id="plc.adinfo">광고</a></dd>
		<dd><a href="https://submit.naver.com/" id="plc.search">마이비즈니스</a></dd>
		<dd><a href="https://www.navercorp.com/ko/company/proposalGuide.nhn" target="_blank" id="plc.contact">제휴제안</a></dd>
		<dd><a href="rules/service.html" id="plc.service">이용약관</a></dd>
		<dd><a href="rules/privacy.html" id="plc.privacy"><strong>개인정보처리방침</strong></a></dd>
		<dd><a href="rules/youthpolicy.html" id="plc.youth">청소년보호정책</a></dd>
		<dd><a href="rules/spamcheck.html" id="plc.policy">네이버 정책</a></dd>
		<dd><a href="https://help.naver.com/" id="plc.helpcenter">네이버 고객센터</a></dd>
	</dl>
	<address>&copy; <strong><a href="http://www.navercorp.com/" target="_blank">NAVER Corp.</a></strong></address>
</div>

</body>
</html> 