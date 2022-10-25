<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<table class="table" id="crew">
					<tr>
						<th>#</th><th>항목1</th><th>항목2</th><th></th>
					</tr>
					
					<tr>
						<td>1</td>
						<td><input class ="form-control"></td>
						<td><input class ="form-control"></td>
						<td><button type="button" id=""class="btn btn-default"onclick="addItem(this)">+</button>
						<button type="button" id="" class="btn btn-default"onclick="delItem(this)">-</button></td>
					</tr>
				</table>
				</form>
			</div><!-- .widget-body -->
		</div><!-- .widget -->
	</div><!-- END column -->
<script>
function delItem(t){
	let len =$('#crew tr').length;
	if(len > 2){
		$(t).parent().parent().remove();
		let html = "";
 		html += '<button type="button" id=""class="btn btn-default" onclick="addItem(this)">+</button>';
		html += '<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button>';
		//console.log(len);
		$("#crew > tbody > tr:nth-child("+(len-1)+") > td:nth-child(4)").append(html); 
	}
}
function addItem(t){
	
	
	$(t).parent().empty();
	let len = $('#crew tr').length;
	
	console.log(len);
	
	let html = "";
	html += '<tr>';
	html += '<td>'+len+'</td>';
	html += '<td><input class ="form-control"></td>';
	html += '<td><input class ="form-control"></td>';
	html += '<td><button type="button" id=""class="btn btn-default" onclick="addItem(this)">+</button>';
	html += '<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button></td>';
	html += '</tr>'; 	
	$('#crew:last').append(html);
}

$(document).ready(function(){
//오늘 사용안함
});
</script>
<%@ include file="includes/footer.jsp"%>
