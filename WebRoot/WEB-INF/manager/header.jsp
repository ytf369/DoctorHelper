 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<style type="text/css">
  .error{ color: red }
</style>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">欢迎您，<u>${admin.loginname }</u><img class="img-circle" src="${ctx }/images/adminheader.png" width="40px" height="40px" style="display: inline;"/></a> 
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>admin</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">阅读更多消息</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">提醒<span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">提醒 <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">查看所有</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${admin.loginname } <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> 个人信息</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> 邮件</a>
                        </li>
                        <li >
                            <a href="#" data-toggle="modal" data-target="#modifyModal"><i class="fa fa-fw fa-gear" ></i>修改密码</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${ctx}/user/logout.action"><i class="fa fa-fw fa-power-off"></i> 退出</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <input  type="hidden" id="menuInput" value="${menu }">
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li  id="expertsMenu">
                        <a href="${ctx }/user/queryallexperts.action?pagenum=1&size=10"><span class="glyphicon glyphicon-education"></span>&nbsp;医生审核</a>
                    </li>
              
                    <li id="deptsMenu">
                        <a href="${ctx }/dept/querydepts.action"><span class="glyphicon glyphicon-file"></span>&nbsp;科室管理</a>
                    </li>
                         <!-- 隐藏其他菜单 
                    <li>
                        <a href="tables.jsp"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.jsp"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.jsp"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li> 
                    <li>
                        <a href="bootstrap-grid.jsp"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.jsp"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.jsp"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li>
               -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <!-- 修改密码模态框 -->
   <div class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" id="modifyModal">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel"><span class="glyphicon glyphicon-cog"></span>&nbsp;修改密码</h4>
      </div>
      <div class="modal-body" style="padding-left: 100px;padding-right: 100px">
      <form action="user/modifyPwd.action" id="form0" method="post">
        <span class="error"></span>
        <div class="form-group">
            <input type="password" class="form-control" id="oldpwd" name="oldpwd" placeholder="请输入旧密码">
        </div>
        <span class="error"></span>
        <div class="form-group">
            <input type="password" class="form-control" id="inputpassword" name="newpwd" placeholder="请输入新密码">
          </div>
        <span class="error"></span>
         <div class="form-group">
            <input type="password" class="form-control" id="inputrepassword" placeholder="再次输入密码">
          </div>
      </form>
</div>
      <div class="modal-footer">
        <button id="savebut" type="button" class="btn btn-primary" onclick="return modifypwdValidate()">保存修改</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="${ctx }/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${ctx }/js/bootstrap.min.js"></script>
<script src="${ctx}/js/myvalidate.js"></script>
<script type="text/javascript">
var id='#'+$('#menuInput').val();
console.log(id)
var $activeMenu=$(id);
$activeMenu.addClass('active');
//test
//验证旧密码是否正确
function validateOldpwd(){
	var flag=true;
	var oldpwd=$("#oldpwd");
	$.ajax({
		   async:false,
		   type: "post",
		   url: "${ctx}/user/checkOldpwd.action?mark='admin'",
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
//模态框打开事件
$('#modifyModal').on('show.bs.modal', function (e) {
	$(".error").text('');
	$('#form0')[0].reset();
	})
function modifypwdValidate(){
	$(".error").text('');
	if(validateOldpwd()&&validtepassword()&&validtepasswordAg()){
		var newpwd=$('#inputpassword').val();
		$.ajax({
			   async:false,
			   type: "post",
			   url: "${ctx}/user/modifyPwd.action?mark='admin'",
			   data: {newpwd:newpwd},
			   dataType: "json",
			   success: function(msg){
				   $("#savebut").remove();
				   if(msg.code==1){
					  $(".modal-body").html('').append("<div class=\"alert alert-success alert-dismissible\" role=\"alert\"><strong>修改成功!</strong>" +
							 "下次登录生效！您可以<a href='${ctx}/login.jsp'>重新登录</a>");
				   }
				   else{
					   $(".modal-body").html('').append("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\"><strong>修改失败!</strong>" +
						 "未知原因！您可以返回<a>重新修改</a>");
				   }
			   }
			});
		return true;
	}
	return false;
}

</script>