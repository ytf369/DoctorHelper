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
        <title>咨询列表</title>   
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
        </style>
    </head>
    <body>
    <!-- 面板样式1 -->
    <div class="panel panel-primary">
     <div class="panel-heading">咨询列表1</div>
      <div class="panel-body">
       <ul class="media-list">
        <li class="media top10" onclick="window.location.href='answer.jsp'">
        <div class="well">
         <div class="media-left media-middle">
           <a href="#">
           <img class="media-object" src="images/customDefu.jpeg" alt="..." width="64px" height="64px">
           </a>
         </div>
         <div class="media-body">
          <h4 class="media-heading">咨询标题 <span class="badge">14</span></h4>
                       资讯内容  资讯内容  资讯内容  资讯内容...  资讯内容  资讯内容  资讯内容  资讯内容...  资讯内容  资讯内容  资讯内容  资讯内容...
         </div>
         </div>
        </li>
         <li class="media top10">
         <div class="well">
         <div class="media-left media-middle">
           <a href="#">
           <img class="media-object" src="images/customDefu.jpeg" alt="..." width="64px" height="64px">
           </a>
         </div>
         <div class="media-body">
          <h4 class="media-heading">咨询标题 <span class="badge">14</span></h4>
                       资讯内容  资讯内容  资讯内容  资讯内容...  资讯内容  资讯内容  资讯内容  资讯内容...  资讯内容  资讯内容  资讯内容  资讯内容...
         </div>
         </div>
        </li>
         <li class="media top10">
         <div class="well">
         <div class="media-left media-middle">
           <a href="#">
           <img class="media-object" src="images/customDefu.jpeg" alt="..." width="64px" height="64px">
           </a>
         </div>
         <div class="media-body">
          <h4 class="media-heading">咨询标题 <span class="badge">14</span></h4>
                       资讯内容  资讯内容  资讯内容  资讯内容...  资讯内容  资讯内容  资讯内容  资讯内容...  资讯内容  资讯内容  资讯内容  资讯内容... 
         </div>
         </div>
        </li>
      </ul>
		<nav style="margin-left: 64px">
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="active"><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
      </div>
      <div class="panel-footer">
      <button type="button" class="btn btn-primary" onclick="window.location.href='ask.jsp'">
                   我要提问
      </button>
      </div>
     </div>
    <!-- 面板样式2 -->
      <div class="panel panel-default">
         <div class="panel-heading">
         <h3 class="panel-title">咨询列表2</h3>
         </div>
      <div class="panel-body">
       <div class="list-group">
        
        <a href="#" class="list-group-item active">
        <span class="badge">11</span>
        <img  class="media-object pull-left right20" src="images/customDefu.jpeg" alt="..." width="40px" height="40px">
        <h4 class="list-group-item-heading">咨询标题</h4>
         <p class="list-group-item-text">但是啥地方地方地方地方地方</p>
        </a>
         <a href="#" class="list-group-item ">
          <span class="badge">14</span>
        <h4 class="list-group-item-heading">咨询标题</h4>
         <p class="list-group-item-text">但是啥地方地方地方地方地方</p>
        </a>
         <a href="#" class="list-group-item">
        <h4 class="list-group-item-heading">咨询标题</h4>
         <p class="list-group-item-text">但是啥地方地方地方地方地方</p>
        </a>
       </div>
		<nav>
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li class="active"><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
     </div>
     <div class="panel-footer"><button type="button" class="btn btn-primary">我要提问</button></div>
     </div>
<!-- 面板样式3 -->
<div class="panel panel-primary">
         <div class="panel-heading">
         <h3 class="panel-title">咨询列表3</h3>
         </div>
      <div class="panel-body">
			<div class="panel-group" id="accordion">
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h4 class="panel-title">
			        <a data-toggle="collapse" data-parent="#accordion" 
			          href="#collapseOne">
			          咨询标题  咨询标题  咨询标题   
			        </a>
			        <span class="badge pull-right">14</span>
			      </h4>
			    </div>
			    <div id="collapseOne" class="panel-collapse collapse in">
			      <div class="panel-body">
			         咨询内容11  咨询内容11  咨询内容11 咨询内容11
			      </div>
			    </div>
			  </div>
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h4 class="panel-title">
			        <a data-toggle="collapse" data-parent="#accordion" 
			          href="#collapseTwo">
			            咨询标题  咨询标题  咨询标题  咨询标题2
			        </a>
			      </h4>
			    </div>
			    <div id="collapseTwo" class="panel-collapse collapse">
			      <div class="panel-body">
			       咨询内容22      咨询内容22      咨询内容22      咨询内容22      咨询内容22
			      </div>
			    </div>
			  </div>
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h4 class="panel-title">
			        <a data-toggle="collapse" data-parent="#accordion" 
			          href="#collapseThree">
			           咨询标题  咨询标题  咨询标题  咨询标题3
			        </a>
			      </h4>
			    </div>
			    <div id="collapseThree" class="panel-collapse collapse">
			      <div class="panel-body">
			        咨询标题  咨询标题  咨询标题  咨询标题  咨询标题  咨询标题  咨询标题 咨询标题33
			      </div>
			    </div>
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