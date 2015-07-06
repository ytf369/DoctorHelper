<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>账号绑定</title>

    <!-- Bootstrap -->
    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/style.css" rel="stylesheet">
    <style type="text/css">
    </style>
  </head>
  <body style="background-color: #f5f5f5">
 <div class="well well-lg" >
  <div  class="container">
  <div class="row">
   <div class="col-xs-12 ">
      <form class="form-horizontal" action="user/bind.action" id="bindform" method="post">
        <div class="page-header center top10">
        <h2 class="form-signin-heading"><small><span class="glyphicon glyphicon-user" aria-hidden="true"></span></small>&nbsp;用户绑定</h2>
        </div>
        <div class="input-group has-success">
        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
        <label for="inputname" class="sr-only">昵称</label>
        <input type="text" id="inputname" name="name" class="form-control input-lg" placeholder="昵称" required=true autofocus=true aria-describedby="basic-addon1">
       </div>
       <div class="alert alert-warning alert-dismissible" role="alert" id="warning-name" style="display: none;">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>警告!</strong> 用户名不能为空！
        </div>
         <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <label for="inputpassword" class="sr-only">密码</label>
        <input type="password" id="inputpassword" name="password" class="form-control input-lg" placeholder="密码" required=true aria-describedby="basic-addon1">
        </div>
        <div class="alert alert-warning alert-dismissible" role="alert" id="warning-password" style="display: none;">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>警告!</strong> 密码不能为空！
        </div>
         <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <label for="inputrepassword" class="sr-only">确认密码</label>
        <input type="password" id="inputrepassword" class="form-control input-lg" placeholder="确认密码" required=true aria-describedby="basic-addon1">
        </div>
         <div class="alert alert-warning alert-dismissible" role="alert" id="warning-repassword" style="display: none;">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>警告!</strong> 密码不一致！
        </div>
       <div class="well padding5">
       <span class="glyphicon glyphicon-warning-sign"></span>
       <footer>用户绑定微信号后，才可在PC端登陆，进行提问和评论！</footer>
       </div>
        <div class="login">
       
       <button class="btn btn-success btn-lg btn-block" type="button" onclick="return validate()">
       <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>&nbsp;     
                   绑定</button>
        </div>
         <div class="login">
         
        <button class="btn btn-info btn-lg btn-block top10" type="button" onclick="window.location.href='${ctx}/user/entermain.action'"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>&nbsp;跳过，下次绑定</button>
        </div>
      </form>

   </div>
 </div>
</div>
</div>
<script type="text/javascript">
function validate(){
	var uname=$("#inputname").val();
	var upwd=$("#inputpassword").val();
	var repwd=$("#inputrepassword").val();
	if(uname==''){
		$("#warning-name").show("4000",function(){
			$("#warning-name").hide("slow");
			 });
		return false;
	}
	if(upwd==''){
		$("#warning-password").show("4000",function(){
			$("#warning-password").hide("slow");
			 });
		return false;
	}
	if(upwd!=repwd){
		$("#warning-repassword").show("4000",function(){
			$("#warning-repassword").hide("slow");
			 });
		return false;
	}
	$("#bindform").submit();
	return true;
}
</script>
  </body>
</html>
