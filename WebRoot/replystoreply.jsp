<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>回复：${reply.user.name}</title>   
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
<!-- 回复列表 -->
<div class="well well0">
  <div class="page-header top10">
     <div class="media">
      <div class="media-left">
      <a href="#">
      <img class="media-object" src="${reply.user.headpicurl }" width="60px" height="60px" alt="...">
      </a>
      </div>
     <div class="media-body">
     <h3 class="media-heading">${reply.user.name }
     <span class="label label-default padding000">
       <c:if test="${reply.user.sex=='2'}">
            女
     </c:if>
       <c:if test="${reply.user.sex=='1'}">
            男
     </c:if>
  </span>
     <span class="label label-primary padding000">${reply.user.country }</span>
     </h3>
   ${reply.createtime }
     </div>
     </div>
    </div>
<p>${reply.content }</p>
<c:if test="${fn:length(reply.attepmts)>0}">
<c:forEach items="${reply.attepmts }" var="attemptrep">
  <div class="col-xs-10 col-md-4">
    <a href="#" class="thumbnail">
      <img src="${attemptrep.fileurl}" alt="...">
    </a>
  </div>
 </c:forEach>
</c:if>
<c:if test="${fn:length(reply.replyset)>0}">
<hr/>
</c:if>
<div class="container-fluid">
<c:forEach items="${reply.replyset }" var="childreplay">
<div class="row">
  <div class="col-xs-3 col-md-3  text-right" style="color: #337ab7">${childreplay.user.name }:</div>
  <div class="col-xs-7 col-md-9 text-left">${childreplay.content }</div>
</div>
</c:forEach>
</div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom" style="opacity: 0.9">
 <div class="container">
  <div class="row">
    <div class="input-group col-xs-12" style="margin-bottom: 0">
      <div class="input-group-addon"><span class="glyphicon glyphicon-thumbs-up"></span></div>
      <input type="text" class="form-control input-lg " id="replycontent" placeholder="回复">
       <div class="input-group-btn">
        <button type="button" autocomplete="off" class="btn btn-primary btn-lg" id="sendBtn" data-loading-text="回复中..."><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;回复</button>
       </div>
    </div>
  </div>
 </div>
</nav>
<!-- 回复完成弹出 -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="CompleteMol">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <h1><span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>&nbsp;回复成功！</h1>
    </div>
  </div>
</div>
<!-- 回复失败弹出 -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="unCompleteMol">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <h1><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>&nbsp;回复失败！</h1>
    </div>
  </div>
</div>

	<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
        <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
        <script>
		  $('#sendBtn').on('click', function () {
			   var flag=true;
	       	   var replycontent=$("#replycontent");
	       	   if($.trim(replycontent.val()) ==""){
	       		replycontent.css({"color":"red"})   
	       		replycontent.val('请填写回复内容')
	       		   setTimeout(function(){
	       			replycontent.val('')
	       			replycontent.css({"color":"#333"})  
	       		   },1000)
	       		   flag=false;
	       	   }
		    var btn = $(this).button('loading');
		    if(flag){
		    $.ajax({
	        	 async:false,
	             type: "post",
	             url:"${ctx}/reply/sendMyReplyToReply.action",
	             dataType:"json",
	             data:{replyid:${reply.id},content:$("#replycontent").val()},
	             success: function(data){
	            	if(data.code==1){
	            		  $("#CompleteMol").modal('show');
	           		   //回复成功加载，1秒后消失
	           		   setTimeout(function(){
	           			   $("#CompleteMol").modal('hide');
	           			   btn.button('reset');
	           			   location.reload();
	           		   }, 1000);
	            	}else {
	            		  $("#unCompleteMol").modal('show');
		           		   //回复失败加载，1秒后消失
		           		   setTimeout(function(){
		           			   $("#unCompleteMol").modal('hide');
		           			   btn.button('reset');
		           			   location.reload();
		           		   }, 1000);
	            	}
	             }
	         });
		    }
		  })
		</script>
    </body>

</html>

   