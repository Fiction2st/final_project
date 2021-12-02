<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<style type="text/css">
*{
	margin: 0; padding: 0; text-decoration: none;
}
body {
	background: #000;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	display: flex;
	justify-content: center; /* 좌우 기준 중앙정렬 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	min-height: 110vh;
}

.swiper {
	width: 100%;
	padding-top: 50px;
	padding-bottom: 200px;
}
.swiper-slide {
	background-position: center;
	background-size: cover;
	width: 400px;
	height: 400px;
	background: #fff;
	/*
	-webkit-box-reflect: below 1px linear-gradient(transparent, transparent, #0006);
	*/
}
img {
	width: 100%; height: 100%; border-radius: 10px;
}

.content {
	width: 500px; height: 400px; color: white; background: black;
	position: relative; left: -270px; top: -75px; z-index: 10;
	padding: 25px; box-shadow: 0 0 30px gray;
}
table { font-size: 15pt; }
table tr td:nth-child(1) {
	width: 35%; font-weight: bold; height: 30px;
}
table tr td:nth-child(2) {
	width: 65%;  word-break: break-all;
}
table tr:last-child {
	height: 210px; vertical-align: top;
}
table caption {
	 height: 30px; margin-bottom: 20px;
	 font-weight: bold; font-size: 18pt;
}

.btnGroup { text-align: center; }
.btn {
	color: black; font-size: 20px; font-weight: bold; background: white;
	display: inline-block; padding: 10px 20px; border-radius: 20px;
}
.btn:hover {
	background: gray; color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//파일 갯수 알아와서 색인번호로 넣기
//좋아요
function upHit(){
	$.ajax({
		url : "hit", type : "get",
		success : function(data){
			$("#hit").text(data)
			console.log("성공")
		},
		error : function(){
			alert("문제 발생!")
		}
	})
}

//댓글

</script>
</head>
<body>
	<div class="swiper">
		<div class="swiper-wrapper">
		<!-- div 파일 갯수만큼 for문 -->
			<div class="swiper-slide">
				<img alt="1" src="../resources/최근상품01.jpg">
			</div>
			<div class="swiper-slide">
				<img alt="2" src="../resources/최근상품02.jpg">
			</div>
			<div class="swiper-slide">
				<img alt="3" src="../resources/최근상품03.jpg">
			</div>
			<div class="swiper-slide">
				<img alt="4" src="../resources/최근상품04.jpg">
			</div>
			<div class="swiper-slide">
				<img alt="5" src="../resources/최근상품05.jpg">
			</div>
			<div class="swiper-slide">
				<img alt="6" src="../resources/최근상품06.jpg">
			</div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
	</div>
	
	<div class="content">
		<table>
			<caption>${myData.country}</caption>
			<tr>
				<td>CITY</td> <td>${myData.city}</td>
			</tr>
			<tr>
				<td>DATE</td> <td>${myData.saveDate}</td>
			</tr>
			<tr>
				<td>TITLE</td> <td>${myData.title}</td>
			</tr>
			<tr>
				<td>CONTENT</td> <td>${myData.content}</td>
			</tr>
		</table>
		<!-- 댓글 화면 추가 -->
		<div class="btnGroup">
			<a onclick="upHit()" id="hit" class="btn">♥ 1</a>&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn">comment</a>&nbsp;&nbsp;&nbsp;
			<a href="${contextPath}/board/main" class="btn">return</a>
		</div>
	</div>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	var swiper = new Swiper(".swiper", {
		effect : "coverflow",
		grabCursor : true,
		centeredSlides : true,
		slidesPerView : 3,
		coverflowEffect : {
			rotate : 10,// 슬라이더 회전 각 : 클수록 슬라이딩시 회전이 커짐
			stretch : 200,// 슬라이더간 거리(픽셀) : 클수록 슬라이더가 서로 많이 겹침
			depth : 200,// 깊이 효과값 : 클수록 멀리있는 느낌이 강해짐
			modifier : 1,// 효과 배수 : 위 숫자값들에 이 값을 곱하기 처리하여 효과를 강하게 처리함
			slideShadows : true,
		},
		//loop : true,
		initialSlide: 5, //슬라이더 시작 위치, 색인 번호
	});
	//swiper 현재 위치 알려줌
	swiper.on('transitionEnd', function() {
		console.log('now index :::', swiper.realIndex);
	});
</script>
</body>
</html>