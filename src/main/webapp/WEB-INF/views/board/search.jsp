<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
*{margin: 0;}
body{backgorund:black;}
.wrap {
	width: 100%; height: 1080px; background: black;
}
.view {
	width: 980px;
	height: 85%;
	padding: 1%;
	margin: 0 auto;
	color: white;
}
.grid-container {
	display: grid;
	grid-template-columns: 300px 300px 300px; /* 행 간격 */
	grid-column-gap: 40px;
	grid-row-gap: 40px;
	margin-top: 15%;
}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../default/header.jsp" />
		<div class="view">		
				<c:if test="${filelist.size() == 0 || filelist == null}">
					검색 결과가 없습니다.
				</c:if>
				<div class="grid-container">
					<c:forEach var="dto" items="${filelist }">
						<a href="${contextPath}/board/mypage?writeNo=${dto.writeNo}"><img width="300" height="300"
							src="${contextPath}/board/download?fileName=${dto.fileName}">
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
</body>
</html>