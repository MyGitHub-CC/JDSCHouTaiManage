<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
    
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>

	<style>
  	*{
  		margin:0;
  		padding:0;
 	 }
  	.footer {
  		margin:0 70px;
  		height:50px;
  		background-color:#60C2FF;
  	}
  	.title{
  		font-size:26px;
  		font-weight:700;
  		font-family:"楷体";
  		color:#fff;
  		padding: 10px;
  		letter-spacing:8px;
  		text-align:center;
  	}
  	</style>
  </head>
  
  <body>
    	<!-- 底部信息 -->
	  	<div class="footer">
	  		<div class="w">
		  		<div class="title">
		  			京东商城信息管理系统
		  		</div>
	  		</div>
	  	</div>
  </body>
</html>
