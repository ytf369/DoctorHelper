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
    <title>科室后台管理</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/sb-admin.css" rel="stylesheet">
    <link href="${ctx}/css/plugins/morris.css" rel="stylesheet">
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
                                                                         科室列表 <button class="btn btn-success pull-right" data-toggle="modal" data-target="#DeptModal" data-whatever="添加"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;添加</button>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="#">系统菜单</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> 科室列表
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
                                        <th>名称</th>
                                        <th>创建时间</th>
                                        <th>更新时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pagerows.list}" var="dept">
                                    <tr>
                                        <td>${dept.name}</td>
                                        <td>${dept.createtime}</td>
                                        <td>${dept.updatetime}</td>
                                        <td class="text-center">
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#DeptModal" data-whatever="修改" data-deptname="${dept.name}" data-deptid="${dept.id}"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改</button>
                                        <button class="btn btn-danger" data-toggle="modal" data-target="#delModal" data-deptid="${dept.id}"><span class="glyphicon glyphicon-trash"></span>&nbsp;删除</button>
                                        </td>
                                    </tr>
                               </c:forEach>     
                                </tbody>
                            </table>
                      <!-- 分页栏
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
						 <c:forEach  var="pagenum"  begin="${currentpage<=10?1:((currentpage-currentpage%10)+1) }" end="${(currentpage+10)>pagerows.rows?pagerows.rows:((currentpage-currentpage%10)+10)}"> 
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
						 -->
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
<!-- 隐藏的Model框 -->
<div class="modal fade" id="DeptModal" tabindex="-1" role="dialog" aria-labelledby="deptModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deptModalLabel">Title</h4>
      </div>
      <div class="modal-body">
        <form action="${ctx }/dept/saveOrupdateDept.action" method="post" id="deptForm">
          <div class="form-group">
            <label for="recipient-name" class="control-label">科室名:</label>
            <input type="text" class="form-control" id="recipient-name" name="name" required>
          </div>
           <input type="hidden" name="id" id="deptid">
          <!-- 
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
          -->
        </form>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary" onclick="javascript:$('#deptForm').submit()"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
      <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>取消</button>
      </div>
    </div>
  </div>
</div>
<!-- 删除弹出框 -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delModal"> 
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">您确定要删除此科室吗？</h4>
      </div>
      <form action="${ctx }/dept/deleteDept.action" method="post" id="delform">
      <input type="hidden" name="delid">
      </form>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary" onclick="javascript:$('#delform').submit()">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
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
	  $('#DeptModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  var modal = $(this)
		  modal.find('.modal-title').text(recipient + '科室')
		  if(recipient=='添加'){
		  modal.find('.modal-body input').val('')
		  modal.find(".modal-body input[name='name']").attr("placeholder","请填写科室名")
		  }
		  if(recipient=='修改'){
			  var deptname = button.data('deptname')
			  var deptid = button.data('deptid')
			   modal.find(".modal-body input[name='name']").val(deptname)
			   modal.find(".modal-body input[name='id']").val(deptid)
		  }
		})
		
		$('#delModal').on('show.bs.modal', function (event) {
			 var button = $(event.relatedTarget)
			 var modal = $(this)
			 var deptid = button.data('deptid')
			 console.log("deptID"+deptid)
			 modal.find(".modal-content input[name='delid']").val(deptid)
		})
	  </script>
</body>

</html>
