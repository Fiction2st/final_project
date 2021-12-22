<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
<style type="text/css">
*{margin : 0;}
body{ 	background-color: black;
}
nav { display: flex; position: fixed;  z-index: 10;}
nav ul { list-style: none; display: flex; justify-content: flex-end; }
nav ul li { margin: 0 3px; display: flex; padding: 10px 10px; }
nav ul li a { text-decoration: none; color: white;}
form {display: flex;}
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
				<c:choose>
					<c:when test="${loginUser != null }">
						<a href="${contextPath }/board/likes">LIKES</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath }/member/register_form">JOIN US</a>
					</c:otherwise>
				</c:choose>
				
			</li> 
			
			<li>
				<c:choose>
					<c:when test="${loginUser != null }">
						<form action="${contextPath }/board/search" method="post">
							<select name="key">
								<option value="country">국가별</option>
								<option value="city">도시별</option>
								<option value="hit">제목별</option>
							</select>

							<div class="input-group">
								<input type="text" name="word" class="form-control"
									placeholder="Search" size="20">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>
					</c:when>
				</c:choose>
			</li>
		</ul>		
	</nav>	
</body>
</html>