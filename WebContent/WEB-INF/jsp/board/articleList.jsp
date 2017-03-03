<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/top.jsp"/>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/gnb.jsp"/>
<div style="height: 140px;"></div>
<div id="container">
	<div>
		<form action="articleSome.jsp">
			<select name="property" name="property">
			    <option value="id">작성자</option>
			    <option value="title">제목</option>
			</select>
			<input type="text" name="searchKeyword"/>
			<input type="submit" value="검색"/>
		</form>
	<table id="articleList">
		<tr>
			<td>총게시글수: ${requestScope.count}</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="article" items="${requestScope.list}">
			<tr>
				<td>${article.seq}</td>
				<td><a href="${context}/board.do?action=detail&page=article&seq=${article.seq}">${article.title}</a></td>
				<td>${article.id}</td>
				<td>${article.regdate}</td>
				<td>${article.readCount}</td>
			</tr>
		</c:forEach>
	</table>
	<%-- <nav style="width: 500px;margin: 0 auto;background: gray;">
		<ul class="gnb">
			<c:forEach var="pageNo" items="${requestScope.block}">
			<li style="text-align: center;width: 38px;">
				<a href="">${pageNo}</a>
			</li>
			</c:forEach>
		</ul>
	</nav> --%>
	</div>
	</div>
<jsp:include page="../common/footer.jsp"/>
<script>
$(function(){
	var $articleList=$('#articleList');
	$('#container').addClass('width_full_size').css('height','300px');
	$('#container>div').addClass('margin_center').css('width','500px').css('height','180px');
	$articleList.addClass('table_default').addClass('margin_center').css('width','500px').css('height','180px');
})
</script>