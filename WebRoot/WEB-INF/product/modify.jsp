<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改商品信息</title>
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script>
$().ready(function(){
	$("#category").change(function(){
		 $.ajax({
           	type:"post",
           	url:"changeKind",
           	data:"cId="+ $(this).val(),
           	dataType:"json",
           	success:function(data){
           		var options = "";
           		$.each(data,function(index,element){
           			options += "<option value='" + element.id + "' >"+ element.name + "</option>";
           		});
           		$("#kind").html(options);
           	}
         });
	});
});
</script>
  </head>
  <style>
  .column{
  	text-align:right;
  }
  </style>
  <%
  	List<Publishing> publishings = (List<Publishing>) request.getAttribute("publishings");
  	List<Category> categorys = (List<Category>) request.getAttribute("categorys");
  	List<Kind> kinds = (List<Kind>) request.getAttribute("kinds");
  	Product product = (Product) request.getAttribute("product");
   %>
  <body>
	<div class="row clearfix" >
		<div class="col-md-8 column" >
				<form action="productModify" method="post" enctype="multipart/form-data" class="form-horizontal" role="from" >
					<input type="hidden" name="id" value="<%=product.getId()%>" >
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>名 称 :</label>
						</div>
					 	<div class="col-md-4 column" >
						 	<input type="text" name="name" class="form-control"
						 	  value="<%=product.getName() %>" />
						 </div>
						<div class="col-md-2 column" >
						 	<label>作 者 :</label>
						 </div>
					 	<div class="col-md-4 column" >
						 	<input type="text" name="author" class="form-control" 
						 	 value="<%=product.getAuthor() %>"  />
						 </div>
					</div>
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>价 格：</label>
						 </div>
						<div class="col-md-4 column" >
							 <input type="text" name="price" class="form-control" 
								 value="<%=product.getPrice() %>"  />
						</div>
						<div class="col-md-2 column" >
						 	<label>库存：</label>
						 </div>
						<div class="col-md-4 column" >
							 <input type="text" name="repertory" class="form-control" 
							 value="<%=product.getRepertory() %>" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>照 片：</label>
						 </div>
						<div class="col-md-3 column" >
							<%
								String photo = "default.jpg";
								if (product.getPhoto() != null) {
									photo = product.getPhoto();
								}
							%>
							<input type="hidden" name="url" value="<%=photo%>" />
							 <input type="file" name="myfile" class="form-control"  />
						</div>
							 <img src="photo/<%=photo %>" style="width:40px;height:30px;float:left;margin-right:16px;">
						<div class="col-md-2 column" >
						 	<label>出版社：</label>
						 </div>
						 <div class="col-md-4 column" >
							<select name="publishing.id" class="form-control">
								<%
								for(int i=0;i<publishings.size();i++){
									Publishing publishing = publishings.get(i);
								 %>
								<option value="<%=publishing.getId()%>" 
								<%if(product.getPublishing() != null && product.getPublishing().getId() == publishing.getId()){%>
								    selected="selected" <% } %> >
									<%=publishing.getName() %>
								</option>
								<% } %>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>一级分类：</label>
						 </div>
						 <div class="col-md-4 column" >
							<select id="category"  class="form-control">
								<%
								for(int i=0;i<categorys.size();i++){
									Category category = categorys.get(i);
								 %>
								<option value="<%=category.getId()%>" 
								<%if(product.getKind() != null && product.getKind().getCategory()!= null
								 && product.getKind().getCategory().getId() == category.getId()){%>
								    selected="selected" <% } %>>
									<%=category.getName() %>
								</option>
								<%} %>
							</select>
						</div>
						<div class="col-md-2 column" >
						 	<label>二级分类：</label>
						 </div>
						 <div class="col-md-4 column" >
							<select id="kind" name="kind.id" class="form-control">
								<%
								for(int i=0;i<kinds.size();i++){
									Kind kind = kinds.get(i);
								 %>
								<option value="<%=kind.getId()%>" 
								<%if( product.getKind().getId() == kind.getId()){%>
								    selected="selected" <% } %>>
									<%=kind.getName() %>
								</option>
								<%} %>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>介绍：</label>
						 </div>
						<div class="col-md-10 column" >
							 <input type="text" name="introduce" class="form-control" 
							  value="<%=product.getIntroduce() %>" />
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
