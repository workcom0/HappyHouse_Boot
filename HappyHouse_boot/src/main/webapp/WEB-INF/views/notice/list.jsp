<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>공지사항</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- ======= 페이지 제목 섹션 Start ======= -->
<section class="PageTitle">
	<div class="container">
		<div
			class="section-title pt-3 pb-0 d-flex justify-content-between align-items-center">
			<h2>공지사항</h2>
			<ol>
				<li><a href="${root}/">Home</a></li>
				<li>공지사항</li>
			</ol>
		</div>
	</div>
</section>
<!-- 페이지 제목 섹션 End -->


<!-- ======= 공지사항 list Start ======= -->
<section id="pages-details" class="pages-details">
	<div class="container">
		<div class="col-lg-10" style="margin: auto">
			<div class="mt-2 mb-2">
				<div class="card-body">
					<div align="right">
						<form name="pageform" id="pageform" method="GET" action="">
							<input type="hidden" name="pg" id="pg" value="">
							<input type="hidden" name="key" id="key" value="${key}">
							<input type="hidden" name="word" id="word" value="${word}">
						</form>
						<form id="searchform" method="get" action="">
							<input type="hidden" name="pg" value="1">
							<select class="form-control mx-1" id="skey" name="key" style="width:100px; display:inline;">
								<option value="all">전체</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select> 
							<input name="word" type="text" id="sword" name="searchWord" class="mx-1" value="${word}"/>
							<button class="btn btn-secondary btn-xs">검색</button>
						</form>
					</div>

					<div class="row" style="width: 100px;">
						<c:if test="${not empty userInfo}">
							<c:if test='${userInfo.name eq "관리자"}'>
								<button type="button" id="mvRegisterBtn" class="btn btn-secondary btn-xs">글쓰기</button>
							</c:if>
						</c:if>
					</div>
					<br>
					
					<table class="table">
						<tr>
							<th style="width:10%">No</th>
							<th style="width:50%">제목</th>
							<th style="width:20%">작성자</th>
							<th style="width:40%">작성일자</th>
						</tr>
						<c:forEach var="notice" items="${noticeList}">
							<tr id="No${notice.articleNo}" class="colored event">
								<td>${notice.articleNo}</td>
								<td>${notice.subject}</td>
								<td>${notice.userId}</td>
								<td>${notice.regTime}</td>
							</tr>
						</c:forEach>
					</table>					
				</div>
			</div>
			<div align="center" class="m-3 row justify-content-center" style="margin: auto">${navigation.navigator}</div>
		</div>
	</div>
</section>
<!-- 공지사항 list End -->


<c:if test="${!empty msg}">
	<script>
	alert("${msg}");
	</script>
</c:if>
<script>
$(document).ready(function () {
	if("${key}")
		$("#skey").val("${key}").prop("selected", true);

	$("#mvRegisterBtn").click(function () {
        location.href = "${root}/notice/register";
    });
	
	$("tr").click(function () {
        $("#searchform").attr("action", "${root}/notice/list").submit();
    });
	
	$(".page-item").click(function() {
		$("#pg").val(($(this).attr("data-pg")));
		$("#pageform").attr("action", "${root}/notice/list").submit();
	});
	
	$("tr[id^='No']").on("click", function(){
		var no = this.id;
		var noticeNo = no.substr(2,);
		location.href = "${root}/notice/get/"+noticeNo;
	});
});
</script>

<style>
tr.colored:hover td{
  background-color:#f3e9e9 !important;
  color:#303f39 !important;
}
</style>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>