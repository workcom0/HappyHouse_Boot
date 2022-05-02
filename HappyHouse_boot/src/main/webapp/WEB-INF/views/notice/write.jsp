<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>공지사항 글쓰기</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- ======= 페이지 제목 섹션 Start ======= -->
<section class="PageTitle">
	<div class="container">
		<div
			class="section-title pt-3 pb-0 d-flex justify-content-between align-items-center">
			<h2>공지사항-글쓰기</h2>
			<ol>
				<li><a href="${root}/">Home</a></li>
				<li>공지사항-글쓰기</li>
			</ol>
		</div>
	</div>
</section>
<!-- 페이지 제목 섹션 End -->

<!-- ======= 공지사항 write Start ======= -->
<section id="pages-details" class="pages-details">
	<div class="container">
		<div class="col-lg-6" align="center" style="margin:auto">
			<h3>공지사항 등록</h3>
			<form id="form" method="post" action="">
				<div class="form-group mb-3 mt-3" align="left">
					<label for="subject"></label> 
					<input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력해 주세요." required="required">
				</div>
				<div class="form-group mb-3" align="left">
					<label for="content"></label>
					<textarea class="form-control" rows="15" id="content" name="content" placeholder="내용을 입력해 주세요." required="required"></textarea>
				</div>
				<div>
					<button type="reset" class="btn btn-secondary  m-3">취소</button>
					<button type="button" id="registNoticeBtn" class="btn btn-warning">글작성</button>
				</div>		
			</form>
		</div>
	</div>
</section>
<!-- 공지사항 write End -->

<script>
$(document).ready(function () {
	$("#registNoticeBtn").click(function () {
        $("#form").attr("action", "${root}/notice/write").submit();
    });
});
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>