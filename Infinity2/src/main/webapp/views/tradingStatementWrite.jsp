<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
    <div class="wrap">
		<div class="widget">
			<header class="widget-header">
				<h4 class="widget-title">거래명세서</h4>
			</header><!-- .widget-header -->
			<hr class="widget-separator">
			<div class="widget-body">
				<div class="m-b-lg">
					<small>
							<!-- 설명 -->
					</small>
				</div>
				<form method="post" class="form-horizontal" action="">
				<label>공급받는자</label>
				<input type ="text"  name="tra_account" id="tra_account" class ="form-control">
				<table class="table" id="crew">
					<tr>
						<th>월일</th><th>품목</th><th>규격</th><th>수량</th><th>단가</th><th>공급가액</th><th>세액</th><th>비고</th><th></th><!-- +-시켜주는거 -->
					</tr>
					
					<tr>						
						<td><input type="date" name="tradingDate" id="tradingDate0"class ="form-control"></td>
						<td><input type="text" name="subject" id="subject0"class ="form-control"></td>
						<td><input type="text" name="standard" id="standard0"class ="form-control"></td>
						<td><input type="number" name="quantity" id="quantity0"class ="form-control" onchange="assignment(0);"></td>
						<td><input type="number" name="unitPrice" id="unitPrice0"class ="form-control" onchange="assignment(0);"></td>
						<td><input type="number" name="supplyPrice" id="supplyPrice0"class ="form-control"></td>
						<td><input type="number" name="taxAmount" id="taxAmount0"class ="form-control"></td>
						<td><input type="text" name="ect" id="ect0"class ="form-control"></td>
						<td><button type="button" id=""class="btn btn-default"onclick="addItem(this)">+</button>
						<button type="button" id="" class="btn btn-default"onclick="delItem(this)">-</button></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-default" >거래명세서 등록</button>
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
	html += '<td><input type="date" name="tradingDate" id="tradingDate'+len+'" class="form-control"></td>';
	html += '<td><input type="text" name="subject" id="subject'+len+'" class="form-control"></td>';
	html += '<td><input type="text" name="standard" id="standard'+len+'" class="form-control"></td>';
	html += '<td><input type="number" name="quantity" id="quantity'+len+'" class="form-control" onchange="assignment('+len+');" ></td>';
	html += '<td><input type="number" name="unitPrice" id="unitPrice'+len+'" class="form-control" onchange="assignment('+len+');"></td>';
	html += '<td><input type="number" name="supplyPrice" id="supplyPrice'+len+'" class="form-control"></td>';
	html += '<td><input type="number" name="taxAmount" id="taxAmount'+len+'" class="form-control"></td>';
	html += '<td><input type="text" name="ect" id="ect'+len+'" class="form-control"></td>';
	html += '<td><button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>';
	html += '<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button></td>';
	html += '</tr>';
	
	
	
	
	
	$('#crew:last').append(html);
}
function assignment(target){
	$("#supplyPrice"+target).val($("#quantity"+target).val() * $("#unitPrice"+target).val());
	$("#taxAmount"+target).val($("#supplyPrice"+target).val() * 0.1);
}

$(document).ready(function(){
//오늘 사용안함
});
</script>
<%@ include file="includes/footer.jsp"%>