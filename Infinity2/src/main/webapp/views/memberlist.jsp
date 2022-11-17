<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
String user = "root";
String password = "bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM big_member WHERE mb_out = 'N' ORDER BY mb_joindate DESC ");
String sql = qry.toString();

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;

List<HashMap<String, String>> list = new ArrayList<>();
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	while (rs.next()) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("mb_id", rs.getString("mb_id"));
		hm.put("mb_name", rs.getString("mb_name"));
		hm.put("mb_email", rs.getString("mb_email"));
		hm.put("mb_phone", rs.getString("mb_phone"));
		hm.put("mb_birth", rs.getString("mb_birth"));
		hm.put("mb_gender", rs.getString("mb_gender"));
		hm.put("mb_joindate", rs.getString("mb_joindate"));
		
		list.add(hm);
	}
	//select문 실행

} catch (Exception e) {

} finally {
	try {
		if (rs != null)
	rs.close();
		if (stmt != null)
	stmt.close();
		if (con != null)
	con.close();
	} catch (Exception e) {

	}
}
%>
<%@ include file="includes/header.jsp"%>

<div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-12">
				<h4 class="m-b-lg">회원관리</h4>
			</div>
			<!-- END column -->

			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">회원목록</h4>
					<p class="m-b-lg docs">가입된 회원목록입니다. 1년간 로그인이 없을 시 탈퇴회원 또는
						휴면계정으로 전환됩니다.</p>
						<form>
					<div style="text-align: right; margin-bottom:1rem">
						<input type="text" name="keyword"><button>검색</button>
					</div>
					</form>
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th>#순번</th>
								<th>아이디</th>
								<th>회원이름</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>가입일자</th>
								<th>관리</th>
							</tr>
							<c:set value="1" var= "num"/>
							<c:forEach var="data" items="${list}">
								<tr>
								<td><c:out value="${num}"/><%//=num++ %></td>
								<td><c:out value="${data.mb_id}"/><%//=data.get("mb_id")%></td>
								<td><c:out value="${data.mb_name}"/><%//=data.get("mb_name")%></td>
								<td><c:out value="${data.mb_email}"/><%//=data.get("mb_email")%></td>
								<td><c:out value="${data.mb_phone}"/><%//=data.get("mb_phone")%></td>
								<td><c:out value="${data.mb_birth}"/><%//=data.get("mb_birth")%></td>
								<td><c:out value="${data.mb_gender}"/><%//=data.get("mb_gender")%></td>
								<td><fmt:formatDate value="${data.mb_joindate}" pattern="yyyy-MM-dd"/><%//=data.get("mb_joindate")%></td>
								<td><button data-mb_id="<c:out value="${data.mb_id}"/><%//=data.get("mb_id")%>" class="btn">탈퇴</button></td>
								</tr>
						<c:set value="${num+1}" var="num" />
							</c:forEach>
							<c:if test="${num eq 1 }">	
							<tr>
								<td colspan="8">가입된 회원이 없습니다.</td>
							</tr>
							</c:if>
							
						</table>
					</div>
				</div>
				<!-- .widget -->
			</div>
			<!-- END column -->
		</div>
		<!-- .row -->
	</section>
	<!-- #dash-content -->
</div>
<script>
$(document).ready(function(){
	$('.btn').on("click",function(){
		let mb_id =$(this).data('mb_id');
		let superEle=$(this).parent().parent()
		if(confirm('정말로 탈퇴 하시겠습니까?')){
			 $.ajax({
			        type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "../ajax/ajax.memberAct.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {mb_id:mb_id},            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			            // 응답코드 > 0000
			            if(res=='Success'){
			            	
			            	superEle.remove();
			            }
			            
			            //console.log("["+res+"]");
			        },
			        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
			        	console.log("통신 실패.")
			        }
			    });
		}
		//console.log("[Button클릭]" +mb_id);
	});
});
</script>
<!-- .wrap -->
<%@ include file="includes/footer.jsp"%>