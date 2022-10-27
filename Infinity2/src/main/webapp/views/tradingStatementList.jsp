<%@page import="model.TradingVO"%>
<%@page import="model.PagingDTO"%>
<%@page import="model.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp"%>
<%
List<TradingVO> list = (List<TradingVO>)request.getAttribute("list");
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
				<%//=paging.getP()%>/<%//=paging.getTotalPage()%>
					<div class="mail-toolbar m-b-lg pull-right">
					
						<div class="btn-group"  id="btn_group"role="group">
							<a href="?p=1" class="btn btn-default <%=(paging.getP() == 1)?"disabled":"" %>"><i class="fa fa-backward"></i></a>
							<a href="?p=<%=paging.getP()-1 %>" class="btn btn-default <%=(paging.getP() == 1)?"disabled":"" %>"><i class="fa fa-chevron-left"></i></a>
							<a href="?p=<%=paging.getP()+1%>" class="btn btn-default <%=(paging.getP() == paging.getTotalPage())?"disabled":"" %>"><i class="fa fa-chevron-right"></i></a>
							<a href="?p=<%=paging.getTotalPage() %>" class="btn btn-default <%=(paging.getP() == paging.getTotalPage())?"disabled":"" %>"><i class="fa fa-forward"></i></a>
						</div>								
					
						<div class="btn-group " role="group">
							<a href="TradingWrite" class="btn btn-default">등록</a>
						</div>


					</div>
				</div>
		</div>
			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">거래명세서 </h4>
					<p class="m-b-lg docs">
					</p>
					<div class="table-responsive">
						<table class="table">
<%
boolean dataChk = false;
int rowNum =paging.getTotal()-((paging.getP()-1)*paging.getPageRow());
Iterator<TradingVO> it = list.iterator();
while(it.hasNext()){
	TradingVO data = it.next();
%>
							<tr>
								<td><%=rowNum--%><a href="TradingView?tra_num=<%=data.getTra_num()%>"><%=data.getTra_account()%></a></td>
								<td align="right"><%=data.getTra_inputdate() %></td>
							</tr>
<%
dataChk=true;
}
%>
<%
if(!dataChk){
%>
							<tr>
								<td colspan="2">등록된 글이 없습니다.</td>
							</tr>
<%
}
%>
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