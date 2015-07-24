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
    <body style="padding-bottom: 40px">
   <div class="well padding0 backcolor fixtop">
    <div class="container-fluid">
	 <div class="row ">
	 <div class="col-xs-2">
	  <a class="navbar-brand" href="javascript:history.go(-1);">
     <span class="glyphicon glyphicon-menu-left" aria-hidden="true" style="color: white;"></span>
    </a>
	 </div>
	  <div class="col-xs-10 ">
		<div class="dropdown pull-right">
		  <button class="btn btn-default btn-lg dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
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
      <img class="media-object" src="${mainpost.user.headpicurl }" width="60px" height="60px" alt="...">
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
   <h4>咨询科室： <span class="label label-primary">${mainpost.dept.name}</span></h4>
   <span>发表于：<fmt:formatDate value="${mainpost.createtime}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
     </div>
     </div>
    </div>
<h3>${mainpost.title }</h3>
<div class="row">
<c:if test="${fn:length(mainpost.attepmts)>0}">
<c:forEach items="${mainpost.attepmts }" var="attempt">
  <div class="col-xs-10 col-md-4">
    <a href="#" class="thumbnail">
      <img src="${attempt.fileurl}" alt="...">
    </a>
  </div>
 </c:forEach>
</c:if>   
</div>
<p>${mainpost.content }</p>
</div> 
<!-- 回复列表 -->
<c:forEach items="${mainpost.replys }" var="reply" varStatus="i">
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
     <c:if test="${user.role=='1' || user.id ==mainpost.user.id }">
          <button type="button" class="btn btn-default pull-right" onclick="location.href='${ctx}/reply/toreplypage.action?replyid=${reply.id}'">
          <span class="glyphicon glyphicon-comment " aria-hidden="true"></span>&nbsp;回复</button>
     </c:if>
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

<c:forEach items="${reply.replyset }" var="childreplay" begin="0" end="5">
<div class="row">
  <div class="col-xs-4 col-md-3  text-right" ><span style="color: #337ab7">${childreplay.user.name }</span>:</div>
  <div class="col-xs-8 col-md-9 text-left">${childreplay.content }</div>
</div>
</c:forEach>
<c:if test="${fn:length(reply.replyset)>5}">
<p class="text-right"><a href="${ctx}/reply/toreplypage.action?replyid=${reply.id}">查看剩余${fn:length(reply.replyset)-5}条..</a></p>
</c:if>
</div>
</div>
</c:forEach>
<c:if test="${user.role=='1' || user.id ==mainpost.user.id }">
<nav class="navbar navbar-default navbar-fixed-bottom" style="opacity: 0.9">
 <div class="container">
  <div class="row">
    <div class="input-group col-xs-12" style="margin-bottom: 0">
      <div class="input-group-addon" id="addImg"><span class="glyphicon glyphicon-picture"></span></div>
      <input type="text" class="form-control input-lg" id="replycontent" placeholder="回复" />
       <div class="input-group-btn">
        <button type="button" autocomplete="off" class="btn btn-primary btn-lg" id="sendBtn" data-loading-text="回复中..."><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;回复</button>
       </div>
    </div>
  </div>
  <div id="imgdiv" >
					<input id="img1" type="file" name="imgfile" onchange="PreviewImage(this,'imgHeadPhoto1','divPreview')" style="visibility:hidden;position: absolute;" />
					<input id="img2" type="file" name="imgfile" onchange="PreviewImage(this,'imgHeadPhoto2','divPreview')" style="visibility:hidden;position: absolute;" />  
					<input id="img3" type="file" name="imgfile" onchange="PreviewImage(this,'imgHeadPhoto3','divPreview')" style="visibility:hidden;position: absolute;" />    
  </div>
  <div class="row" >
  <div class="panel panel-default" id="divPreview" style="display: none">
  <div class="panel-body">
			<div class="col-xs-6 col-md-4">
			<a href="#" class="thumbnail"> <span
				class="glyphicon glyphicon-remove-sign pull-right"
				aria-hidden="true" onclick="javascript:clearImg1()"></span> <img
				id="imgHeadPhoto1" src="${ctx }/images/add_img.png" alt=""
				onclick="javascript:$('#img1').click()" width="74px"
				height="74px" />
			</a>
			</div>
			<div class="col-xs-6 col-md-4">
			<a href="#" class="thumbnail"> <span
			class="glyphicon glyphicon-remove-sign pull-right"
				aria-hidden="true" onclick="javascript:clearImg2()"></span> <img
				id="imgHeadPhoto2" src="${ctx }/images/add_img.png" alt=""
				onclick="javascript:$('#img2').click()" width="74px"
			height="74px" />
		    </a>
		</div>
		<div class="col-xs-6 col-md-4 ">
		<a href="#" class="thumbnail"> <span
		class="glyphicon glyphicon-remove-sign pull-right"
		aria-hidden="true" onclick="javascript:clearImg3()"></span> <img
			id="imgHeadPhoto3" src="${ctx }/images/add_img.png" alt=""
		onclick="javascript:$('#img3').click()" width="74px"
		height="74px" />
			</a>
	</div>
		</div>
	</div>
</div>
	
 </div>
</nav>
</c:if>
<!-- 回复完成弹出 -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="CompleteMol">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <h1><span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>&nbsp;<small>回复成功！</small></h1>
    </div>
  </div>
</div>
<!-- 回复失败弹出 -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="unCompleteMol">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <h1><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>&nbsp;<small>回复失败！</small></h1>
    </div>
  </div>
</div>
<button class="btn btn-default dropdown-toggle" style="position: fixed;bottom: 70px;right: 10px" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" onclick="location.reload()">
     <span class="glyphicon glyphicon-refresh " aria-hidden="true"></span>
</button>
	<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
        <script src="${ctx }/js/ajaxfileupload.js"></script>
        <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
         <script src="${ctx }/js/selectImg.js"></script> 
         <script>
         $("#addImg").on('click', function () {
          $("#divPreview").slideToggle();
         });
		  $('#sendBtn').on('click', function () {
		   var flag=true;
       	   var replycontent=$("#replycontent");
       	   if($.trim(replycontent.val()) ==""){
       		replycontent.css({"color":"red"})   
       		replycontent.val('请填写回复内容');
       		$('#sendBtn').attr("disabled","disabled");
       		   setTimeout(function(){
       			replycontent.val('')
       			replycontent.css({"color":"#333"});
       			$('#sendBtn').removeAttr("disabled");
       		   },1000)
       		   flag=false;
       	   }
       	   if(flag){
		    var btn = $(this).button('loading');
		    $.ajaxFileUpload({
		    	 secureuri:false,  
		    	 fileElementId:['img1','img2','img3'],//file标签的id  
	             url:"${ctx}/reply/sendMyReply.action",
	             dataType:"json",
	             data:{postid:${mainpost.id},content:$("#replycontent").val()},
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

   