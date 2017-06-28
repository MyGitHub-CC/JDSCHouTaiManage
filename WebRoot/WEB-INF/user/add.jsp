<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户</title>
    
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
  <script>
  	$().ready(function(){
  		$("form").submit(function(){
	  		var username = $("#username").val();
			if(username == "") {
				alert("用户名不能为空！");
				return false;
			}
			var pwd = $("#pwd").val();
			var repwd = $("#repwd").val();
			if(repwd != pwd){
				alert("两次输入的密码不一致！");
				return false;
		   }
  			return true;
  		});
  	});
  </script>
  <body>
	<div class="row clearfix" >
		<div class="col-md-8 column" style="margin:10px 0px;">
				<form action="userAdd" method="post" class="form-horizontal"  id="form" onsubmit="return">
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>用户名 :</label>
						 </div>
					 	<div class="col-md-7 column" >
						 	<input type="text" name="username" id="username" class="form-control" id="exampleInputEmail1" />
						 </div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>密 码：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="password" name="password" id="pwd" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>确 认 密 码：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="password" name="password2"  id="repwd" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>手机号码：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="phone" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>联系地址：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="address" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div style="margin-left:300px;">
						<br/>
						<input type="submit" class="btn btn-primary" value="保存" />
					</div>
				</form>
			</div>
		</div>
  </body>
</html>
