<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="includes/loginHeader.jsp" %>

<div class="simple-page-form animated flipInY" id="signup-form">
	<h4 class="form-title m-b-xl text-center">회원가입</h4>
	<form method ="post" action="">
		<div class="form-group">
			<input id="mb_id" type="text" name="mb_id" class="form-control" placeholder="아이디">
			<p id="iderrorMsg"></p>
		</div>
		<div class="form-group">
			<input id="mb_pw" type="password" name="mb_pw" class="form-control" placeholder="비밀번호">
		<p id="pwerrorMsg"></p>
		</div>
		<div class="form-group">
			<input id="mb_name" type="text" name="mb_name" class="form-control" placeholder="이름">
			<p id="nameErrorMsg"></p>
		</div>
		
		<div class="form-group">
			<input id="mb_email" type="text" name="mb_email" class="form-control" placeholder="이메일">
		</div>
		<div class="form-group">
			<input id="mb_zipcode" type="text" name="mb_zipcode" class="form-control" placeholder="우편번호">
			<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
		</div>
		
		<div class="form-group">
			<input id="mb_addr" type="text" name="mb_addr"class="form-control" placeholder="주소">
			
		</div>
		<div class="form-group">
			<input id="mb_detailaddr" type="text" name="mb_detailaddr"class="form-control" placeholder="상세주소">
		</div>
		<div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
		<div class="form-group">
			<input id="mb_phone" type="tel" name="mb_phone" class="form-control" placeholder="연락처">
		</div>
		<div class="form-group">
			<input id="mb_birth" type="number"name="mb_birth" class="form-control" placeholder="생년월일">
		</div>
		<div class="form-group">
			<input id="sign-up-genderM" type="radio" name="mb_gender" placeholder="남" value="M" >M
			<input id="sign-up-genderF" type="radio" name="mb_gender" placeholder="여" value="F">F
		</div>
		
	


	<input type="submit" class="btn btn-primary " value="회원가입">
	</form>
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p>
		<small>Do you have an account ?</small>
		<a href="login.jsp"></a>
	</p>
</div><!-- .simple-page-footer -->


	</div><!-- .simple-page-wrap -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mb_zipcode').value = data.zonecode;
                document.getElementById("mb_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mb_detailaddr").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<script>
var pwValidate = -1 ;
$(document).ready(function(){
	$('#mb_id').on("blur",function(){
			let mb_id = $('#mb_id').val().trim();
			if(mb_id == ''){
				$('#iderrorMsg').text('아이디를 입력하셔야합니다.');
				$('#iderrorMsg').css('color','red');
			}else if(mb_id.length < 6 || mb_id.length > 16){
				$('#iderrorMsg').text('아이디를 6~16글자 입력하셔야합니다.');
				$('#iderrorMsg').css('color','red');
			}else{
				$('#iderrorMsg').text('');
				$('#iderrorMsg').css('color','');				
				//Ajax를 이용한 아이디 중복체크	
				 $.ajax({
				        type : "POST",            // HTTP method type(GET, POST) 형식이다.
				        url : "../ajax/ajax.idchkAct.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
				        data : {mb_id:mb_id},            // Json 형식의 데이터이다.
				        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				            // 응답코드 > 0000
				            if(res=='Success'){//사용가능한 아이디입니다.
				            	$('#iderrorMsg').text('사용가능한 아이디입니다..');
								$('#iderrorMsg').css('color','green');
								$('#mb_pw').focus();
				            }else{	//중복된 아이디입니다.
				            	$('#iderrorMsg').text('	중복된 아이디입니다..');
								$('#iderrorMsg').css('color','red');
								$('#mb_id').focus();
				            }
				            //console.log("["+res+"]");
				        },
				        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
				        	console.log("통신 실패.")
				        }
				    });
			}
			//console.log("blur"+ mb_id);		
	});	
	
	$('#mb_pw').on("keyup",function(){
		let mb_pw = $('#mb_pw').val().trim();
		let reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,16}$/;
		//console.log("현재값 :"+pwValidate);
		pwValidate = -1;
		if(mb_pw == ''){
			$('#pwerrorMsg').text('비밀번호를 입력하셔야합니다.');
			$('#pwerrorMsg').css('color','red');
			$('#mb_pw').focus();
		}else if(mb_pw.length < 6 || mb_pw.length > 16){
			$('#pwerrorMsg').text('비밀번호를 6~16글자 입력하셔야합니다.');
			$('#pwerrorMsg').css('color','red');
			$('#mb_pw').focus();		
		}else if(!reg.test(mb_pw)) {
			$('#pwerrorMsg').text('영문자,숫자,특수문자 각 1개이상을 입력하셔야합니다.');
			$('#pwerrorMsg').css('color','red');
		}else {
			$('#pwerrorMsg').text('');
			pwValidate = 0;
		}
	});	//$('#mb_pw').on("keyup",function(){
	
	$('input[type=submit]').on("click",function(e){
		e.preventDefault();
		
		let mb_id = $('#mb_id').val().trim();
		let mb_pw = $('#mb_pw').val().trim();
		let mb_name = $('#mb_name').val().trim();
		let mb_email = $('#mb_email').val().trim();
		let mb_zipcode = $('#mb_zipcode').val().trim();
		let mb_addr = $('#mb_addr').val().trim();
		let mb_detailaddr = $('#mb_detailaddr').val().trim();
		let mb_phone = $('#mb_phone').val().trim();
		let mb_birth = $('#mb_birth').val().trim();
		let mb_gender = $('input[name=mb_gender]:checked').val();
		
		if(mb_id == ''){
			$('#iderrorMsg').text("아이디를 입력하셔야합니다.");
			$('#iderrorMsg').css('color','red');
			$('#mb_id').focus();
		}else if(mb_pw == '' || pwValidate != 0){
			$('#pwerrorMsg').text("비밀번호를 6~16글자 입력하셔야합니다.");
			$('#pwerrorMsg').css('color','red');
			$('#mb_pw').focus();
			$('#mb_pw').select();
		}else if(mb_pw == ''){
			$('#nameErrorMsg').text("이름을 입력하셔야합니다.");
			$('#nameErrorMsg').css('color','red');
			$('#mb_name').focus();
		}else{
			
		//회원가입단추를 제거후 값전송(Ajax)
			//$(this).hide(); //감추기
			//$(this).addClass("disabled"); 클래스 추가
			//$(this).attr("disabled","disabled");//disabled속성에 disabled속성을 넣는다(html)
			$(this).prop("disabled",true);//javascript
			#('form').submit();
			
		}
		//console.log("가입버튼");
	});	//$('input[type=submit]').on("click",function(e)
	
});//$(document).ready(function(){
</script>	
</body>
</html>