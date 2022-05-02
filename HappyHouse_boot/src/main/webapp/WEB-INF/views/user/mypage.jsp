<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>마이페이지</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- ======= 페이지 제목 섹션 Start ======= -->
<section class="PageTitle">
	<div class="container">
		<div
			class="section-title pt-3 pb-0 d-flex justify-content-between align-items-center">
			<h2>마이페이지</h2>
			<ol>
				<li><a href="${root}/">Home</a></li>
				<li>마이페이지</li>
			</ol>
		</div>
	</div>
</section>
<!-- 페이지 제목 섹션 End -->

<!-- ======= 로그인  섹션 Start ======= -->
<section id="pages-details" class="pages-details">
	<div class="container">
		<div class="row gy-4 justify-content-center">
			<div class="col-lg-8 pages-details-info p-3">
				<form id="form" action="" method="Post" class="bg-white rounded shadow-5-strong p-5">
					<div class="row">
						<div class="mb-3">
							<label for="id">아이디</label> 
							<input type="text" class="form-control" id="id" name="id" placeholder="" value="${userInfo.id}" readonly="readonly">
						</div>
						<div class="mb-3">
							<label for="pw">비밀번호<span style="color: red;"> *</span></label>
							<input type="password" class="form-control" id="pw" name="pw" value="${userInfo.pw}" required>
						
						</div>
						<div class="mb-3">
							<label for="name">이름<span style="color: red;"> *</span></label> 
							<input type="text" class="form-control" id="name" name="name" value="${userInfo.name}" required>
							
						</div>
						<div class="mb-3">
							<label for="email">e-mail<span style="color: red;"> *</span></label>
							<input type="email" class="form-control" id="email" name="email" value="${userInfo.email}" required>
							
						</div>
						<div class="mb-3">
							<label for="phone">전화번호<span style="color: red;"> *</span></label> 
							<input type="text" class="form-control" id="phone" name="phone" value="${userInfo.phone}" required>
							
						</div>
					</div>
					<div class="d-grid gap-2 d-flex flex-row justify-content-between">
						<button type="button" id="deleteBtn" class="btn btn-secondary">탈퇴하기</button>
						<button type="button" id="updateBtn" class="btn btn-warning">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- 로그인  섹션 End -->

<script>
	$(document).ready(function () {		
		var msg = "${msg}";
		if(msg!=null && msg!=""){
			alert("${msg}");
		}
		
		$("#deleteBtn").click(function () {
			$("#form").attr("action", "${root}/deleteMember").submit();
        });
		
		$("#updateBtn").click(function () {
			$("#form").attr("action", "${root}/updateMember").submit();
        });
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>