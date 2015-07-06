<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>回复</title>   
        <!-- Bootstrap -->
        <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
        <link href="${ctx }/css/style.css" rel="stylesheet">
        <!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
        hr{
        margin-top: 0
        }
        </style>
    </head>
    <body>
   <div class="well padding0 backcolor fixtop">
    <div class="container-fluid">
	 <div class="row ">
	 <div class="col-xs-2">
	 <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
     <span class="glyphicon glyphicon-refresh " aria-hidden="true"></span>
     </button>
	 </div>
	  <div class="col-xs-10 ">
		<div class="dropdown pull-right">
		  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		<span class="glyphicon glyphicon-menu-hamburger"></span> 菜单
		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
		    <li><a href="#">分享</a></li>
		    <li><a href="#">收藏</a></li>
		    <li><a href="#">举报</a></li>
		    <li><a href="#">跳页</a></li>
		  </ul>
		</div>
	  </div>
	 </div>
    </div>
   </div>
    <!--导航条开始  -->
  
    <!-- 导航条结束 -->
  <div style="padding: 19px"> 
    <div class="page-header">
     <div class="media">
      <div class="media-left">
      <a href="#">
      <img class="media-object" src="images/customDefu.jpeg" width="60px" height="60px" alt="...">
      </a>
      </div>
     <div class="media-body">
     <h3 class="media-heading">${mainpost.user.name }
     <span class="label label-default padding000">
     <c:if test="${mainpost.user.sex=='2'}">
            女
     </c:if>
       <c:if test="${mainpost.user.sex=='1'}">
            男
     </c:if></span>
     <span class="label label-primary padding000">${mainpost.user.country }</span>
     </h3>
  ${mainpost.createtime }
     </div>
     </div>
    </div>
<h3>${mainpost.title }</h3>
<p>${mainpost.content }</p>
</div> 
<!-- 回复列表 -->
<c:forEach items="${mainpost.replys }" var="reply" varStatus="i">
<div class="well well0">
  <div class="page-header top10">
     <div class="media">
      <div class="media-left">
      <a href="#">
      <img class="media-object" src="images/customDefu.jpeg" width="60px" height="60px" alt="...">
      </a>
      </div>
     <div class="media-body">
     <h3 class="media-heading">${reply.user.name }
     <span class="label label-default padding000">${reply.user.sex }</span>
     <span class="label label-primary padding000">${reply.user.country }</span>
     
     <button type="button" class="btn btn-default pull-right"><span class="glyphicon glyphicon-comment " aria-hidden="true"></span>回复</button>
      
     </h3>
   ${reply.createtime }
     </div>
     </div>
    </div>
<p>${reply.content }</p>
<hr/>
<div class="container-fluid">
<c:forEach items="${reply.replyset }" var="childreplay">
<div class="row">
  <div class="col-xs-3 col-md-3  text-right" >${childreplay.user.name }:</div>
  <div class="col-xs-7 col-md-9 text-left">${childreplay.content }</div>
</div>
</c:forEach>
</div>
</div>
</c:forEach>

<div class="well well0">
  <div class="page-header top10">
     <div class="media">
      <div class="media-left">
      <a href="#">
      <img class="media-object" src="images/customDefu.jpeg" width="60px" height="60px" alt="...">
      </a>
      </div>
     <div class="media-body">
     <h3 class="media-heading">测试账号
     <span class="label label-default padding000">12</span>
     <span class="label label-primary padding000">LV3</span>
     <span class="glyphicon glyphicon-comment pull-right" aria-hidden="true"></span>
     </h3>
   2014-09-22 23:44:40
     </div>
     </div>
    </div>
<p>这是回复内容回复内容回复内容回复内容回复内容回复内容回复内容回复内容内容回复内容回复内容回复内容回复内容回复内容内容回复内容回复内容回复内容回复内容回复内容.ydgdgdgdg.</p>
<hr/>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom" style="opacity: 0.9">
 <div class="container">
  <div class="row">
    <div class="input-group col-xs-12" style="margin-bottom: 0">
      <div class="input-group-addon"><span class="glyphicon glyphicon-thumbs-up"></span></div>
      <input type="text" class="form-control input-lg " id="exampleInputAmount" placeholder="回复">
       <div class="input-group-btn">
        <button type="button" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;发表</button>
       </div>
    </div>
  </div>
 </div>
</nav>
	<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
        <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
    </body>

</html>

   