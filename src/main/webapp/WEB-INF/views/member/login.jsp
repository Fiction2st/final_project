<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.wrap{
	width: 100%;
	height: 710px;
	position: fixed;
	background-image: url("https://w.wallpaperkiss.com/wimg/s/204-2043478_small.jpg");
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
.dd{
	width:30%; 
	position: absolute;
	top:75%; left:38%;
} 
h1 { color: black; opacity: 0.6;}
td { color: white; font-size: 10pt;}
</style>
<!-- 네이버 로그인 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!--  카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('3b27a86cec9eb1e551a3e9977b220a3d'); //발급 받은 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk 초기화 여부 판단
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  var id = response.id
        	  var session = response.session
 	      	  location.href="/root/member/kakaoLogin?id="+id;
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
</script>
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
				<td><input type="text" id="join" name="id" placeholder="Input ID"></td>
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
</form>
	<div class="cc">
		<hr>   
  		<a onclick="kakaoLogin();">
			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/></a>
 	</div> 

</div>
</body>
</html>