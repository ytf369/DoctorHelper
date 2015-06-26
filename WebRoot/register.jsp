<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>注册</title>   
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body style="background-color: #f5f5f5">
     <div class="well well-lg">
		<div class="container">
			  <div class="row">
			  <div  class="col-xs-8 col-xs-offset-2">
				<form role="form">
				<div class="page-header center top10">
				<h2 ><small><span class="glyphicon glyphicon-globe" aria-hidden="true"></span></small>&nbsp;用户注册</h2>
				</div> 
				    <div class="form-group">
						<label for="username">用户名：</label> <input type="text"
							class="form-control" id="username" placeholder="请输入您的用户名">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">邮箱：</label> <input type="email"
							class="form-control" id="exampleInputEmail1" placeholder="请输入您的邮箱地址">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密码</label> <input type="password"
							class="form-control" id="exampleInputPassword1"
							placeholder="请输入您的密码">
					</div>
					<div class="form-group">
						<label for="repassword">确认密码</label> <input type="password"
							class="form-control" id="repassword"
							placeholder="再次输入密码">
					</div>
					<div class="checkbox">
						<label> <input type="checkbox">同意协议
						</label>
					</div>
					<div class="checkbox" style="text-align: center;">
					<button type="submit" class="btn btn-success btn-lg btn-block">注册</button>
					</div>
				</form>
			</div>
		   </div>
      </div>
</div>

	<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
        <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
    </body>
</html>