<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
        <link href="${ctx }/css/style.css" rel="stylesheet">
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
        <h3><small>
             <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
            </small>&nbsp;发表
           <c:if test="${user.role=='1' }">话题</c:if>
           <c:if test="${user.role=='0' }">提问 </c:if>
        </h3>
          </div>
			  <div class="row">
			  <div  class="col-xs-8 col-xs-offset-2">
				<form role="form" id="publishForm" method="post">
				    <div class="form-group" id="titlediv">
						<label for="title">标题：</label> <input type="text" name="title"
							class="form-control" id="title" placeholder="请输入标题" required>
					</div>
					<div class="form-group">
						<label>选择类型：</label>
					      <select class="form-control" name="dept">
					      <c:forEach items="${depts }" var="dept">
					         <option value="${dept.name }">${dept.name }</option>
					         </c:forEach>
					      </select>
					</div>
					<div class="form-group" id="contentdiv">
						<label for="name">内容</label>
                        <textarea class="form-control" rows="6" placeholder="请输入0-255内容" name="content" required id="content"></textarea>
					</div>
					<div class="form-group">
						<h3><span id="addImg" class="glyphicon glyphicon-picture"></span></h3>
					</div>
					<div class="form-group" id="imgdiv" >
					<input id="img1" type="file" name="imgfile" onchange="PreviewImage(this,'imgHeadPhoto1','divPreview')" style="visibility:hidden;position: absolute;" />
					<input id="img2" type="file" name="imgfile" onchange="PreviewImage(this,'imgHeadPhoto2','divPreview')" style="visibility:hidden;position: absolute;" />  
					<input id="img3" type="file" name="imgfile" onchange="PreviewImage(this,'imgHeadPhoto3','divPreview')" style="visibility:hidden;position: absolute;" />    
					</div>
					<div class="form-group" >
					  <div class="panel panel-default" id="divPreview" style="display: none">
					  <div class="panel-body">
							  <div class="col-xs-12 col-md-4" >
							    <a href="#" class="thumbnail">
							     <span class="glyphicon glyphicon-remove-sign pull-right" aria-hidden="true" onclick="javascript:clearImg1()"></span>
							     <img id="imgHeadPhoto1" src="${ctx }/images/add_img.png"   alt="" onclick="javascript:$('#img1').click()" width="74px" height="74px"/> 
							    </a>
							  </div>
							  <div class="col-xs-12 col-md-4" >
							    <a href="#" class="thumbnail">
							    <span class="glyphicon glyphicon-remove-sign pull-right" aria-hidden="true" onclick="javascript:clearImg2()"></span>
							     <img id="imgHeadPhoto2" src="${ctx }/images/add_img.png"   alt="" onclick="javascript:$('#img2').click()" width="74px" height="74px"/> 
							    </a>
							  </div>
							    <div class="col-xs-12 col-md-4 ">
							    <a href="#" class="thumbnail">
							    <span class="glyphicon glyphicon-remove-sign pull-right" aria-hidden="true" onclick="javascript:clearImg3()"></span>
					            <img id="imgHeadPhoto3" src="${ctx }/images/add_img.png"   alt="" onclick="javascript:$('#img3').click()"width="74px" height="74px"/>   
							    </a>
							  </div>
							</div>
					</div>
					</div>  
				    <div class="form-group">
				    <label>是否公开：</label>
			             <select class="form-control" name="ispublic">
							  <option value="on">公开</option>
							  <option value="off">私密</option>
							</select>
			         </div>
					<div class="center top10">
					<button type="button" class="btn btn-success btn-md btn-block" id="publishbtn">发表</button>
					</div>
				</form>
			</div>
		   </div>
      </div>
</div>
<!-- 隐藏的模态窗 -->
<div class="modal fade" id="successModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>发表成功！</h4>
      </div>
      <div class="modal-body">
        <h3><small>您可以</small><u><a onclick="$('#successModal').modal('hide');">继续发表</a>
        </u><small>或</small><u><a href="${ctx }/post/toPostList.action?pagenum=1&size=4">返回浏览</a></u></h3>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 隐藏的模态窗 -->
<div class="modal fade" id="LoadingModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <img alt="" src="${ctx}/images/Loading.gif" width="200px" height="200px">发表中...
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 隐藏的模态窗 -->
<div class="modal fade" id="failedModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true">抱歉，发表失败！</h4>
      </div>
      <div class="modal-body">
       <h3><small>您可以</small><u><a onclick="$('#faliedModal').modal('hide');">继续发表</a>
       </u><small>或</small><u><a href="${ctx }/post/toPostList.action?pagenum=1&size=4">返回浏览</a></u></h3>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
          <script src="${ctx }/js/ajaxfileupload.js"></script>
        <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
        <script src="${ctx }/js/bootstrap-switch.min.js"></script>
        <script src="${ctx }/js/selectImg.js"></script> 
        <script type="text/javascript">
           $("#addImg").on('click', function () {
            $("#divPreview").slideToggle();
           });
           $("#publishbtn").on("click", function(){
        	   var flag=true;
        	   var title=$("#title").val();
        	   var content=$("#content").val();
        	   if($.trim(title) ==""){
        		   $("#titlediv").addClass('has-error');
        		   setTimeout(function(){
        			   $("#titlediv").removeClass('has-error');
        		   },1000)
        		   flag=false;
        	   }
        	   if($.trim(content) ==""){
        		   $("#contentdiv").addClass('has-error');
        		   setTimeout(function(){
        			   $("#contentdiv").removeClass("has-error");
        		   },1000)
        		   flag=false;
        	   }
        	   var param=$("#publishForm").serialize();
    		  if(flag){
    			  $('#LoadingModal').modal('show');
    			  $.ajaxFileUpload({  
    		            url:'${ctx}/post/savePost.action',  
    		            secureuri:false,  
    		            fileElementId:['img1','img2','img3'],//file标签的id  
    		            dataType:'json',//返回数据的类型  
    		            data:{
    		            	title:$(":input[name='title']").val(),
    		            	content:$(":input[name='content']").val(),
    		            	dept:$(":input[name='dept']").val(),
    		            	ispublic:$(":input[name='ispublic']").val(),
    		            } ,
    	                success: function(data){
    	            	if(data.code==1){
    	            		$('#LoadingModal').modal('hide');
    	            		$('#successModal').modal('show');
    	            		$("#publishForm")[0].reset();
    	            		flag=true;
    	            	}else {
    	            		$('#faliedModal').modal('show');
    	            	}
    	             }
    	         });
    		  }
           });
        </script>
    </body>
</html>