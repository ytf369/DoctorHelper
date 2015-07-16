/**
 * 
 */
var flag=true;
function validateform(){
	$(".error").text('');
	if(validateloginname()&&validaterealname()&&validatephone()&&validtepassword()&&validtepasswordAg()&&flag){
		$("#bindform").submit();
		return true;
	}
	return false;
}
function validateloginname(){
	var uname=$("#inputname");
	if($.trim(uname.val())==""){
		uname.parent().prev().text('昵称不能为空');
		return false;
	}
	return true;
}
function validaterealname(){
	var reg=/[@#\$%\^&\*]+/g;
	var realname=$("#realname");
	if($.trim(realname.val())==""){
		realname.parent().prev().text('真实姓名不能为空');
		return false;
	}
	if(reg.test(realname.val())){
		realname.parent().prev().text('真实姓名含有非法字符');
		return false;
	}
	return true;
}
function validatephone(){
	var phone=$("#phone");
	var reg=/^[1][1-9][0-9]{9}$/;
	if($.trim(phone.val())==""){
		phone.parent().prev().text('手机号不能为空');
		return false;
	}
	if(!reg.test(phone.val())){
		phone.parent().prev().text('手机号格式不正确');
		return false;
	}
	return true;
}
function validtepassword(){
	var pwd=$("#inputpassword");
	var reg=/^[a-zA-Z]\w{5,17}$/;
	if($.trim(pwd.val())==""){
		pwd.parent().prev().text('密码不能为空');
		return false;
	}
	if(!reg.test(pwd.val())){
		pwd.parent().prev().text('以字母开头，6-18位，只能包含字符、数字和下划线');
		return false;
	}
	return true;
	
}
function validtepasswordAg(){
	var pwd=$("#inputpassword");
	var pwdag=$("#inputrepassword");
	console.log(pwd.val());
	console.log(pwdag.val());
	console.log(pwd.val()==pwdag.val())
	if(pwd.val()!=pwdag.val()){
		pwdag.parent().prev().text('密码不匹配');
		return false;
	}
	return true;
}
/**
 * 验证用户名是否重复
 */
function vallidatenameisused(){
	var uname=$("#inputname");
	$.ajax({
		   async:false,
		   type: "post",
		   url: "user/checkUsernameIsused.action",
		   data: {name:uname.val()},
		   dataType: "json",
		   success: function(msg){
			   if(msg.code==0){
				   uname.parent().prev().text('用户名已存在'); 
				   flag=false;
			   }
			   else{
				   uname.parent().prev().text(''); 
				   flag=true;  
			   }
		   }
		});
}
