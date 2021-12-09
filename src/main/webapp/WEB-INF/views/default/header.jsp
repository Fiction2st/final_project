<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
nav { display: flex; position: fixed;}
nav ul { list-style: none; display: flex; justify-content: flex-end; }
nav ul li { margin: 0 3px; padding: 10px 10px; }
nav ul li a { text-decoration: none; color: black; opacity: 0.6;}
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
		</ul>		
	</nav>	

</body>
</html>