<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<!-- ======= 공지사항 detail Start ======= -->
<section id="pages-details" class="pages-details">
	<div class="container">
		<div class="col-lg-6" align="center" style="margin: auto">

			<div class="card-body">
				<div>
					<form id="form" method="post" action="">
					<input type="hidden" name="noticeNo" id="noticeNo" value="${notice.articleNo}"/>
						<table class="table">
							<tr>
								<th style="width:20%; border-right:1px solid #d3d3d3">작성자</th>
								<td>${notice.userId}</td>
							</tr>
							<tr>
								<th style="width:20%; border-right:1px solid #d3d3d3">작성일자</th>
								<td>${notice.regTime}</td>
							</tr>
							<tr>
								<th style="width:20%; border-right:1px solid #d3d3d3">제목</th>
								<td><input type="text" value="${notice.subject}" class="form-control" id="subject" name="subject" required="required" ></td>
							</tr>	
							<tr style="height:200px">
								<th style="width:20%; border-right:1px solid #d3d3d3">내용</th>	
								<td><textarea class="form-control" rows="15" id="content" name="content" required="required">${notice.content}</textarea></td>
							</tr>
						</table>

						<div>
							<c:if test="${not empty userInfo}">
								<c:if test='${userInfo.name eq "관리자"}'>
									<div>
										<button type="button" id="updateNoticeBtn" class="btn btn-secondary m-3">수정</button>
										<button type="button" id="deleteNoticeBtn" class="btn btn-warning">삭제</button>
									</div>
								</c:if>
							</c:if>
							<div class="text-right">
								<a href="${root}/notice/list">목록</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 공지사항 detail End -->


<c:if test="${!empty msg}">
	<script>
	alert("${msg}");
	</script>
</c:if>

<script>
$(document).ready(function () {	
	$("#updateNoticeBtn").click(function () {
		var no = document.getElementById("noticeNo").value;
        $("#form").attr("action", "${root}/notice/update/"+no).submit();
    });
	
	$("#deleteNoticeBtn").click(function () {
		var no = document.getElementById("noticeNo").value;
        $("#form").attr("action", "${root}/notice/delete/"+no).submit();
    });
});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>