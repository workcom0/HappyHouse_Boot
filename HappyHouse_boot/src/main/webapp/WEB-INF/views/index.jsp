<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>home</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- ======= index Start ======= -->
<section id="index" class="d-flex align-items-center justify-content-center">
    <div class="container" data-aos="fade-up">
	  
	  <!-- 대문 글 Start -->
      <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
        <div class="col-xl-8 col-lg-8">
          <h1>Welcome to <span>Happy House</span>!</h1>
          <h2>부동산 실거래가 검색을 간편하게 해보세요!</h2>
        </div>
      </div>
      <!-- 대문 글 End -->

	  <!-- 바로가기 버튼 Start -->
      <div class="row gy-4 mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="ri-store-line"></i>
            <h3><a href="#">About</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="ri-bar-chart-box-line"></i>
            <h3><a href="#">공지사항</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="ri-calendar-todo-line"></i>
            <h3><a href="#">거래가검색</a></h3>
          </div>
        </div>
       </div>
       <!-- 바로가기 버튼 End -->
       
    </div>
</section>
<!-- index End -->

<script>
$(document).ready(function () {		
	var msg = "${msg}";
	if(msg!=null && msg!=""){
		alert("${msg}");
	}
});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>