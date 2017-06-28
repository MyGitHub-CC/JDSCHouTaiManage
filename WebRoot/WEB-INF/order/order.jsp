<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品管理</title>
    
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

	<style>
	*{
  		margin:0;
  		padding:0;
 	 }
  	.panel-heading{
  		text-align:center;
  	}
  	.panel-title{
  		font-size:22px;
  		font-weight:700;
  		font-family:"楷体";
  	}
  	.panel-body{
  		font-size:18px;
  		font-weight:400;
  		font-family:"宋体";
  		text-align:center;
  	}
  	.nav-right .a{
  		text-decoration: none;
  	}
  	.nav-right {
  		margin-right:70px;
  	}
	td{
		max-width:50px;
		max-height:22px;
		line-height:22px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
  </style>
  </head>
  <%
  	List<Order> orders = (List<Order>) request.getAttribute("orders");
  	Order conditionOrder = (Order) request.getAttribute("conditionOrder");
  	int maxPage = (Integer) request.getAttribute("maxPage");
  	int ye = (Integer) request.getAttribute("ye");
   %>
   <script>
   	$(document).ready(function(){
  	var selectId = 0;
	$("tr").click(function(){
		$("tr").removeClass("info");
		$(this).addClass("info");
		selectId = $(this).data("id");
	});
	$("#delete").click(function(){
		if(selectId != 0){
			if(confirm("是否确认删除")){
				window.location.href="orderDelete?orderId=" + selectId;
			}
		} else{
			alert("请选择要删除的订单！");
		}
	});
});
 </script>
 <body>
	<div class="nav-right">
	<form action="order" class="navbar-form navbar-left" role="form">
		<div class="form-group">
			<div class="form-group" style="margin-left:30px;">
				<span class="search-span">订单号 </span>
				<input type="text" name="orderNum" class="form-control search-input"  style="width:130px;" 
				value="<%if(conditionOrder.getOrderNum() != null && !"null".equals(conditionOrder.getOrderNum())){
				 out.print(conditionOrder.getOrderNum()); } %>" />
			</div> 
			<div class="form-group" style="margin-left:30px;">
				<span class="search-span">用户名 </span>
				<input type="text" name="user.username" class="form-control search-input"  style="width:130px;" 
				value="<%if(conditionOrder.getUser().getUsername() != null && !"null".equals(conditionOrder.getUser().getUsername())){
				 out.print(conditionOrder.getUser().getUsername()); } %>" />
			</div> 
			<button type="submit" class="btn btn-default">查找</button>
		</div>
	</form>
		<div class="jumbotron" style="padding: 50px;">
			<table class="table table-bordered table-hover table-condensed  table-striped">
				<thead>
					<tr class="info">
						<th>订单id</th>
						<th>用户名</th>
						<th>联系电话</th>
						<th>联系地址</th>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>商品数量</th>
						<th style="width:220px;">订单号</th>
						<th>付款状态</th>
						<th>送货状态</th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0; i < orders.size(); i++){
						Order order = orders.get(i);
					%>
					<tr data-id="<%=order.getId()%>" class="td" >
						<td><%=order.getId() %></td>
						<td><%=order.getUser().getUsername() %></td>
						<td><%=order.getUser().getPhone() %></td>
						<td><%=order.getUser().getAddress() %></td>
						<td><%=order.getProduct().getName() %></td>
						<td><%=order.getProduct().getPrice() %></td>
						<td><%=order.getProduct().getNum() %></td>
						<td><%=order.getOrderNum() %></td>
						<%
							String payment = "";
							String send = "";
							if(order.getPayment() == 0){
								payment = "未付款";
							}else if(order.getPayment() == 1) {
								payment = "已付款";
							}
							if(order.getSend() == 0){
								send = "未发货";
							}else if(order.getPayment() == 1) {
								send = "已发货";
							}else if(order.getPayment() == 1) {
								send = "已完成";
							}
						 %>
						<td><%=payment %></td>
						<td><%=send %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<div  style="margin-left:180px;">	
				<ul class="pagination" >
					<li>
						 <a href="order?ye=<%=1 %>
						 &orderNum=<%=conditionOrder.getOrderNum()%>&user.username=<%=conditionOrder.getUser().getUsername()%>">首页</a>
					</li>
					<li>
						 <a href="order?ye=<%=ye-1 %>
						 &orderNum=<%=conditionOrder.getOrderNum()%>&user.username=<%=conditionOrder.getUser().getUsername()%>">上一页</a>
					</li>
					<%
						int begin = ye;
						int end = ye + 4;
						if (end > maxPage) {
							end = maxPage;
							begin = end - 4;
						}
						if (begin < 1){
							begin = 1;
						}
						for(int i = begin; i <= end; i++){
					%>
					<li>
						 <a href="order?ye=<%=i %>
						 &orderNum=<%=conditionOrder.getOrderNum()%>&user.username=<%=conditionOrder.getUser().getUsername()%>"><%=i %></a>
					</li>
					<% } %>
					<li>
						 <a href="order?ye=<%=ye+1 %>
						 &orderNum=<%=conditionOrder.getOrderNum()%>&user.username=<%=conditionOrder.getUser().getUsername()%>">下一页</a>
					</li>
					<li>
						 <a href="order?ye=<%=maxPage %>
						 &orderNum=<%=conditionOrder.getOrderNum()%>&user.username=<%=conditionOrder.getUser().getUsername()%>">尾页</a>
					</li>
				</ul>
			</div>

			<div class="btn-group" style="margin-left:550px;float:left;">
				 <button id="delete" class="btn btn-primary" type="button">
				 	删除
				 </button> 
			</div>
		</div>
	 </div>
  </body>
</html>
