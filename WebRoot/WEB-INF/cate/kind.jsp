<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>二级分类管理</title>
    
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
  	List<Kind> kinds= (List<Kind>) request.getAttribute("kinds");
  	int maxPage = (Integer) request.getAttribute("maxPage");
  	int ye = (Integer) request.getAttribute("ye");
  	List<Category> categorys= (List<Category>) request.getAttribute("categorys");
  	Kind conditionKind = (Kind) request.getAttribute("conditionKind");
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
			window.location.href="kindShowAdd";
	});
	$("#modify").click(function(){
		alert(selectId);
		if(selectId != 0){
			window.location.href="kindShowModify?kindId=" + selectId;
		} else{
			alert("请选择要修改的二级分类！");
		}
	});
	$("#delete").click(function(){
		if(selectId != 0){
			if(confirm("是否确认删除")){
				window.location.href="kindDelete?kindId=" + selectId;
			}
		} else{
			alert("请选择要删除的二级分类！");
		}
	});
});
</script>
  <body>
	<div class="nav-right">
		<form action="kind" class="navbar-form navbar-left" role="form">
			<div class="form-group">
				<div class="form-group" style="margin-left:30px;">
					<span class="search-span"> 二级分类名称</span>
					<input type="text" name="name" class="form-control search-input"  style="width:130px;" 
					value="<%if(conditionKind.getName() != null){ out.print(conditionKind.getName());} %>" />
				</div> 
				<div class="form-group">
					<span class="search-span"> 一级分类名称</span>
					<select class="form-control" style="width:130px;" name="category.id">
						<option value="-1">所有分类</option>
						<%
						for(int i=0; i<categorys.size();i++){
						  Category category = categorys.get(i);
						%>
							<option value="<%=category.getId() %>" 
							<%
							  if (conditionKind.getCategory() != null && 
							     conditionKind.getCategory().getId() == category.getId()){
							%>
							selected="selected"
							<% } %>><%=category.getName() %></option>
						<%} %>
					</select>
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
						<th>所属分类</th>
						<th>查看详情</th>
					</tr>
				</thead>
				<tbody>
					<%
					  for(int i = 0; i < kinds.size(); i++){
						  Kind kind = kinds.get(i);
					%>
					<tr data-id="<%=kind.getId()%>" class="td" >
						<td><%=kind.getId() %></td>
						<td><%=kind.getName() %></td>
						<td><%=kind.getCategory().getName() %></td>
						<td><a href="<%=kind.getId() %>">查看</a></td>
					</tr>
					<% } %>
				</tbody>
			</table>
				<div  style="margin-left:180px;">	
					<ul class="pagination" >
						<li>
							 <a href="kind?ye=<%=1 %>&name=<%=conditionKind.getName()%>&category.id=<%=conditionKind.getCategory().getId()%>">首页</a>
						</li>
						<li>
							 <a href="kind?ye=<%=ye-1 %>&name=<%=conditionKind.getName()%>&category.id=<%=conditionKind.getCategory().getId()%>">上一页</a>
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
							 <a href="kind?ye=<%=i %>&name=<%=conditionKind.getName()%>&category.id=<%=conditionKind.getCategory().getId()%>"><%=i %></a>
						</li>
						<% } %>
						<li>
							 <a href="kind?ye=<%=ye+1 %>&name=<%=conditionKind.getName()%>&category.id=<%=conditionKind.getCategory().getId()%>">下一页</a>
						</li>
						<li>
							 <a href="kind?ye=<%=maxPage %>&name=<%=conditionKind.getName()%>&category.id=<%=conditionKind.getCategory().getId()%>">尾页</a>
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
