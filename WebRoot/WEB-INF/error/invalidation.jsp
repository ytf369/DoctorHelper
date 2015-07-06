<%@ page language="java" import="java.util.*,com.doctorhelper.util.PropUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>失效</title>
    <!-- Bootstrap -->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="alert alert-warning" role="alert">
<strong>警告!</strong> 授权状态已失效，需要
  <a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=<%=PropUtil.getValue("appid")%>&redirect_uri=http%3a%2f%2fdoctorhelper.tunnel.mobi%2fDoctorHelper%2fuser%2fentermain.action&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect" class="alert-link"><kbd>微信重新授权登陆</kbd></a>
</div>
</body>
</html>