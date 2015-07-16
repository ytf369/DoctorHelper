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
    <title>修改密码</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/css/default.css">
    <link rel="stylesheet" href="${ctx}/css/default.date.css">
    <!-- Bootstrap -->
    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <style type="text/css">
    .error{
    color: red
    }
    </style>
  </head>
  <body style="background-color: #f5f5f5">
 <div class="well well-lg" >
 <div class="alert alert-success alert-dismissible" role="alert" id="successalert" style="display: none">
  <strong>修改成功</strong> 下次登录生效！您可以<a href="${ctx}/user/entermain.action">返回首页</a>,或<a href="${ctx}/login.jsp">重新登录</a>
  </div>
   <div class="alert alert-warning alert-dismissible" role="alert" id="faliedalert" style="display: none">
  <strong>修改失败</strong> 未知原因！<a href="${ctx}/user/toMidifyPwd.action">重新修改</a>或，<a href="${ctx}/user/entermain.action">返回首页</a>
  </div>
  <div  class="container">
  <div class="row">
   <div class="col-xs-12 col-md-6 col-md-offset-3">
      <form class="form-horizontal" action="user/modifyPwd.action" id="form0" method="post">
        <div class="page-header center top10">
        <h2 class="form-signin-heading"><small><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></small>&nbsp;修改密码</h2>
        </div>
        <span class="error"></span>
        <div class="input-group has-success">
        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock"></span></span>
        <input type="password" id="oldpwd" name="oldpwd" class="form-control" placeholder="请输入旧密码" required=true autofocus=true aria-describedby="basic-addon1">
       </div>
        <span class="error"></span>
         <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <input type="password" id="inputpassword" name="newpwd" class="form-control" placeholder="新密码" required=true aria-describedby="basic-addon1">
        </div>
        <span class="error"></span>
         <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <input type="password" id="inputrepassword" class="form-control" placeholder="确认新密码" required=true aria-describedby="basic-addon1">
        </div>
        <div class="login">
       
       <button class="btn btn-success btn-lg btn-block" type="button" onclick="return modifypwdValidate()">
       <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;     
                   确定</button>
        </div>
         <div class="login">
         
        <button class="btn btn-info btn-lg btn-block top10" type="button" onclick="window.location.href='${ctx}/user/entermain.action'"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;取消</button>
        </div>
      </form>

   </div>
 </div>
</div>
</div>
<script src="${ctx}/js/myvalidate.js"></script>
<script type="text/javascript">
//function showalert(){
//	$("#successalert").show('fast')
//}
//验证旧密码是否正确
function validateOldpwd(){
	var flag=true;
	var oldpwd=$("#oldpwd");
	$.ajax({
		   async:false,
		   type: "post",
		   url: "${ctx}/user/checkOldpwd.action",
		   data: {oldpwd:oldpwd.val() },
		   dataType: "json",
		   success: function(msg){
			   if(msg.code==0){
				   oldpwd.parent().prev().text('旧密码不正确'); 
				   flag=false;
			   }
			   else{
				   oldpwd.parent().prev().text(''); 
				   flag=true;  
			   }
		   }
		});
	return flag;
}
function modifypwdValidate(){
	$(".error").text('');
	if(validateOldpwd()&&validtepassword()&&validtepasswordAg()){
		var newpwd=$('#inputpassword').val();
		$.ajax({
			   async:false,
			   type: "post",
			   url: "${ctx}/user/modifyPwd.action",
			   data: {newpwd:newpwd},
			   dataType: "json",
			   success: function(msg){
				   if(msg.code==1){
					   $("#successalert").show('fast');
				   }
				   else{
					   $("#faliedalert").show('fast');
				   }
			   }
			});
		return true;
	}
	return false;
}
</script>
  </body>
</html>
