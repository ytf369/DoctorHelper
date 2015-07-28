<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>健康助手</title>   
        <!-- Bootstrap -->
        <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
        <link href="${ctx }/css/style.css" rel="stylesheet">
        <!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
        .well{ margin-bottom: 0  }
        </style>
    </head>
    <body>
<nav class="navbar navbar-default navbar-inverse fixtop">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="javascript:history.go(-1);">
     <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
    </a> 
      <a  class="navbar-brand" style="padding-top: 5px" href="#">
      <img alt="..." src="${user.headpicurl }" width="40px" height="40px" class="img-circle">
      </a>
      <a  class="navbar-brand" href="#" style="padding-left: 0" role="button" data-toggle="popover" data-trigger="focus" title="欢迎您！" data-content="${user.loginname }">
      <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
      </a>
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${ctx}/user/entermain.action"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;首页</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
    <!-- 面板样式1 -->
    <div class="panel panel-primary" style="margin-top: 60px">
    <c:if test="${poststate=='toPostList' }"><div class="panel-heading"><span class="glyphicon glyphicon-time" ></span>&nbsp;最近发表
        <button type="button" class="btn btn-primary pull-right" style="margin-top: -5px" onclick="window.location.href='${ctx}/post/publishMyPost.action'">
                  <span class="glyphicon glyphicon-question-sign"></span>&nbsp;我要提问
      </button>
     </div>
    </c:if>
     <c:if test="${poststate=='myposts' }"><div class="panel-heading"><span class="glyphicon glyphicon-edit" ></span>&nbsp;我的提问
     <button type="button" class="btn btn-primary pull-right" style="margin-top: -5px" onclick="window.location.href='${ctx}/post/publishMyPost.action'">
              <span class="glyphicon glyphicon-question-sign"></span>&nbsp;我要提问
      </button>
     </div></c:if>
      <div class="panel-body">
       <ul class="media-list">
       <c:forEach items="${pagerows.list}" var="post">
        <li class="media top0" onclick="window.location.href='${ctx}/post/viewDetail.action?id=${post.id }'">
        <div class="well">
         <div class="media-left media-middle">
           <a href="#">
           <img class="media-object" src="${post.user.headpicurl }" alt="..." width="64px" height="64px">
           </a>
         </div>
         <div class="media-body">
          <h4 class="media-heading">${post.title}
          <c:if test="${fn:length(post.attepmts)>0}">
          <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
          </c:if>
          <span class="badge pull-right">${fn:length(post.replys)}</span></h4>
                   ${fn:substring(post.content, 0, 15) }
                   <c:if test="${fn:length(post.content)>=15} ">...</c:if>
                   <p><span class="label label-primary">${post.dept.name}</span>
                   <span class="label label-default pull-right" ><fmt:formatDate value="${post.createtime}" pattern="yyyy-MM-dd hh:mm:ss"/> </span></p>
         </div>
         </div>
        </li>
       </c:forEach>
      </ul>
		<nav class="text-center">
		  <ul class="pagination pagination">
		  <c:choose>
		  <c:when test="${currentpage==1 }">
		    <li class="disabled">
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">上一页</span>
		      </a>
		    </li>
		    </c:when>
		    <c:otherwise>
		     <li>
		      <a href="${ctx}/post/${poststate}.action?pagenum=${currentpage-1 }&size=4" aria-label="Previous">
		        <span aria-hidden="true">上一页</span>
		      </a>
		    </li>
		    </c:otherwise>
		   </c:choose>
		    <c:forEach  var="pagenum"  begin="${beginPage}" 
		                               end="${endPage}"> 
		    <c:choose>
		    <c:when test="${pagenum==currentpage }">
		    <li class="active"><a  href="${ctx}/post/${poststate}.action?pagenum=${pagenum }&size=4">${pagenum}</a></li>
		    </c:when>
		    <c:otherwise>
		     <li><a href="${ctx}/post/${poststate}.action?pagenum=${pagenum }&size=4">${pagenum}</a></li>
		    </c:otherwise>
		    </c:choose>
		    </c:forEach>
		    <c:choose>
		    <c:when test="${pagerows.rows<=currentpage}">
		    <li class="disabled">
		      <a  aria-label="Next">
		        <span aria-hidden="true">下一页</span>
		      </a>
		    </li>
		    </c:when>
		    <c:otherwise>
		      <li>
		      <a href="${ctx}/post/${poststate}.action?pagenum=${currentpage+1 }&size=4" aria-label="Next">
		        <span aria-hidden="true">下一页</span>
		      </a>
		    </li>
		    </c:otherwise>
		    </c:choose>
		  </ul>
		</nav>
      </div>
  
     </div>
<hr>
<div class="btn-group btn-group-justified  navbar-fixed-bottom" role="group" aria-label="...">
  <div class="btn-group btn-group-lg" role="group">
    <c:choose>
    <c:when test="${poststate=='toPostList'}">
    <button type="button" class="btn btn-primary" onclick="location.href='${ctx}/post/toPostList.action?pagenum=1&size=4&lately=lately'">
    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>最近发表<c:if test="${latelypublicpostsCount>0 }"><span class="badge" style="position:relative;top: -15px;left: -15px "> ${latelypublicpostsCount }</span></c:if></button>
    </c:when>
    <c:otherwise>
    <button type="button" class="btn btn-default" onclick="location.href='${ctx}/post/toPostList.action?pagenum=1&size=4&lately=lately'"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>最近发表<c:if test="${latelypublicpostsCount>0 }"><span class="badge">${latelypublicpostsCount }</span></c:if></button>
    </c:otherwise>
    </c:choose>
  </div>
  <div class="btn-group btn-group-lg" role="group">
    <button type="button" class="btn btn-default" onclick="location.reload()"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>刷新</button>
  </div>
  
  <div class="btn-group btn-group-lg" role="group">
   <c:choose>
    <c:when test="${poststate=='myposts'}">
    <button type="button" class="btn btn-primary" onclick="location.href='${ctx}/post/myposts.action?pagenum=1&size=4&lately=lately'"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>我的提问 <c:if test="${mylatelypostCount>0 }"><span class="badge">${mylatelypostCount }</span></c:if></button>
    </c:when>
    <c:otherwise>
    <button type="button" class="btn btn-default" onclick="location.href='${ctx}/post/myposts.action?pagenum=1&size=4&lately=lately'"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>我的提问 <c:if test="${mylatelypostCount>0 }"><span class="badge">${mylatelypostCount }</span></c:if></button>
    </c:otherwise>
    </c:choose>
  </div>
</div>
      
	<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
        <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
        <script type="text/javascript">
        $(function () {
        	  $('[data-toggle="popover"]').popover()
        	})
        </script>
    </body>
</html>