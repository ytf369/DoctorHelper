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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>微网站后台管理</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/sb-admin.css" rel="stylesheet">
    <link href="${ctx}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${ctx}/css/custom.css">
	  <link rel="stylesheet" href="${ctx}/css/iosOverlay.css">
	  <link rel="stylesheet" href="${ctx}/css/prettify.css">
    <link href="${ctx }/css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    .error{
    color: red;
    }
    .success{
    color: green;
    }
    </style>
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
       <jsp:include page="header.jsp"></jsp:include>
        
         <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                                                                          专家医生列表
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="#">系统菜单</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> 专家医生列表
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                 
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>昵称</th>
                                        <th>真实姓名</th>
                                        <th>性别</th>
                                        <th>证件号</th>
                                        <th>角色</th>
                                        <th>出生年月</th>
                                        <th>手机</th>
                                        <th>社区</th>
                                        <th>审核状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pagerows.list}" var="expert">
                                    <tr>
                                        <td>${expert.loginname}</td>
                                        <td>${expert.realname}</td>
                                        <td>
                                        <c:if test="${expert.sex=='1'}">男</c:if>
                                        <c:if test="${expert.sex=='2'}">女</c:if>
                                        </td>
                                        <td>${expert.idcard}</td>
                                        <td>
                                        <c:if test="${expert.role=='1'}">专家医生</c:if>
                                        </td>
                                        <td>${expert.birthday}</td>
                                        <td>${expert.phone}</td>
                                        <td>${expert.community}</td>
                                        <td>
                                        <c:if test="${expert.chicked=='0'}">
                                        <span class="error"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>&nbsp;未审核</span></c:if>
                                        <c:if test="${expert.chicked=='1'}">
                                        <span class="success"><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>&nbsp;审核通过</span></c:if>
                                        </td>
                                        <td class="center">
                                        <c:if test="${expert.chicked=='0'}">
                                        <button type="button" class="btn btn-success" onclick="doit(${expert.id},'1')">审核通过</button>
                                        </c:if>
                                        <c:if test="${expert.chicked=='1'}">
                                        <button type="button" class="btn btn-danger" onclick="doit(${expert.id},'0')">撤销审核</button>
                                        </c:if>
                                        </td>
                                    </tr>
                               </c:forEach>     
                                </tbody>
                            </table>
                      <!-- 分页栏 -->
						  <nav class="center">
						  <ul class="pagination ">
						     <c:choose>
							  <c:when test="${currentpage==1 }">
							    <li class="disabled">
							      <a  aria-label="Previous">
							        <span aria-hidden="true">上一页</span>
							      </a>
							    </li>
							    </c:when>
							    <c:otherwise>
							     <li>
							      <a href="${ctx}/user/queryallexperts.action?pagenum=${currentpage-1 }&size=10" aria-label="Previous">
							        <span aria-hidden="true">上一页</span>
							      </a>
							    </li>
							    </c:otherwise>
							   </c:choose> 
						 <c:forEach  var="pagenum"  begin="${beginPage}" 
		                               end="${endPage}"> 
						    <c:choose>
						    <c:when test="${pagenum==currentpage }">
						    <li class="active"><a  href="${ctx}/user/queryallexperts.action?pagenum=${pagenum }&size=10">${pagenum}</a></li>
						    </c:when>
						    <c:otherwise>
						     <li><a href="${ctx}/user/queryallexperts.action?pagenum=${pagenum }&size=10">${pagenum}</a></li>
						    </c:otherwise>
						    </c:choose>
		    			</c:forEach>
						      <c:choose>
							    <c:when test="${pagerows.rows==currentpage}">
							    <li class="disabled">
							      <a  aria-label="Next">
							        <span aria-hidden="true">下一页</span>
							      </a>
							    </li>
							    </c:when>
							    <c:otherwise>
							      <li>
							      <a href="${ctx}/user/queryallexperts.action?pagenum=${currentpage+1 }&size=10" aria-label="Next">
							        <span aria-hidden="true">下一页</span>
							      </a>
							    </li>
							    </c:otherwise>
							    </c:choose>
						  </ul>
						</nav>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="${ctx }/js/jquery.js"></script>
    <!-- Morris Charts JavaScript -->
	  <script src="${ctx }/js/iosOverlay.js"></script>
	  <script src="${ctx }/js/spin.min.js"></script>
	  <script src="${ctx }/js/prettify.js"></script>
	  <script src="${ctx }/js/custom.js"></script>
	  <script type="text/javascript">
	  function doit(id,chick){
		  $.ajax({
			  async:false,
			  type: "post",
			  url: "${ctx}/user/updateUserchecked.action",
			  data:{id:id,checked:chick},
			  dataType: "json",
			  success:function(msg){
				  if(msg.code=='1'){
				  iosOverlay({
						text: "操作成功!",
						duration: 2e3,
						icon: "${ctx}/images/check.png",
						onbeforehide:function(){
							location.reload();
						}
					});
				  }
				  else{
					  iosOverlay({
							text: "Error!",
							duration: 2e3,
							icon: "../images/cross.png",
							onbeforehide:function(){
								location.reload();
							}
						});
				  }
			  }
			});
	  }
	  </script>
</body>

</html>
