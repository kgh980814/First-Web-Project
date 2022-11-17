<%@page import="model.PagingDTO"%>
<%@page import="model.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="includes/header.jsp"%>
 <%
List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
PagingDTO paging =(PagingDTO)request.getAttribute("paging");
%> 
 <style>
 .wrap {
 padding-bottom:1.5rem;
 }
 </style>
  <div class="wrap">
	<section class="app-content">
		<div class="row">
				<div class="col-md-12">
				${paging.p}/${paging.totalPage}
					<div class="mail-toolbar m-b-lg pull-right">
					
						<div class="btn-group"  id="btn_group"role="group">
							<a href="?p=1" class="btn btn-default <c:out value="${paging.p eq 1? 'disabled':''}"/><%//=(paging.getP() == 1)?"disabled":"" %>"><i class="fa fa-backward"></i></a>
							<a href="?p=${paging.p-1}" class="btn btn-default  <c:out value="${paging.p eq 1? 'disabled':''}"/><%//=(paging.getP() == 1)?"disabled":"" %>"><i class="fa fa-chevron-left"></i></a>
							<a href="?p=${paging.p+1}" class="btn btn-default  <c:out value="${paging.totalPage eq 1? 'disabled':''}"/><%//=(paging.getP() == paging.getTotalPage())?"disabled":"" %>"><i class="fa fa-chevron-right"></i></a>
							<a href="?p=${paging.totalPage}" class="btn btn-default<c:out value="${paging.totalPage eq 1? 'disabled':''}"/> <%//=(paging.getP() == paging.getTotalPage())?"disabled":"" %>"><i class="fa fa-forward"></i></a>
						</div>								
					
						<div class="btn-group " role="group">
							<a href="Write" class="btn btn-default">글쓰기</a>
						</div>


					</div>
				</div>
		</div>
			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">게시판</h4>
					<p class="m-b-lg docs">
					</p>
					<div class="table-responsive">
						<table class="table">
<c:set value="${paging.total-((paging.p-1)*paging.pageRow)}" var="rowNum"/>
<c:forEach var="data" items="${list}">


							<tr>
								<td><c:out value="${rowNum}"/><%//=rowNum--%>.
								<a href="View?bo_num=<c:out value="${data.bo_num}"/><%//=data.getBo_num()%>">
								<c:out value="${data.bo_title}"/><%//=data.getBo_title()%></a></td>

						
								<td align="right"><fmt:formatDate value="${data.bo_inputdate}" pattern="yyyy-MM-dd"/><%//=data.getBo_inputdate() %></td>
							</tr>
							<c:set value="${rowNum-1}" var="rowNum"></c:set>
</c:forEach>		
	
<c:if test="${num eq 0 }">
							<tr>
								<td colspan="2">등록된 글이 없습니다.</td>
							</tr>
</c:if>
						</table>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->
<!-- END .gallery -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->
<script>

	
</script>
<%@ include file="includes/footer.jsp"%>