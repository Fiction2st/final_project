<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { margin: 0; }
body { background-color: rgb(63,59,58); }
#wrap {
	width: 1700px; margin: 0 auto; height: 1080px; 
}
img { width: 100%; position: static; }

span {
	position: relative; color: red; font-weight: bold;
	top: -250px; left: 450px; font-size: 30pt;
}
div.tag {
	background-color: black; border-radius: 10px;
	width: 100px; height: 150px; z-index: 11;
	position: relative; top: -350px; left: 500px;
	text-align: center; padding: 10px; color: white;
}
hr {
	color: black; width: 100px;
	position: relative; top: -300px; left: 440px;
	transform: rotate(135deg);
}
/*팝업창*/
#wrap2 { /*배경 어둡게*/
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	position: fixed;
	z-index: 20;
	margin: 0 auto; top: 0; left: 0; right: 0;
	width: 100%; height: 100%;
}
#write {/*팝업창*/
	width: 600px; height: 500px; margin: 0 auto;
	background: #EAEAEA; z-index: 10;
	position: fixed;
	top: 150px; left: 0; right: 0;
}

</style>
</head>
<body>
<div id="wrap">
	<img src="../resources/세계지도.svg">
	
	<span>.</span>
	<hr>
	<div class="tag">
		<h3>NAME</h3><br>
		<div>
			2012/america
		</div>
	</div>
</div>
<div id="wrap2">
	<div id="write">
		
	</div>
</div>
</body>
</html>