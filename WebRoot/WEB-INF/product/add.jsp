<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品</title>
    
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
   %>
  <body>
	<div class="row clearfix" >
		<div class="col-md-8 column" >
				<form action="productAdd" method="post" enctype="multipart/form-data" class="form-horizontal" role="from" >
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>名 称 :</label>
						 </div>
					 	<div class="col-md-4 column" >
						 	<input type="text" name="name" class="form-control"  />
						 </div>
						<div class="col-md-2 column" >
						 	<label>作 者 :</label>
						 </div>
					 	<div class="col-md-4 column" >
						 	<input type="text" name="author" class="form-control"  />
						 </div>
					</div>
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>价 格：</label>
						 </div>
						<div class="col-md-4 column" >
							 <input type="text" name="price" class="form-control" id="InputPassword1" />
						</div>
						<div class="col-md-2 column" >
						 	<label>库存：</label>
						 </div>
						<div class="col-md-4 column" >
							 <input type="text" name="repertory" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 column" >
						 	<label>照 片：</label>
						 </div>
						<div class="col-md-4 column" >
							 <input type="file" name="myfile" class="form-control" />
						</div>
						<div class="col-md-2 column" >
						 	<label>出版社：</label>
						 </div>
						 <div class="col-md-4 column" >
							<select name="publishing.id" class="form-control">
								<%
								for(int i=0;i<publishings.size();i++){
									Publishing publishing = publishings.get(i);
								 %>
								<option value="<%=publishing.getId()%>">
									<%=publishing.getName() %>
								</option>
								<%} %>
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
								<option value="<%=category.getId()%>">
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
								<option value="<%=kind.getId()%>">
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
							 <textarea type="text" name="introduce" class="form-control" >
							 </textarea>
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
