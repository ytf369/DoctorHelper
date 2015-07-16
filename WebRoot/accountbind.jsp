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
  <div  class="container">
  <div class="row">
   <div class="col-xs-12 col-md-6 col-md-offset-3">
      <form class="form-horizontal" action="user/bind.action" id="bindform" method="post">
        <div class="page-header center top10">
        <h2 class="form-signin-heading"><small><span class="glyphicon glyphicon-user" aria-hidden="true"></span></small>&nbsp;用户绑定</h2>
        </div>
        <span class="error"></span>
        <div class="input-group has-success">
        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
        <label for="inputname" class="sr-only">昵称</label>
        <input type="text" id="inputname" name="loginname" class="form-control" placeholder="昵称" required=true autofocus=true aria-describedby="basic-addon1" onblur="vallidatenameisused()">
       </div>
        <span class="error"></span>
         <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-tag"></span></span>
        <label for="realname" class="sr-only"></label>
        <input type="text" id="realname" name="realname" class="form-control" placeholder="真实姓名" required=true aria-describedby="basic-addon1">
        </div>
           <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-calendar"></span></span>
        <label for="birthday" class="sr-only">出生年月</label>
        <input type="text" id="birthday" name="birthday" class="form-control" placeholder="出生年月" required=true aria-describedby="basic-addon1">
        </div>
           <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-list-alt"></span></span>
        <label for="idcard" class="sr-only">证件号</label>
        <input type="text" id="idcard" name="idcard" class="form-control" placeholder="身份证号" required=true aria-describedby="basic-addon1">
        </div>
        <span class="error"></span>
           <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-phone"></span></span>
        <label for="phone" class="sr-only">手机</label>
        <input type="text" id="phone" name="phone" class="form-control" placeholder="手机" required=true aria-describedby="basic-addon1">
        </div>
        <div class="input-group has-success col-xs-12 ">
        <label for="name" class="has-success"><span class="glyphicon glyphicon-home"></span>&nbsp;选择社区：</label>
        <select class="form-control input-group has-success" name="community">
		  <option>社区1</option>
		  <option>社区2</option>
		  <option>社区3</option>
		  <option>社区4</option>
		  <option>社区5</option>
        </select>
        </div>
      <!--   <div class="input-group col-xs-12">
         <select class="form-control input-group">
		  <option>二级社区11</option>
		  <option>二级社区12</option>
		  <option>二级社区13</option>
		  <option>二级社区14</option>
		  <option>二级社区15</option>
        </select>
        </div> -->
         <div class="input-group has-success col-xs-12 ">
        <label for="name" class="has-success"><span class="glyphicon glyphicon-hand-right"></span>&nbsp;您是：</label>
        <select class="form-control input-group has-success" name="role">
		  <option value="0">就诊者</option>
		  <option value="0">社区医生</option>
		  <option value="1">专家医生</option>
        </select>
        </div>
        <span class="error"></span>
         <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <label for="inputpassword" class="sr-only">密码</label>
        <input type="password" id="inputpassword" name="password" class="form-control" placeholder="密码" required=true aria-describedby="basic-addon1">
        </div>
        <span class="error"></span>
         <div class="input-group has-success">
         <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
        <label for="inputrepassword" class="sr-only">确认密码</label>
        <input type="password" id="inputrepassword" class="form-control" placeholder="确认密码" required=true aria-describedby="basic-addon1">
        </div>
      
       <div class="well padding5">
       <span class="glyphicon glyphicon-warning-sign"></span>
       <footer>用户绑定微信号后，才可在PC端登陆，进行提问和评论！</footer>
       </div>
        <div class="login">
       
       <button class="btn btn-success btn-lg btn-block" type="button" onclick="return validateform()">
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
    <script src="${ctx}/js/jquery-1.9.1.js"></script>
    <script src="${ctx}/js/picker.js"></script>
    <script src="${ctx}/js/picker.date.js"></script>
    <script src="${ctx}/js/legacy.js"></script>
    <script src="${ctx}/js/zh_CN.js"></script>
    <script src="${ctx}/js/myvalidate.js"></script>
<script type="text/javascript">
var $input = $( '#birthday' ).pickadate({
    formatSubmit: 'yyyy-mm-dd',
    // min: [2015, 7, 14],
    container: '.container',
    // editable: true,
    closeOnSelect: false,
    closeOnClear: false,
})

var picker = $input.pickadate('picker')
// picker.set('select', '14 October, 2014')
// picker.open()

// $('button').on('click', function() {
//     picker.set('disable', true);
// });

</script>
  </body>
</html>
