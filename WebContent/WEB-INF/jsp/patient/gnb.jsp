<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="gnb width_full_size">
	<ul style="margin: 0px;">
		<li><a class="text_no_underline color_black" href="${context}/home.do?action=move&page=loginMain">홈으로</a></li>
		<li><a class="text_no_underline color_black" href="${context}/board.do?action=list&page=articleList&pageNO=1">게시판</a></li>
		<li><a class="text_no_underline color_black" href="${context}/patient.do?action=move&page=treatmentList">진료기록조회</a></li>
		<li>
			<div class="tooltip">
				<a class="text_no_underline color_black" href="#">병원소개</a>
					<span class="tooltiptext">구현되지 않았습니다.</span>
			</div>
		</li>
		<li style="float:right;margin-right: 45px;"><a class="text_no_underline color_black" href="${context}/patient.do?action=mypage&page=detail">마이페이지</a></li>
		<li style="float:right;"><a class="text_no_underline color_black" href="${context}/home.do?action=logout&page=main">로그아웃</a></li>
	</ul>
</div>