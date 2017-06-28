<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>一级分类管理</title>
    
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
  	List<Category> categorys= (List<Category>) request.getAttribute("categorys");
  	int maxPage = (Integer) request.getAttribute("maxPage");
  	int ye = (Integer) request.getAttribute("ye");
  	Category conditionCategory = (Category) request.getAttribute("conditionCategory");
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
			window.location.href="categoryShowAdd";
	});
	$("#modify").click(function(){
		if(selectId != 0){
			window.location.href="categoryShowModify?cateId=" + selectId;
		} else{
			alert("请选择要修改的一级分类！");
		}
	});
	$("#delete").click(function(){
		if(selectId != 0){
			if(confirm("是否确认删除")){
				window.location.href="categoryDelete?cateId=" + selectId;
			}
		} else{
			alert("请选择要删除的一级分类！");
		}
	});
});
   </script>
  <body>
	<div class="nav-right">
		<form action="category" class="navbar-form navbar-left" role="form">
			<div class="form-group">
				<div class="form-group" style="margin-left:30px;">
					<span class="search-span"> 一级分类名称</span>
					<input type="text" name="name" class="form-control search-input"  style="width:130px;" 
					value="<%if(conditionCategory.getName() != null && !"null".equals(conditionCategory.getName())){ 
					out.print(conditionCategory.getName()); } %>" />
				</div> 
				<button type="submit" class="btn btn-default">查找</button>
			</div>
		</form>
	
		<div class="jumbotron" style="padding: 50px;">
			<table class="table table-bordered table-hover table-condensed  table-striped">
				<thead>
					<tr class="info">
						<th>编号</th>
						<th>名称</th>
						<th>查看详情</th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0; i < categorys.size(); i++){
						Category category = categorys.get(i);
					%>
					<tr data-id="<%=category.getId()%>" class="td" >
						<td><%=category.getId() %></td>
						<td><%=category.getName() %></td>
						<td><a href="<%=category.getId() %>">查看</a></td>
					</tr>
					<% } %>
				</tbody>
			</table>
				<div  style="margin-left:180px;">	
					<ul class="pagination" >
						<li>
							 <a href="category?ye=<%=1 %>&name=<%=conditionCategory.getName()%>">首页</a>
						</li>
						<li>
							 <a href="category?ye=<%=ye-1 %>&name=<%=conditionCategory.getName()%>">上一页</a>
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
						<li <%if(i == ye){%> class=active<% } %> >
							 <a href="category?ye=<%=i %>&name=<%=conditionCategory.getName()%>"><%=i %></a>
						</li>
						<% } %>
						<li>
							 <a href="category?ye=<%=ye+1 %>&name=<%=conditionCategory.getName()%>">下一页</a>
						</li>
						<li>
							 <a href="category?ye=<%=maxPage %>&name=<%=conditionCategory.getName()%>">尾页</a>
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
