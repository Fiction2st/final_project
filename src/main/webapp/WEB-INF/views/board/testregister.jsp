<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@ include file="../includes/header.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">게시글 등록</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h4 class="m-0 font-weight-bold text-primary">등록</h4>
            </div>
            <div class="card-body">
              	<form role="form" action="/board/register" method="post">
              		<div class="form-group">
              			<label>Title</label>
              			<input class="form-control" name="제목">
              		</div>
              		<div class="form-group">
	              		<label>내용</label>
	              		<textarea class="form-control" rows="10" name="content"></textarea>
	              	</div>
	              	<div class="form-group">
	              		<label>ID</label>
	              		<input class="form-control" name="writer">
	              	</div>
	              	<button type="submit" class="btn btn-primary btn-sm">등록</button>
	              	<button type="reset" class="btn btn-primary btn-sm">취소</button>
              	</form>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

<%@ include file="../includes/footer.jsp" %>
</body>
</html>