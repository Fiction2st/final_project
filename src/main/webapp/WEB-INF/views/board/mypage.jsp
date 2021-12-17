<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
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
.contentBox { width: 100%; height: 360px;}
table { font-size: 15pt; }
table tr td:nth-child(1) {
	width: 175px; font-weight: bold; height: 30px;
}
table tr td:nth-child(2) {
	width: 325px; word-break: break-all;
}
table.contentData tr:last-child {
	height: 210px; vertical-align: top;
}
table.contentData caption {
	 height: 30px; margin-bottom: 20px;
	 font-weight: bold; font-size: 18pt;
}

div.comment { text-align: right; display: none; }
div.comment a {
	 padding: 3px 7px; color: white; font-size: 13pt;
}
div.comment a:hover {
	 background: gray;
}
.commentGroup { width: 100%; height: 320px; overflow: auto; }
.commentGroup::-webkit-scrollbar {
	width: 5px; /*스크롤바의 너비*/
}
.commentGroup::-webkit-scrollbar-thumb {
	background-color: gray; /*스크롤바의 색상*/
	border-radius: 10px;
}
.commentGroup::-webkit-scrollbar-track {
	background-color: black; /*스크롤바 트랙 색상*/
}
table.commentData { text-align: center; }
/*table.commentData tr td {
	border-bottom: 1px solid #6F6F6F; line-height: 30px;
}*/
table.commentData tr td:nth-child(2) { text-align: left; }

.btnGroup { text-align: center; }
.btn {
	color: black; font-size: 20px; font-weight: bold; background: white;
	display: inline-block; padding: 10px 20px; border-radius: 20px;
}
.btn:hover {
	background: gray; color: white;
}
.onhit { background: gray; color: white; }
.commentWrite { display: none; }
.commentWrite input[type="text"] {
	border: none; border-bottom: 1px solid white;
	background: black; color: white; width: 300px; height: 30px;
	word-break: break-all;
}
.commentWrite a {
	background: white; color: black; padding: 12px 15px;
	border-radius: 10px; font-weight: bold;
}
.commentWrite a:hover {
	background: gray; color: white;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//좋아요
function hit(){
	$.ajax({
		url : "hit",
		type : "get",
		success : function(data){
			$("#hit").text("♥ "+data)
			console.log("성공")
		},
		error : function(){
			alert("문제 발생!")
		}
	})
}
//댓글 리스트
function commentList(){
	$.ajax({
		url : "replyData",
		type : "GET",
		dataType : "json",
		success : function(reply) {
			//console.log(reply)
			let html = ""
			reply.forEach(function(data) {
				html += "<tr><td>" + data.id + "</td>";
				html += "<td>" + data.content + "</td></tr>"
				//html += "<tr><td><b>" + data.id + "</b><br>";
				//html += "<small>" + data.content + "</small></td></tr>"
			})
			//console.log(html)
			$(".commentData").html(html)
		},
		error : function() {
			alert('데이터를 가져올 수 없습니다')
		}
	})
	$(".contentData").hide();
	$(".btnGroup").hide();
	$(".comment").show();
	$(".commentWrite").show();
}
//댓글 창 닫기
function commentClose() {
	$(".contentData").show();
	$(".btnGroup").show();
	$(".comment").hide();
	$(".commentWrite").hide();
}
//댓글 등록
function commentAdd(){
	var no = 41;
	var id = 'jjj';
	var cmt = $("#commentText").val();
	var form = {writeNo : no, id : id, content : cmt}
	console.log(form)
	$.ajax({
		url : "replyAdd", type : "POST",
		data : JSON.stringify(form),
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(result){
			console.log(result);
			if(result == true){
				commentList();
			}else {
				alert('댓글은 100byte까지만 등록 가능합니다.')
			}
			$("#commentText").val("");
		},
		error : function(){
			alert('댓글 등록에 실패하였습니다.');
		}
	})
}
</script>
</head>
<body>
	<div class="swiper">
		<div class="swiper-wrapper">
		<!-- div 파일 갯수만큼 for문 -->
			<c:forEach var="img" items="${myImg}">
				<div class="swiper-slide">
					<img src="${contextPath}/board/download?fileName=${img.fileName}">
				</div>
			</c:forEach>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
	</div>
	
	<div class="content">
		<div class="contentBox">
			<table class="contentData">
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
			<!-- 댓글 화면 -->
			<div class="comment">
				<a onclick='commentClose()' href='javascript:void(0)'>X</a>
				<div class="commentGroup">
					<table class="commentData">
					</table>
				</div>
			</div>
		</div>
		
		<div class="btnGroup">
			<c:if test="${myHit == false}">
				<a onclick="hit()" href="javascript:void(0)" id="hit" class="btn">♥ ${myData.hit}</a>
			</c:if>
			<c:if test="${myHit == true}">
				<a onclick="hit()" href="javascript:void(0)" id="hit" class="btn onhit">♥ ${myData.hit}</a>
			</c:if>
			&nbsp;&nbsp;&nbsp;
			<a onclick="commentList()" href="javascript:void(0)" class="btn">comment</a>&nbsp;&nbsp;&nbsp;
			<a href="${contextPath}/board/main" class="btn">return</a>
		</div>
		<div class="commentWrite">
			<input type="text" id="commentText">&nbsp;&nbsp;
			<a onclick="commentAdd()" href="javascript:void(0)">등록</a>
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
		initialSlide: ${myImg.size()-1}, //슬라이더 시작 위치, 색인 번호
	});
	//swiper 현재 위치 알려줌
	swiper.on('transitionEnd', function() {
		console.log('now index :::', swiper.realIndex);
	});
</script>
</body>
</html>