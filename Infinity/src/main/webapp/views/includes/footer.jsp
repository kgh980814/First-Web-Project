<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- APP FOOTER -->
  <div class="wrap p-t-0">
    <footer class="app-footer">
      <div class="clearfix">
      <ul class="copyright pull-right">
    	<li><a href="jvavascript:void(0)"><b>개인정보처리방침</b></a></li>
    	</ul>
        <div class="copyright pull-left">Copyright Naver 2022 &copy;</div>
        
      </div>
    </footer>
  </div>
  <!-- /#app-footer -->
</main>
<!--========== END app main -->


	<!-- build:js ../assets/js/core.min.js -->
	
	<script src="../libs/bower/jquery-ui/jquery-ui.min.js"></script>
	<script src="../libs/bower/jQuery-Storage-API/jquery.storageapi.min.js"></script>
	<script src="../libs/bower/bootstrap-sass/assets/javascripts/bootstrap.js"></script>
	<script src="../libs/bower/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="../libs/bower/perfect-scrollbar/js/perfect-scrollbar.jquery.js"></script>
	<script src="../libs/bower/PACE/pace.min.js"></script>
	<!-- endbuild -->

	<!-- build:js ../assets/js/app.min.js -->
	<script src="../assets/js/library.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/app.js"></script>
	<!-- endbuild -->
	<script src="../libs/bower/moment/moment.js"></script>
	<script src="../libs/bower/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="../assets/js/fullcalendar.js"></script>
	<div id="layer" style = "position:absolute; display:none; top:0; z-index:99999; background-color:#020202a6; width:100%; height:100vh; border:1px solid red;">
	세션종료
	</div>
<script>
function autoSessionClose(){
	//document.getElementById('layer').style.display='block';
	alert("세션이 만료되었습니다.");
	location.href="logout.jsp";

}
setTimeout(autoSessionClose, 1000*60*30);
</script>
</body>
</html>