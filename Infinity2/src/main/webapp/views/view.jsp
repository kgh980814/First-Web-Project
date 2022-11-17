<%@page import="java.util.Iterator"%>
<%@page import="model.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%
BoardVO view = (BoardVO) request.getAttribute("view");
List<CommentVO> list = (List<CommentVO>) request.getAttribute("list");
%>
<%@ include file="includes/header.jsp" %>

			<div class="wrap">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">글내용보기</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
								<!-- 설명 -->
							</small>
						</div>
						<form class="form-horizontal">
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">제목:</label>
								<div class="col-sm-9">
									<c:out value="${view.bo_title }"/><%//=view.getBo_title() %>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">작성자:</label>
								<div class="col-sm-9">
									<c:out value="${view.bo_mb_name}"/><%//=view.getBo_mb_name() %>
								</div>
							</div>
							<div class="form-group">
								<label for="textarea1" class="col-sm-2 control-label">내용:</label>
								<div class="col-sm-9">
								<% pageContext.setAttribute("newLineChar", "\n"); %>
									${fn:replace( view.bo_content, newLineChar, "<br>") }
									<%//=view.getBo_content().replace("\r\n", "<br>") %>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">작성일:</label>
								<div class="col-sm-9">
									<c:out value="${view.bo_inputdate}"/><%//=view.getBo_inputdate() %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-7"> 
								</div>
								<div class="col-sm-5">
									<c:if test="${sessionScope.sess_id eq view.bo_mb_id }">
										<a href="Modify?bo_num=<c:out value="${view.bo_num}"/><%//=view.getBo_num() %>" class="btn btn-success">글수정</a>
										<a href="javascript:void(0);" class="btn btn-success" onclick="del()">글삭제</a>
									</c:if> 
									<a href="list.jsp" class="btn btn-success">글목록</a>
								</div>
							</div>
						</form>
						
						<!-- 댓글 시작 -->
						<div>
							<h4 class="widget-title">댓글</h4>
							<form method="post" action="">
							<input type="hidden" name="com_refnum" value="<c:out value="${view.bo_num}"/><%//=view.getBo_num() %>">
								<div class="form-group">
									<input type="text" name="com_content" id="com_content" class="form-control" required="required">
									<div style="text-align:right;">
										<button id="btn_comment" class="btn btn-default">입력</button>
									</div>
								</div>
							</form>
						</div>
						
						<!-- 댓글목록 -->
						<div id="commentList">
<c:set value="0" var="rownum"/>
<c:forEach var="data" items="${list}">												
							<div>
								<div><c:out value="${data.com_mb_name}"/> <%//=data.getCom_mb_name() %> 
								<fmt:formatDate value="${data.com_inputdate}" pattern="yyyy-MM-dd"/><%//=data.getCom_inputdate() %></div>
								<div><c:out value="${data.com_content}"/><%//=data.getCom_content() %></div>
							</div>
							<hr>
</c:forEach>

<c:if test="${rownum ne 0 }">					
							<div>
								<div>등록된 댓글이 없습니다.</div>
							</div>
</c:if>		
						</div>
						<!-- 댓글목록 끝-->
						
						<!-- 댓글 끝 -->
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
<form id="sendfrm" method="post" action="deleteAct.jsp">
<input type="hidden" name="bo_num" value="<%=view.getBo_num() %>">
</form>
<script>
function del(){
	if(confirm("정말로 삭제하시겠습니까????")){
		document.getElementById('sendfrm').submit();
	}
}
</script>		
<%@ include file="includes/footer.jsp" %>



