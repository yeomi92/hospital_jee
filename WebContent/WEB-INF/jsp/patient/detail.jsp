<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/top.jsp"/>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="gnb.jsp"/>
<style>
.pat_detail {text-align: center; margin:0 auto;}
.pat_detail tr td{border: 1px solid #bbbbbb}
</style>
<div style="margin-top:50px; margin-bottom:50px; text-align:center; width:100%">
      <h1>진료기록부</h1>
      <div>
            <table class="pat_detail">
                  <tr style="text-align: left;">
                        <td colspan="5"><div><img src="${img}/common/defaultimg.jpg" alt="" width="160px"/></div></td>
                  </tr>
                  <tr>
                        <td style="width: 60px" rowspan="5"><span style="font-size: 20px">내<br>정<br>보</span></td>
                        <td style="width: 100px">이름</td>
                        <td style="width: 150px">${user.patName}</td>
                        <td style="width: 100px">직업</td>
                        <td style="width: 150px">${user.patJob}</td>
                  </tr>
                  <tr>
                        <td>생년월일</td>
                        <td>${requestScope.birth}</td>
                        <td>키</td>
                        <td>180cm</td>
                  </tr>
                  <tr>
                        <td>성별</td>
                        <td>${user.patGen}</td>
                        <td>나이/몸무게</td>
                        <td>${requestScope.age}/70kg</td>
                  </tr>
                  <tr>
                        <td>전화번호</td>
                        <td>${user.patPhone}</td>
                        <td>혈액형</td>
                        <td>AB형</td>
                  </tr>
                  <tr>
                        <td>주소</td>
                        <td>${user.patAddr}</td>
                        <td>주치의</td>
                        <td><a onclick="docDetail()" href="#">${user.docID}</a></td>
                  </tr>
            </table>
      </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
function docDetail(){
	alert("의사 상세보기 클릭");
	location.href="${context}/doctor.do?action=detail&page=detail&docName=${user.docID}";
}
</script>