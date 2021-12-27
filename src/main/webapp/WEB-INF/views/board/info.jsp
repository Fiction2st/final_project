<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${ info}" var="info"> 
   
   ${ info.id}
   ${ info.saveDate}
   ${ info.city}
   ${ info.country}
   <hr>
   <c:if test="${ info.country=='한국'}">
      날짜 : ${ info.saveDate}
   </c:if>
   <hr>
</c:forEach>


</body>
</html>