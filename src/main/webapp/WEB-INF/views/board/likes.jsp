<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likes</title>
<style type="text/css">
* { margin: 0; padding: 0; }
#wrap { width: 1220px; margin: 0 auto; }
</style>
</head>
<body>
<div id="wrap">
	<c:forEach var="hitImg" items="${hitList}">
		<img src="${contextPath}/board/download?fileName=${hitImg.fileName}" width="400px" height="400px">
	</c:forEach>
</div>
</body>
</html>