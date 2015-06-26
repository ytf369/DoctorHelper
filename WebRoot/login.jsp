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
    <title>会员登陆</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style type="text/css">
    </style>
  </head>
  <body style="background-color: #f5f5f5">
 <div class="well well-lg" >
  <div  class="container">
  <div class="row">
   <div class="col-xs-10 col-xs-offset-1">
      <form class="form-horizontal" action="topicList.jsp">
        <div class="page-header center top10">
        <h2 class="form-signin-heading"><small><span class="glyphicon glyphicon-user" aria-hidden="true"></span></small>&nbsp;用户登录</h2>
        </div>
        <div class="input-group">
        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
        <label for="inputname" class="sr-only">用户名</label>
        <input type="text" id="inputname" class="form-control" placeholder="用户名/手机/邮箱" required=true autofocus=true aria-describedby="basic-addon1">
       </div>
         <div class="input-group">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="密码" required=true aria-describedby="basic-addon1">
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我   
          </label>
          <p class="text-right"><a href="register.jsp">没有账号？去注册</a></p>
        </div>
        <div class="login">
        <button class="btn btn-success btn-lg btn-block" type="submit" >登陆</button>
        </div>
      </form>
   </div>
 </div>
</div>
</div>
<script type="text/javascript">

</script>
  </body>
</html>
