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
	.photo {
		width:30px;
		height:30px;
	}
	#BigPhoto{
		display:none;
		position:absolute;
		width:100px;
		height:100px;
		z-index:10;
	}
	#BigPhoto img{
		width:100px;
		height:100px;
	}
  </style>
  </head>
  <%
  	List<Product> products= (List<Product>) request.getAttribute("products");
  	int maxPage = (Integer) request.getAttribute("maxPage");
  	int ye = (Integer) request.getAttribute("ye");
  	Product conditionProduct = (Product) request.getAttribute("conditionProduct");
  	if(conditionProduct.getKind() == null || conditionProduct.getKind().getCategory() == null){
  		Kind kind = new Kind();
  		Category category = new Category();
  		category.setId(-1);
  		kind.setId(-1);
  		kind.setCategory(category);
  		conditionProduct.setKind(kind);
  	}
  	List<Category> categorys= (List<Category>) request.getAttribute("categorys");
  	List<Kind> kinds = (List<Kind>) request.getAttribute("kinds");
  %>
   <script>
   	$(document).ready(function(){
  	var selectId = 0;
	$("tr").click(function(){
		$("tr").removeClass("info");
		$(this).addClass("info");
		selectId = $(this).data("id");
	});
	$("#add").click(function(){
		window.location.href="productShowAdd";
	});
	$("#modify").click(function(){
		if(selectId != 0){
			window.location.href="productShowModify?proId=" + selectId;
		} else{
			alert("请选择要修改的商品！");
		}
	});
	$("#delete").click(function(){
		if(selectId != 0){
			if(confirm("是否确认删除")){
				window.location.href="productDelete?proId=" + selectId;
			}
		} else{
			alert("请选择要删除的商品！");
		}
	});
	$(".photo").hover(function (event){
		$("#BigPhoto").children("img").attr("src",$(this).attr("src"));
		$("#BigPhoto").toggle();
		$("#BigPhoto").offset({
			left:event.pageX-100,
			top:event.pageY,
		});
	});
	
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
  <body>
	<div class="nav-right">
		<form action="product" class="navbar-form navbar-left" role="form">
			<div class="form-group">
				<div class="form-group">
					<span class="search-span"> 一级分类名称</span>
					<select class="form-control" id="category" style="width:130px;" name="kind.category.id">
						<option value="-1">所有分类</option>
						<%
						for(int i=0; i < categorys.size();i++){
						  Category category = categorys.get(i);
						%>
							<option value="<%=category.getId() %>" 
							<%
							  if (conditionProduct.getKind() != null &&  conditionProduct.getKind().getCategory() != null &&
							     conditionProduct.getKind().getCategory().getId() == category.getId()){
							%>
							selected="selected"
							<% } %>><%=category.getName() %></option>
						<%} %>
					</select>
				</div> 
				<div class="form-group">
					<span class="search-span"> 二级分类名称</span>
					<select class="form-control" id="kind" style="width:130px;" name="kind.id">
						<option value="-1">所有分类</option>
						<%
						for(int i=0; i<kinds.size();i++){
						  Kind kind = kinds.get(i);
						%>
							<option value="<%=kind.getId() %>" 
							<%
							  if (conditionProduct.getKind() != null && 
							     conditionProduct.getKind().getId() == kind.getId()){
							%>
							selected="selected"
							<% } %>><%=kind.getName() %></option>
						<%} %>
					</select>
				</div>
				<div class="form-group" style="margin-left:30px;">
					<span class="search-span"> 商品名称</span>
					<input type="text" name="name" class="form-control search-input"  style="width:130px;" 
					value="<%if(conditionProduct.getName() != null && !"null".equals(conditionProduct.getName()))
					{ out.print(conditionProduct.getName());} %>" />
				</div> 
				<button type="submit" class="btn btn-default">查找</button>
			</div>
		</form>
		<div class="jumbotron" style="padding: 50px;">
		<div id="BigPhoto"><img src=""></div>
			<table class="table table-bordered table-hover table-condensed  table-striped">
				<thead>
					<tr class="info">
						<th>编号</th>
						<th>名称</th>
						<th>作者 </th>
						<th>价格</th>
						<th>库存 </th>
						<th>照片</th>
						<th>介绍 </th>
						<th>出版社 </th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0; i < products.size(); i++){
						Product product = products.get(i);
					%>
					<tr data-id="<%=product.getId()%>" class="td" >
						<td><%=product.getId() %></td>
						<td><%=product.getName() %></td>
						<td><%=product.getAuthor() %></td>
						<td><%=product.getPrice() %></td>
						<td><%=product.getRepertory() %></td>
						<td>
							<img class="photo" src="photo/<%=product.getPhoto() %>" >
						</td>
						<td><%=product.getIntroduce() %></td>
						<%
						String pubName = "";
						if(product.getPublishing() != null){
							pubName = product.getPublishing().getName();
						} %>
						<td><%=pubName %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
				<div  style="margin-left:180px;">	
					<ul class="pagination" >
						<li>
							 <a href="product?ye=<%=1 %>
							 &name=<%=conditionProduct.getName()%>&kind.category.id=<%=conditionProduct.getKind().getCategory().getId() %>
							 &kind.id=<%=conditionProduct.getKind().getId() %>">首页</a>
						</li>
						<li>
							 <a href="product?ye=<%=ye-1 %>
							 &name=<%=conditionProduct.getName()%>&kind.category.id=<%=conditionProduct.getKind().getCategory().getId() %>
							 &kind.id=<%=conditionProduct.getKind().getId() %>">上一页</a>
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
						<li  <%if(i == ye){%> class=active<% } %> >
							 <a href="product?ye=<%=i %>
							 &name=<%=conditionProduct.getName()%>&kind.category.id=<%=conditionProduct.getKind().getCategory().getId() %>
							 &kind.id=<%=conditionProduct.getKind().getId() %>"><%=i %></a>
						</li>
						<% } %>
						<li>
							 <a href="product?ye=<%=ye+1 %>
							 &name=<%=conditionProduct.getName()%>&kind.category.id=<%=conditionProduct.getKind().getCategory().getId() %>
							 &kind.id=<%=conditionProduct.getKind().getId() %>">下一页</a>
						</li>
						<li>
							 <a href="product?ye=<%=maxPage %>
							 &name=<%=conditionProduct.getName()%>&kind.category.id=<%=conditionProduct.getKind().getCategory().getId() %>
							 &kind.id=<%=conditionProduct.getKind().getId() %>">尾页</a>
						</li>
					</ul>
				</div>
			<div class="btn-group" style="margin-left:550px;float:left;">
				 <button id="add" class="btn btn-primary" type="button">
					新增
				</button> 
				 <button id="modify" class="btn btn-primary" type="button">
				 	修改
				 </button> 
				 <button id="delete" class="btn btn-primary" type="button">
				 	删除
				 </button> 
			</div>
	   </div>
	</div>
 </body>
</html>
