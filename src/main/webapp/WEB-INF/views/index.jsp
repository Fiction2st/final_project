<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAVE A NICE TRIP!</title>
<style type="text/css">
*{ margin : 0;}
.wrap{
	width: 100%;
	height: 710px;
	position: fixed;
	background-image: url("	https://w.wallpaperkiss.com/wimg/s/204-2043478_small.jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-attachment: fixed; 
}
.cnt{
	width: 40%;
	margin : 0 auto;
}
#t{
	text-align: center;
	font-size: 36pt;
	color: white;
	margin-top : 15%;
	margin-bottom : 10%;
}
#lt{
	text-align: center;
	font-size: 20pt;
	color: white;
	margin-bottom : 10%;
}
#c{
	text-align: center;
	font-size: 12pt;
	color: white;
}
nav { display: flex; }
nav ul { list-style: none; display: flex; justify-content: flex-end; }
nav ul li { margin: 0 3px; padding: 10px 10px; }
nav ul li a { text-decoration: none; color: black; opacity: 0.6; }
nav ul li a { text-decoration: none; color: white; }
</style>
</head>
<body>
<div class="wrap" align="center">
	<c:import url="default/header.jsp"/>
	<div class="back-img">
		<section class="cnt">
			<p id="t">HAVE A NICE TRIP!</p>
			<p id="lt">떠나고 싶은 지역을 검색해보세요</p>
			<hr>
			<p id="c">
				ㅇㅇㅇ로 떠나고 싶으신가요? 여행 경로를 추천해드립니다!<br>
				사용자들에게 인기 있는 여행지는 궁금하지 않으신가요?<br>
				저희가 인기순으로 보여드릴게요! 나만의 여행 일기 페이지를 갖고 싶으시다고요?<br>
				저희 HAVE A NICE TRIP에서 지금 바로 시작하세요!<br>
			</p>
		</section>
	</div>
</div>
</body>
</html>