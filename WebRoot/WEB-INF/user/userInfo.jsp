<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>个人信息</title>
    <!-- Bootstrap -->
    <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx }/css/style.css" rel="stylesheet">
    <style type="text/css">
    hr{
    margin-bottom: 30px;
    margin-top: 10px;
    }
    .page-header{
    margin-top: 10px
    }
    </style>
  </head>
  <body>
  <nav>
  <ul class="pager top0">
    <li class="previous"><a href="javascript:history.go(-1);"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span> 返回</a></li>
  </ul>
   </nav>
  <div class="container-fluid">
     <div class="page-header">
     <h3>个人信息</h3>
     </div>
     <div class="row">
     <div class="col-xs-4">
     <a href="#" class="thumbnail">
      <img src="${user.headpicurl }" alt="..." width="84px" height="84px">
      </a>
     </div>
     </div> 
      
      <div class="row">
     <div class="col-xs-4">
                 账号
     </div>
     <div class="col-xs-4 col-sm-offset-3" >${user.loginname }</div>
     </div>
     <hr>
     <div class="row">
     <div class="col-xs-4">
                 微信名
     </div>
     <div class="col-xs-4 col-sm-offset-3" >${user.name }</div>
     </div>
      <hr>
       <div class="row">
     <div class="col-xs-4">
               真实姓名
     </div>
     <div class="col-xs-4 col-sm-offset-3" >${user.realname }</div>
     </div>
      <hr>
    <div class="row">
     <div class="col-xs-4">
               性别
     </div>
     <div class="col-xs-4 col-sm-offset-3" >
     <c:if test="${user.sex=='2' }">女</c:if>
     <c:if test="${user.sex=='1' }">男</c:if>
     </div>
     </div>
      <hr>
      <div class="row">
     <div class="col-xs-4">
               生日
     </div>
     <div class="col-xs-4 col-sm-offset-3" >${user.birthday}</div>
     </div>
      <hr>
   <div class="row">
     <div class="col-xs-4">
              身份件号
     </div>
     <div class="col-xs-4 col-sm-offset-3" >${user.idcard}</div>
     </div>
      <hr>
       <div class="row">
     <div class="col-xs-4">
             手机
     </div>
     <div class="col-xs-4 col-sm-offset-3" >${user.phone}</div>
     </div>
      <hr>
     <div class="row">
     <div class="col-xs-4">
            社区
     </div>
     <div class="col-xs-4 col-sm-offset-3" >${user.community}</div>
     </div>
      <hr>
     </div>
<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>