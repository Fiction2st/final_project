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
<form method="post" action="${contextPath}/board/registerSave"
			enctype="multipart/form-data">
			<b>작성자</b><br>
			<!-- readonly : 읽기 전용 -->
			<input type="text" name="id" value="${loginUser }" readonly />
			<hr>
			
			<b>제목</b> <br>
			<input type="text" size="50" name="title" />
			<hr>
			<hr>
			
			<b>나라</b> <br>
			<input type="text" size="50" name="country" />
			<hr>
			<hr>
			
			<b>도시</b> <br>
			<input type="text" size="50" name="city" />
			<hr>
			
			<b>등록일</b> <br>
			<input type="text" size="50" name="saveDate" />
			<hr>
			<b>내용</b> <br>
			<textarea name="content" rows="10" cols="50"></textarea>
			<hr>
			<!-- 파일을 선택하면 onchange가 작동하고 input 자체(파일에 대한 값)를 readURL에 넘겨주겟다. -->
			<b>이미지파일 첨부</b><br>
				<input type="file" name="file_name" onchange="readURL(this);"  multiple="multiple"/>
				<img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다" />
			<hr>
			<input type="submit" value="글쓰기" />
			<input type=button value="목록보기" onClick="location.href='${contextPath}/board/list'">
		</form>
</body>
</html>