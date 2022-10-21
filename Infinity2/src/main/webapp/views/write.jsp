<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>

    <div class="wrap">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">글쓰기</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							<!-- 설명 -->
							</small>
						</div>
						<form method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">카테고리:</label>
								<div class="col-sm-10">
									<select name="bo_category" id="bo_category" class="form-control">
									<option value="">선택</option>
									<option value="html">HTML</option>
									<option value="css">CSS</option>
									<option value="JS">JS</option>
									</select>
									<p id="categoryErrorMsg"></p>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">제목:</label>
								<div class="col-sm-10">
									<input type="text" name="bo_title" class="form-control" id="bo_title" placeholder="제목을 입력하세요">
									<p id="titleErrorMsg"></p>
								</div>
							</div>
						
							<div class="form-group">
								<label for="textarea1" class="col-sm-2 control-label">내용:</label>
								<div class="col-sm-10">
									<textarea name="bo_content" class="form-control" id="bo_content" placeholder="내용을 입력하세요"></textarea>
									<p id="contentErrorMsg"></p>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-10 col-sm-offset-2">
									<button type="submit" class="btn btn-success">글쓰기</button>
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
						$('form').submit();//sumbit 이벤트 생성
					}
				});	
			});	
			</script>

<%@ include file="includes/footer.jsp"%>