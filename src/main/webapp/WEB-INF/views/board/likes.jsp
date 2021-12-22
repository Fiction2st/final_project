<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likes</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.wrap {
	width: 100%;
	background-color: black;
}

header {
	width: 100%;
	height: 20%;
}
.section1{
	width:75%;
	height:10%;
	padding: 7% 0% 0% 15%;	
	color: white;
}
.view {
	width: 75%;
	height: 85%;
	margin: 0 auto;
	padding: 1%;
	color: white;

}

.grid-container {
	display: grid;
	grid-template-columns: 150px 150px 150px 150px 150px; /* 행 간격 */
	grid-column-gap: 10px;
	grid-row-gap: 10px;
	/*  background-color: white; */
	padding: 10px;
}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<c:import url="../default/header.jsp" />
		</header>
		<div class="section1">
			<h1>좋아요 목록</h1>
		</div>
		<div class="view">
			<c:if test="${hitList.size() == 0 || hitList == null}">
					좋아요를 누른 게시물이 없습니다.
				</c:if>
			<div class="grid-container">
				<c:forEach var="hitImg" items="${hitList}">
					<a href="${contextPath}/board/mypage?writeNo=${hitImg.writeNo}"><img
						src="${contextPath}/board/download?fileName=${hitImg.fileName}"
						width="150" height="150"></a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>