<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- ======= Header Start======= -->
<header id="header" class="fixed-top header-inner-pages">
  <div class="container d-flex align-items-center justify-content-lg-between">
      <h1 class="logo me-auto me-lg-0"><a href="${root}/">Happy House<span>.</span></a></h1>
     
      <!-- navBar Start -->
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto" href="${root}/">Home</a></li>
          <li><a class="nav-link scrollto" href="#">소개</a></li>
          <li><a class="nav-link scrollto" href="${root}/notice/list?pg=1&key=&word=">공지사항</a></li>
          <li><a class="nav-link scrollto " href="${root}/apt">거래가검색</a></li>
		  <c:if test="${!empty userInfo}">
			  <li class="dropdown"><a href="${root}/mypage"><span>마이페이지</span> <i class="bi bi-chevron-down"></i></a>
		          <ul>
		             <li><a href="${root}/mypage">나의정보관리</a></li>
		             <li><a href="#">관심지역설정</a></li>
		             <li><a href="#">회원탈퇴</a></li>
		          </ul>
		      </li>
		  </c:if>          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
	  <!-- navBar End -->

	  <!-- 로그인/로그아웃 버튼 Start -->
	  <c:if test="${empty userInfo}">
		   <a href="${root}/login" class="get-started-btn scrollto">로그인</a>
	  </c:if>
	  <c:if test="${!empty userInfo}">
		   <a href="${root}/logout" class="get-started-btn scrollto">로그아웃</a>
	  </c:if>
	  <!-- 로그인/로그아웃 버튼 End -->
	  
  </div>
</header>  
<!-- Header End -->