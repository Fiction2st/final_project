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
}

body{ 
	backgorund:black;
}
.wrap {
	width: 100%; height: 1080px; background:black;
}	
.view {
	width: 980px;
	height: 85%;
	margin: 0 auto;
	color: white;
	padding: 1%;
}
.grid-container {
	display: grid;
	grid-template-columns: 300px 300px 300px; /* 행 간격 */
	grid-column-gap: 40px;
	grid-row-gap: 40px;
	/*  background-color: white; */
	margin-top: 15%;
}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../default/header.jsp" />
		<div class="view">
			<c:if test="${hitList.size() == 0 || hitList == null}">
					좋아요를 누른 게시물이 없습니다.
				</c:if>
			<div class="grid-container">
				<c:forEach var="hitImg" items="${hitList}">
					<a href="${contextPath}/board/mypage?writeNo=${hitImg.writeNo}"><img
						src="${contextPath}/board/download?fileName=${hitImg.fileName}"
						width="300" height="300"></a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>