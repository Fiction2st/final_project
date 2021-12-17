<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH</title>
<style type="text/css">
*{margin: 0;}
.wrap {
	width: 100%; height: 710px;
	background-color: black;
}
header{
	width: 100%; height: 20%;
}
.view{
	width: 70%; height: 70%; margin:0 auto; display:flex;
}
.tab{ order:1;	width: 10%; height: 100%; yellow; border: white 1px solid; }
.content{ order:2;	width: 90%; height: 100%;  border: white 1px solid;}
.td { color: white;}
</style>
</head>
<body>
<div class="wrap">
	<header>
		<c:import url="../default/header.jsp"/>
	</header>

	<div class="view">
		<div class="tab">
		<a href="#" style="color:white; align:center;">나라</a>
		</div>
		<div class="content">
  	
 		<c:if test="${filelist.size() == 0 }">
			검색 결과가 없습니다.
		</c:if>
 
		<table>
			<c:forEach var="dto" items="${filelist }">
				<tr>
					<td>${dto.writeNo }</td>
					<td>${dto.fileName}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</div>
</body>
</html>