<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> index 페이지 입니다.</h1>
	<h1> 회원가입 후 나오는 메인 페이지 입니다. </h1>
	
	<a href="${contextPath}/member/register_form">회원가입 페이지</a>
</body>
</html>