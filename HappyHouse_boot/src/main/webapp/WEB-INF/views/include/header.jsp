<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Google Fonts -->
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
    <!-- Favicons -->
  	<link href="${root}/img/favicon.png" rel="icon">
  	<link href="${root}/img/apple-touch-icon.png" rel="apple-touch-icon">
  
    <!-- Vendor CSS Files -->
  	<link href="${root}/vendor/aos/aos.css" rel="stylesheet">
  	<link href="${root}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<link href="${root}/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  	<link href="${root}/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  	<link href="${root}/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  	<link href="${root}/vendor/remixicon/remixicon.css" rel="stylesheet">
  	<link href="${root}/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  	
  	<!-- Vendor JS Files -->
  	<script src="${root}/vendor/purecounter/purecounter.js"></script>
  	<script src="${root}/vendor/aos/aos.js"></script>
  	<script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="${root}/vendor/glightbox/js/glightbox.min.js"></script>
  	<script src="${root}/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  	<script src="${root}/vendor/swiper/swiper-bundle.min.js"></script>
  	<script src="${root}/vendor/php-email-form/validate.js"></script>
  	
  	<!-- Bootstrap CSS Files -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${root}/css/bootstrap.css">
    <link rel="stylesheet" href="${root}/css/apt.css">
        
    <!-- Bootstrap JS File -->
  	<script src="${root}/js/bootstrap.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>