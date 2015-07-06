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
        <title>我要提问</title>   
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    <style type="text/css">
    .page-header{
    margin-top: 0px
    }
    </style>    
    </head>
    <body style="background-color: #f5f5f5">
     <div class="well well-lg" >
		<div class="container">
		<div class="page-header">
        <h3><small><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></small>&nbsp;发表提问 </h3>
          </div>
			  <div class="row">
			  <div  class="col-xs-8 col-xs-offset-2">
				<form role="form">
				    <div class="form-group">
						<label for="title">标题：</label> <input type="text"
							class="form-control" id="title" placeholder="请输入标题">
					</div>
					<div class="form-group">
						<label for="name">选择类型：</label>
					      <select class="form-control">
					         <option>外科</option>
					         <option>内科</option>
					         <option>儿科</option>
					         <option>妇科</option>
					         <option>全科</option>
					      </select>
					</div>
					<div class="form-group">
						<label for="name">内容</label>
                        <textarea class="form-control" rows="6" placeholder="请输入0-255内容"></textarea>
					</div>
				
				    <div class="radio-inline">
						 <label>
						   <input type="radio" name="optionsRadios" id="optionsRadios1" 
						    value="option1" checked>公开
						   </label>
					</div>
					<div class="radio-inline">
						 <label>
						   <input type="radio" name="optionsRadios" id="optionsRadios2" 
						    value="option2">
						         不公开
						 </label>
			        </div>
					<div class="center top10">
					<button type="submit" class="btn btn-success btn-md btn-block">发表</button>
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