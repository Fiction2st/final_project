<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function submit(){
	submit(country);
}
</script>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
*{margin : 0;}
nav { display: flex; position: fixed;  z-index: 10;}
nav ul { list-style: none; display: flex; justify-content: flex-end; }
nav ul li { margin: 0 3px; padding: 10px 10px; }
nav ul li a { text-decoration: none; color: white;}
.search {
	align: center;
}
</style>
</head>
<body>

	<nav>
		<ul>
			<li><a href="${contextPath }/index">HOME</a></li>
		
			<li>
				<c:choose>
					<c:when test="${loginUser != null }">
						<a href="${contextPath }/member/logout">LOGOUT</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath }/member/login">LOGIN</a>
					</c:otherwise>
				</c:choose>
			</li>
						
			<li>
				<a href="${contextPath }/">JOIN US</a>
			</li> 
			
			<li class="search">
				<c:choose>
					<c:when test="${loginUser != null }">
						<form action="board/search" method="post">
						<input type="text" id="country" name="country" width="40">
							<button type="submit">
								<img
									src="https://img.lovepik.com/original_origin_pic/19/01/07/f4d522e5616a84704ba33c88addec54f.png_wh300.png"
									width="25" />
							</button>
						</form>
					</c:when>
				</c:choose>
			</li>
		</ul>		
	</nav>	
</body>
</html>