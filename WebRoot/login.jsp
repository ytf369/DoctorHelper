<%@ page language="java" import="java.util.*,com.doctorhelper.util.PropUtil" pageEncoding="UTF-8"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>会员登陆</title>

    <!-- Bootstrap -->
    <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx }/css/style.css" rel="stylesheet">
    <style type="text/css">
    </style>
  </head>
  <body style="background-color: #f5f5f5">
 <div class="well well-lg" >
  <div  class="container">
  <div class="row">
   <div class="col-xs-10 col-xs-offset-1 col-ms-6 col-ms-offset-3">
      <form class="form-horizontal" action="${ctx }/user/login.action" method="post" id="loginForm">
        <div class="page-header center top10">
        <h2 class="form-signin-heading"><small><span class="glyphicon glyphicon-user" aria-hidden="true"></span></small>&nbsp;用户登录</h2>
        </div>
        <c:if test="${loginstatus==0 }">
         <div class="alert alert-danger alert-dismissible" role="alert" id="warning-name">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>错误!</strong> 用户名或密码不正确！
          </div>
        </c:if>  
        <div class="input-group">
        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
        <label for="inputname" class="sr-only">用户名</label>
        <input type="text" id="inputname" name="loginname" class="form-control" placeholder="用户名/手机/邮箱" required=true autofocus=true aria-describedby="basic-addon1">
       </div>
       <div class="alert alert-warning alert-dismissible" role="alert" id="warning-name" style="display: none;">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>警告!</strong> 用户名不能为空！
        </div>
         <div class="input-group">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" name="password"class="form-control" placeholder="密码" required=true aria-describedby="basic-addon1">
        </div>
        <div class="alert alert-warning alert-dismissible" role="alert" id="warning-password" style="display: none;">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>警告!</strong> 密码不能为空！
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我   
          </label>
        </div>
        </form>
        <div class="login">
        <button class="btn btn-primary btn-lg btn-block" onclick="return validate()" >登陆</button>
        </div>
        <div class="login top10">
        <button type="button" class="btn btn-success btn-lg btn-block"
         onclick="window.location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=<%=PropUtil.getValue("appid")%>&redirect_uri=http%3a%2f%2fdoctorhelper.tunnel.mobi%2fDoctorHelper%2fuser%2fentermain.action&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect'">
        <span class="glyphicon glyphicon-phone" aria-hidden="true">
        </span>微信自动登陆</button>
        </div>
   </div>
 </div>
</div>
</div>
<script type="text/javascript">
function validate(){
	var uname=$("#inputname").val();
	var upwd=$("#inputPassword").val();
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
	$("#loginForm").submit();
	return true;
}
</script>
<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>
