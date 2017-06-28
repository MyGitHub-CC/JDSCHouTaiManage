<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改订单</title>
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <style>
  .col-md-5 {
  	text-align:right;
  	line-height:30px;
  	letter-spacing: 3px;
  }
  	#img{
		width:30px;
		height:30px;
		float:left;
		margin:0 10px 20px 10px;
	}
  </style>
  </head>
  <%
  	Product product = (Product) request.getAttribute("product");
   %>
  <body>
	<div class="row clearfix" >
		<div class="col-md-8 column" style="margin:10px 0px;">
				<form action="productModify" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
					<input type="hidden" name="id" value="<%=product.getId() %>" />
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>商品名称 :</label>
						 </div>
					 	<div class="col-md-7 column" >
						 	<input type="text" name="name" class="form-control" id="exampleInputEmail1"
						 	 value="<%=product.getName() %>" />
						 </div>
					</div>
						<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>价格：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="price" class="form-control" id="exampleInputPassword1" 
							  value="<%=product.getPrice() %>" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>库存：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="repertory" class="form-control" id="exampleInputPassword1" 
							  value="<%=product.getRepertory() %>"  />
						</div>
					</div>
					<div style="margin-left:300px;">
						<div class="checkbox">
							 <label><input type="checkbox" />我同意 </label>
						</div> 
						<br/>
						<button type="submit" class="btn btn-primary">保 存</button>
					</div>
				</form>
			</div>
		</div>
  </body>
</html>
