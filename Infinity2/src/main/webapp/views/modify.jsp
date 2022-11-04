<%@page import="model.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
BoardVO view = (BoardVO)request.getAttribute("view");

%>
<%@ include file="includes/header.jsp"%>

    <div class="wrap">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">수정</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							<!-- 설명 -->
							</small>
						</div>
						
						<form method="post" class="form-horizontal" action="">
						<input type="hidden" name="bo_num" value="<c:out value="${view.bo_num}"/><%//=view.getBo_num()%>">
						<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">카테고리:</label>
								<div class="col-sm-10">
									<select name="bo_category" id="bo_category"class="form-control">
									<!--<c:out value="${paging.p eq 1? 'disabled':''}"/>-->
									<option value="html" <c:out value="${'html' eq (view.bo_category)? 'selected':''}"/>>HTML</option>
									<option value="css" <c:out value="${'css' eq (view.bo_category)? 'selected':''}"/>>CSS</option>
									<option value="js" <c:out value="${'js' eq (view.bo_category)? 'selected':''}"/>>JS</option>
									</select>
								</div>
								</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">제목:</label>
								<div class="col-sm-10">
									<input type="text" name="bo_title" class="form-control" id="bo_title" value=<c:out value="${view.bo_title}"/><%//=view.getBo_title()%> placeholder="제목을 입력하세요">
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-2 control-label">내용:</label>
								<div class="col-sm-10">
									<textarea class="form-control"  name="bo_content" id="bo_content" placeholder="내용을 입력하세요"><c:out value="${view.bo_content}"/><%//=view.getBo_content()%></textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-10 col-sm-offset-2">
									<button type="submit" class="btn btn-success">수정</button>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
			<script>
			$(document).ready(function(){
				$('button[type=submit]').on("click",function(e){
				e.preventDefault();
				
				let bo_num = <c:out value='${view.bo_num}'/><%//=view.getBo_num()%>;
				let bo_category = $('#bo_category').val().trim();
				let bo_title = $('#bo_title').val().trim();
				let bo_content = $('#bo_content ').val().trim();
				
				if(	bo_category	== ''){
					$('#bo_category').css('border','1px solid red');
					
				}else if(bo_title == ''){
					$('#bo_title').css('border','1px solid red');
					$('#bo_title').focus();
				}else if(bo_content == ''){
					$('#bo_content').css('border','1px solid red');
					$('#bo_content').focus();
				}else{
					$('form').submit();
				}
			});	
		});	
			
			</script>
<%@ include file="includes/footer.jsp"%>