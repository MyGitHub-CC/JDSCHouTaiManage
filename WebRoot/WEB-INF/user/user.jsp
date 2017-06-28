<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
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
  	.search-span {
		line-height:30px;
		font-size:16px;
		font-weight:400;
		margin:0 10px 0 0px;
		float:left;
	}
	.search-input{
		float:left;
	}
  </style>
  </head>
  <%
  	List<User> users = (List<User>) request.getAttribute("users");
  	User conditionUser = (User) request.getAttribute("conditionUser");
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
	
	$("#add").click(function(){
			window.location.href="userShowAdd";
	});
	
	$("#modify").click(function(){
		if(selectId != 0){
			window.location.href="userShowModify?uId=" + selectId;
		} else{
			alert("请选择要修改的学生！");
		}
	});
	
	$("#delete").click(function(){
		if(selectId != 0){
			if(confirm("是否确认删除")){
				window.location.href="userDelete?uId=" + selectId;
			}
		} else{
			alert("请选择要删除的学生！");
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
	});
   </script>
  <body>
	<div class="nav-right">
		<form action="user" class="navbar-form navbar-left" role="form">
			<div class="form-group">
				<div class="form-group" style="margin-left:30px;">
					<span class="search-span"> 用户名</span>
					<input type="text" name="username" class="form-control search-input"  style="width:130px;" 
					value="<%if(conditionUser.getUsername() != null && !"null".equals(conditionUser.getUsername())){
					 out.print(conditionUser.getUsername()); } %>" />
				</div> 
				<div class="form-group">
					<span class="search-span"> 联系电话</span>
					<input type="text" name="phone" class="form-control search-input"  style="width:130px;"
					value="<%if(conditionUser.getPhone() != null && !"null".equals(conditionUser.getPhone())){
					out.print(conditionUser.getPhone());} %>" />
				</div> 
				<div class="form-group">
					<span class="search-span"> 地址</span>
					<input type="text" name="address" class="form-control search-input"  style="width:130px;"
					 value="<%if(conditionUser.getAddress() != null && !"null".equals(conditionUser.getAddress())){
					 out.print(conditionUser.getAddress());} %>" />
				</div> 
				<button type="submit" class="btn btn-default">查找</button>
			</div>
		</form>
		<div class="jumbotron" style="padding: 50px;">
			<table class="table table-bordered table-hover table-condensed  table-striped" style="margin-top: 20px;">
				<thead>
					<tr class="info">
						<th>序号</th>
						<th>用户名</th>
						<th>联系电话 </th>
						<th>联系地址</th>
					</tr>
				</thead>
				<tbody>
					<%
					for(int i = 0; i < users.size(); i++){
						User user = users.get(i);
					%>
					<tr data-id="<%=user.getId()%>">
						<td><%=user.getId() %></td>
						<td><%=user.getUsername() %></td>
						<td><%=user.getPhone() %></td>
						<td><%=user.getAddress() %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<div  style="margin-left:180px;">	
				<ul class="pagination" >
					<li>
						 <a href="user?ye=<%=1 %>
						 &username=<%=conditionUser.getUsername()%>&phone=<%=conditionUser.getPhone()%>&address=<%=conditionUser.getAddress()%>">首页</a>
					</li>
					<li>
						 <a href="user?ye=<%=ye-1 %>
						 &username=<%=conditionUser.getUsername()%>&phone=<%=conditionUser.getPhone()%>&address=<%=conditionUser.getAddress()%>">上一页</a>
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
						 <a href="user?ye=<%=i %>
						 &username=<%=conditionUser.getUsername()%>&phone=<%=conditionUser.getPhone()%>&address=<%=conditionUser.getAddress()%>"><%=i %></a>
					</li>
					<% } %>
					<li>
						 <a href="user?ye=<%=ye+1 %>
						 &username=<%=conditionUser.getUsername()%>&phone=<%=conditionUser.getPhone()%>&address=<%=conditionUser.getAddress()%>">下一页</a>
					</li>
					<li>
						 <a href="user?ye=<%=maxPage%>
						 &username=<%=conditionUser.getUsername()%>&phone=<%=conditionUser.getPhone()%>&address=<%=conditionUser.getAddress()%>">尾页</a>
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
