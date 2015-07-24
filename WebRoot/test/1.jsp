<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="${ctx}/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <link href="${ctx}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen"/>
</head>

<body>
<div class="container">
<div class="form-group">
                <label for="dtp_input2" class="col-md-2 control-label">Date Picking</label>
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    <input class="form-control" size="16" type="text" value="" readonly>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
</div>
 </div>

<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/datapicker/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx}/js/datapicker/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    
$(".form_date").datetimepicker({
	format: 'yyyy-mm-dd',
	minView:'2',
	todayBtn:true,
	autoclose:true,
	language:'zh-CN'
	});
</script>  
	

</body>
</html>
