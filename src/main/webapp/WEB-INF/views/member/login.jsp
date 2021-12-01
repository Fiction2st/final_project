<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 카카오 스크립트 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

Kakao.init('3b27a86cec9eb1e551a3e9977b220a3d');// sdk 초기화
console.log(Kakao.isInitialized()); // sdk 초기화 여부 판단

//카카오 로그인
/*
function kakaoLogin() {
	Kakao.Auth.login({
//		scope : 'profile_nickname, age_range', // 가져올 사용자 정보 목록
		success : function(response) {
			Kakao.API.request({
				url : '/v2/user/me',
				success : function(response) {
					console.log(response)
					var id = response.properties.nickname;
					$('body').append(id);
				},
				fail : function(error) {
					console.log(error)
				},
			})
		},	
	})
	
}
*/
</script>
<style type="text/css">
.wrap{
	width: 100%;
	height: 710px;
	position: fixed;
	background-image: url("https://p1.pxfuel.com/preview/880/413/140/mountain-nature-monolithic-part-of-the-waters-lake-travel-norway.jpg");
/* 
	https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80
	https://p1.pxfuel.com/preview/880/413/140/mountain-nature-monolithic-part-of-the-waters-lake-travel-norway.jpg	
*/	
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-attachment: fixed; 
}
.aa{
	width:30%;
	position: absolute;
	top:35%; left:38%;
}
.bb{
	width:100%; height:100%;
	position: absolute;
	top:50%; left:50%;
}
.cc{
	width:30%; 
	position: absolute;
	top:65%; left:38%;
} 
h1 { color: black; opacity: 0.6;}
td { color: white; font-size: 10pt;}
</style>
<title>LOGIN</title>
</head>
<body>
<div class="wrap" >
	<c:import url="../default/header.jsp"/>
	<div class="aa">
		<h1>LOGIN</h1>
		<hr>
	</div>
	<form action="loginCheck" method="post">
	<div class="bb">	
		<table>
			<tr>
				<td><input type="text" name="id" placeholder="Input ID"></td>
				<td rowspan="2"><input type="submit" value="로그인" style="width:50px; height:50px;"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" placeholder="Input Password"></td>
			</tr>
			<tr>
				<td colspan="2"><label><input type="checkbox" name="autoLogin">Auto Login</label></td>
			</tr>
		</table>
	</div>
	<div class="cc">
		<hr>   
      		<a href="https://kauth.kakao.com/oauth/authorize?client_id={3aa3056e72ad281ec710ed25d5116a7a}&redirect_uri={http://localhost:8085/kakaoLogin}&response_type=code">
				<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"width="222"/>				
			</a>
 	</div>
	</form>
</div>	
</body>
</html>