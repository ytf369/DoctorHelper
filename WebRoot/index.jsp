<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://unslider.com/unslider.js"></script>
    <style type="text/css">
   .jumbotron,.navbar{
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
      <a class="navbar-brand" href="#">导航菜单</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
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
<div class="container-fluid column">
	<div class="row-fluid column">
		<div class="span12">
			<div class="carousel slide" id="carousel-113723">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-113723">
					</li>
					<li data-slide-to="1" data-target="#carousel-113723" class="active">
					</li>
					<li data-slide-to="2" data-target="#carousel-113723">
					</li>
				</ol>
				<div class="carousel-inner column">
					<div class="item">
						<img alt="" src="images/image3.jpg" width="100%" height="600px" />
					</div>
					<div class="item active">
						<img alt="" src="images/image8.jpg"width="100%" height="600px" />
					</div>
					<div class="item">
						<img alt="" src="images/image4.jpg"width="100%" height="600px" />
					</div>
				</div> <a data-slide="prev" href="#carousel-113723" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-113723" class="right carousel-control">›</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
    $('.banner').unslider();
});
</script>
<div class="row">
  <div class="col-xs-6 ">
    <div class="thumbnail">
      <img src="images/image1.jpg" alt="..."  >
      <div class="caption">
        <h4>官方资讯</h4>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">进入</a></p>
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="thumbnail">
      <img src="images/image6.jpg" alt="..." >
      <div class="caption">
        <h4>咨询医生</h4>
        <p>...</p>
        <p><a href="login.jsp" class="btn btn-primary" role="button">进入</a></p>
      </div>
    </div>
  </div>
</div>

  </body>
</html>
