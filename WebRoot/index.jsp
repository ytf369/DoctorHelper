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
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://unslider.com/unslider.js"></script>
    <style type="text/css">
   .jumbotron,.navbar,.alert{
    margin-bottom:2px;
    }
    .row{
    margin-right:2px; 
    margin-left:2px; 
    }
    .col-xs-6{
   padding-right: 2px;
   padding-left: 2px;
    }
    .jumbotron{
    background-color: #24a78b
    }
    .navbar-default{
    background-color: #65c1ae;
    border-color: #65c1ae
    }
    .container-fluid{
   padding-left: 0;
   padding-right: 0;
   overflow-x: hidden;
    }
  .span12 .carousel-inner,.carousel-inner .item img{
  height: 15em;
    }
  .thumbnail{
  margin-bottom: 5px;
  text-align: center;
  }
    </style>
  </head>
  
  <body>
  <!-- 导航开始 -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>导航菜单</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a  href="${ctx}/user/entermain.action"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;首页 <span class="sr-only">(current)</span></a></li>
        <li><a href="${ctx}/user/findUserinfo.action"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;个人中心</a></li>
        <li><a href="${ctx}/post/toPostList.action?pagenum=1&size=4"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;医生咨询</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- 导航结束 -->
 <!--  <div class="jumbotron">
  <h1>欢迎进入医生咨询</h1>
  <p>快来发帖，请医生帮忙吧！</p>
  <p><a class="btn btn-primary btn-lg" href="#" role="button">关于更多..</a></p>
</div>
 --> 
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="${ctx }/images/image3.jpg" alt="..." width="1280px" height="600px">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
       <img src="${ctx }/images/image4.jpg" alt="..." width="1280px" height="600px">
      <div class="carousel-caption">
        ...
      </div>
    </div>
     <div class="item">
       <img src="${ctx }/images/image8.jpg" alt="..." width="1280px" height="600px">
      <div class="carousel-caption">
        ...
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<script type="text/javascript">
$(function() {
    $('.banner').unslider();
});
</script>
<c:choose>
<c:when test="${isAuthed==true }"> 
<div class="alert alert-success " role="alert">
<strong><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span></strong> 
微信已授权登陆
</div>
</c:when>
<c:otherwise>
<div class="alert alert-warning" role="alert">
<strong>警告!</strong> 
 你处于未认证状态！
</div>
</c:otherwise>
</c:choose>

<div class="row">
  <div class="col-xs-6 ">
    <div class="thumbnail">
    <h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span></h3>  
      <div class="caption">
        <h4>个人信息</h4>
        <p>...</p>
        <p><a href="${ctx}/user/findUserinfo.action" class="btn btn-primary" role="button">查看</a></p>
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="thumbnail">
      <h3><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></h3>  
      <div class="caption">
        <h4>咨询医生</h4>
        <p>...</p>
        <p><a href="${ctx}/post/toPostList.action?pagenum=1&size=4&lately=lately" class="btn btn-primary" role="button">进入咨询</a></p>
      </div>
    </div>
  </div>
</div>
<!-- 第二行 -->
<div class="row">
  <div class="col-xs-6 ">
    <div class="thumbnail">
    <h3><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></h3>  
    <c:choose>
    <c:when test="${user.isbinded=='1' }">
    <div class="caption">
    <h4>账号绑定</h4>
    <p>您已绑定的账号为：<br/><kbd>${user.loginname}</kbd> </p>
    
    <p><a href="${ctx}/accountbind.jsp" class="btn btn-primary" role="button">重新绑定</a></p>
    </div>
    </c:when>
    <c:otherwise>
    <div class="caption">
        <h4>绑定账号</h4>
        <p>只有绑定账号后，您才可以在PC端登陆..</p>
        <p><a href="${ctx}/user/toBinduser.action" class="btn btn-primary" role="button">进入</a></p>
      </div>
    </c:otherwise>
    </c:choose>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="thumbnail">
      <h3><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></h3>  
      <div class="caption">
      <h4>修改密码</h4>
      <p>修改密码，以确保账号的安全....</p>
      <p><a  onclick="valimodifypwd()"   class="btn btn-primary" role="button">进入</a></p>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" charset="utf-8">
function valimodifypwd(){
	$.ajax({
		   async:false,
		   type: "post",
		   url: "${ctx}/user/checkisbinded.action",
		   dataType: "json",
		   success: function(msg){
			   if(msg.code==1){
				  location.href="${ctx}/user/toMidifyPwd.action"
			   }
			   else{
				   alert(msg.text)
			   }
		   }
		});
}
</script>
  </body>
</html>
