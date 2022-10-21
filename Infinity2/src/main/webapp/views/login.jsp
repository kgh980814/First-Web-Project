<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String sess_id= (String) session.getAttribute("sess_id");
//if(sess_id == null || sess_id.equals(""))x
//로그인 했을 때 dashboard.jsp로 이동
if(!(sess_id == null || "".equals(sess_id))){
	response.sendRedirect("Main");
}
%>

<%@ include file="includes/loginHeader.jsp" %>

		<div class="simple-page-form animated flipInY" id="login-form">
	<h4 class="form-title m-b-xl text-center">Sign In With Your Infinity Account</h4>
	<form method="post" action="">
		<div class="form-group">
			<input id="mb_id" type="text" name="mb_id" class="form-control" placeholder="아이디">
		</div>

		<div class="form-group">
			<input id="mb_pw" type="password" name="mb_pw" class="form-control" placeholder="비밀번호">
		</div>

		<div class="form-group m-b-xl">
			<div class="checkbox checkbox-primary">
				<input type="checkbox" id="keep_me_logged_in"/>
				<label for="keep_me_logged_in">Keep me signed in</label>
			</div>
		</div>
		<input type="submit" class="btn btn-primary" value="SING IN">
	</form>
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p><a href="password-forget">비밀번호를 잊으셨나요?</a></p>
	<p>
		<small>계정이 없으신가요 ?</small>
		<a href="Signup">회원가입</a>
	</p>
</div><!-- .simple-page-footer -->

<script>
$(document).ready(function(){
	$("input[type=submit]").on("click",function(e){
		//a태그,폼태그 등의 이벤트를 없애는 것
		e.preventDefault();
		//console.log("login button");
		let mb_id = $('#mb_id').val().trim();
		let mb_pw = $('#mb_pw').val().trim();
		
		if(mb_id == ''){
			alert('아이디를 6~16글자 입력.');
			//return;
		} else if(mb_id.length < 6 || mb_id.length > 16){
			alert('아이디를 6~16글자 입력.');
		} else if(mb_pw == ''){
			alert('비밀번호를 6~16글자 입력.');
		} else if(mb_pw.length < 6 || mb_pw.length > 16){
			alert('비밀번호를 6~16글자 입력.');
		} else{
			$('form').submit();
		}

	});
});

</script>
<%@ include file="includes/loginfooter.jsp" %>