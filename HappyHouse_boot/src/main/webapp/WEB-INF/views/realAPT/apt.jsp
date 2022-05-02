<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>아파트 거래정보</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- ======= 페이지 제목 섹션 Start ======= -->
<section class="PageTitle">
	<div class="container">
		<div
			class="section-title pt-3 pb-0 d-flex justify-content-between align-items-center">
			<h2>아파트 거래정보</h2>
			<ol>
				<li><a href="${root}/">Home</a></li>
				<li>아파트 거래정보</li>
			</ol>
		</div>
	</div>
</section>
<!-- 페이지 제목 섹션 End -->

<!-- =======거래정보 Start ======= -->
<section id="pages-details" class="pages-details">
	<div class="container">
		
		<!-- nav start -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded">
			<a class="nav-link" href="#" >동네 정보</a>
		</nav>
		
		<!--  시군구 -->
		<section id="index_section">
			<div class="card col-lg-12 mt-1" style="min-height: 850px;">
				<div class="card-body" style="min-width:500px">
					<div id="map" style="width:100%;height:500px;" class="mb-5"></div>
					<div class="form-group form-inline justify-content-center">
						<select class="form-control col-lg-2 ml-1" id="sido" style="width:140px">
							<option value="0">시도선택</option>
						</select>		
						<select class="form-control col-lg-2 ml-1" id="gugun" style="width:140px">
							<option value="0">구군선택</option>
						</select>	
						<select class="form-control col-lg-2 ml-1" id="dong" style="width:140px">
							<option value="0">동선택</option>
						</select>
						<!-- <button type="button" id="aptSearchBtn">검색</button> -->
					</div>
					<div class="form-group form-inline justify-content-center">
						<input id="aptName" type="text" placeholder="아파트명으로 검색 : 전체" class="form-control mr-2"/>
						<button type="button" id="aptNameSearchBtn" class="btn btn-secondary">검색</button>
					</div>
					
					<table class="table mt-2">
						<colgroup>
							<col width="100">
							<col width="150">
							<col width="*">
							<col width="120">
							<col width="120">
						</colgroup>	
						<thead>
							<tr>
								<th>번호</th>
								<th>아파트이름</th>
								<th class="text-center">주소</th>
								<th>건축연도</th>
								<th>최근거래금액</th>
							</tr>
						</thead>
						<tbody id="searchResult"></tbody>
					</table>
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=caf24fe8a6037056de5ad4da53f8db01&libraries=services"></script>
				<script type="text/javascript" src="js/map.js"></script>
				<script type="text/javascript">
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){					
					$.get(root + "/apt/sido"
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
							});
						}
						, "json"
					);
				});
				$(document).on("change", "#sido", function() {
					$.get(root + "/apt/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get(root + "/apt/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get(root + "/apt/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								$("#searchResult").empty();
								$.each(data, function(index, vo) {
									let str = `
										<tr class="${colorArr[index%3]}">
										<td>${'${vo.aptCode}'}</td>
										<td>${'${vo.aptName}'}</td>
										<td>${'${vo.sidoName}'} ${'${vo.gugunName}'} ${'${vo.dongName}'} ${'${vo.jibun}'}</td>
										<td>${'${vo.buildYear}'}</td>
										<td>${'${vo.recentPrice}'}</td>
										<tr>
									`;
									$("#searchResult").append(str);
					
								});
								displayMarkers(data);
							}
							, "json"
					);
				});				
				$(document).on("click", "#aptNameSearchBtn", function() {
					$.get(root + "/apt/aptName"
							,{dong: $("#dong").val(), aptName:$("#aptName").val()}
							,function(data, status){
								$("#searchResult").empty();
								$.each(data, function(index, vo) {
									let str = `
										<tr class="${colorArr[index%3]}">
										<td>${'${vo.aptCode}'}</td>
										<td>${'${vo.aptName}'}</td>
										<td>${'${vo.sidoName}'} ${'${vo.gugunName}'} ${'${vo.dongName}'} ${'${vo.jibun}'}</td>
										<td>${'${vo.buildYear}'}</td>
										<td>${'${vo.recentPrice}'}</td>
										<tr>
									`;
									$("#searchResult").append(str);
					
								});
								displayMarkers(data);
							}
							, "json"
					);
				});
				/*
				$(document).on("click", "#aptSearchBtn", function() {
					alert("검색");
					var param = {
							serviceKey:' *** APT 상세 매매 정보 API KEY *** ',
							pageNo:encodeURIComponent('1'),
							numOfRows:encodeURIComponent('10'),
							LAWD_CD:encodeURIComponent($("#gugun").val()),
							DEAL_YMD:encodeURIComponent('202110')
					};
					$.get('http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev'
							,param
							,function(data, status){
						console.log(data);
								var items = $(data).find('item');
								var jsonArray = new Array();
								items.each(function() {
									var jsonObj	= new Object();
									jsonObj.aptCode = $(this).find('일련번호').text();
									jsonObj.aptName = $(this).find('아파트').text();
									jsonObj.dongCode = $(this).find('법정동읍면동코드').text();
									//jsonObj.dongName = $(this).find('').text();
									//jsonObj.sidoName = $(this).find('').text();
									//jsonObj.gugunName = $(this).find('').text();
									jsonObj.buildYear = $(this).find('건축년도').text();
									jsonObj.jibun = $(this).find('지번').text();
									jsonObj.recentPirce = $(this).find('거래금액').text();
										
									jsonObj = JSON.stringify(jsonObj);
									//String 형태로 파싱한 객체를 다시 json으로 변환
									jsonArray.push(JSON.parse(jsonObj));
								});
								console.log(jsonArray);
								//displayMarkers(jsonArray);
							}
							, "xml"
					);
					*/
					
					/* var xhr = new XMLHttpRequest();
					var url = 'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';
					var queryParams = '?' + encodeURIComponent('serviceKey') + '='+encodeURIComponent('***  API KEY  ***');
					queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
					queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
					queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent($("#gugun").val()); 
					queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('202110'); 
					xhr.open('GET', url + queryParams);
					xhr.onreadystatechange = function () {
					    if (this.readyState == 4) {
					    	console.log(this.responseXML);
					        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
					    }
					};

					xhr.send(''); */
				//});
				
				
				</script>
				</div>
			</div>
		</section>
		
	</div>
</section>
<!-- 공지사항 detail End -->

<c:if test="${!empty msg}">
	<script>
	alert("${msg}");
	</script>
</c:if>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>