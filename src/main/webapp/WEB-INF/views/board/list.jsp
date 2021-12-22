<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../includes/header.jsp" %>

               <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Board</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h4 class="m-0 font-weight-bold text-primary">List 
                <a href="/board/register" class="btn btn-primary btn-sm float-right">글쓰기</a>
              </h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>수정일</th>
                    </tr>
                  </thead>
                  
                  <!-- 테이블 내용 ------------------------->
                  // BoardController 에서 list 로 보냈으므로 list 로 받기
                  <c:forEach items="${list}" var="board">
                  <tr>
                  	<td>
                  		<c:out value="${board.writeNo }" />
                  	</td>
                  	<td>
                  		<a href='/board/get?writeNo=<c:out value="${board.writeNo }" />'>
                  			<c:out value="${board.title }" />
                  		</a>
                  	</td>
                  	<td>
                  		<c:out value="${board.id }" />
                  	</td>
                  	<td>
                  		<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
                  	</td>
                  	<td>
                  		<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" />
                  	</td>
                  </tr>
                  </c:forEach>
                  
                  <!-- 테이블 내용 ----->
                </table>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <%@ include file = "../includes/footer.jsp" %>
</html>