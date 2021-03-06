<%@page import="entity.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加二级分类</title>
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

  </head>
  <style>
  .col-md-5 {
  	text-align:right;
  	line-height:30px;
  	letter-spacing: 3px;
  }
  </style>
  <%
  	List<Category> categorys = (List<Category>) request.getAttribute("categorys");
   %>
  <body>
	<div class="row clearfix" >
		<div class="col-md-8 column" >
			<form action="kindAdd" method="post"  class="form-horizontal" >
				<div class="form-group">
					<div class="col-md-5 column" >
					 	<label>名称 :</label>
					 </div>
				 	<div class="col-md-4 column" >
					 	<input type="text" name="name" class="form-control" id="exampleInputEmail1" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-5 column" >
					 	<label>所属一级分类 :</label>
					</div>
				 	<div class="col-md-7 column" >
					 	<select class="form-control" style="width:202px;" name="category.id">
					 		<option value="-1">所有分类</option>
					 		<%
					 			for(int i=0;i<categorys.size();i++){
					 				Category category = categorys.get(i);
					 		 %>
					 		<option value="<%=category.getId() %>" ><%=category.getName() %></option>
					 		<%} %>
					 	</select>
					</div>
				</div>
				<div style="margin-left:300px;">
					<br/>
					<button type="submit" class="btn btn-primary">保 存</button>
				</div>
			</form>
		</div>
	</div>
  </body>
</html>
