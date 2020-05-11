<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx }/frame/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx }/frame/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx }/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/frame/js/DateFormat.js"></script>
<script type="text/javascript" src="${ctx }/frame/bootstrap/js/bootstrap.min.js"></script>
<title>签到页面</title>
<script type="text/javascript">
var serverTime;
function flashServerTime(){
	//getTime() 方法可返回距 1970 年 1 月 1 日之间的毫秒数。
	serverTime=new Date(serverTime.getTime()+1000);
	$('#now').html(serverTime.format("yyyy/MM/dd HH:mm:ss"));
	window.setTimeout("flashServerTime()",1000);
}
$(function(){
	//获取当前服务器时间
	$.ajax({
				type : "POST",
				url : "${ctx}/sign/getServerTime.do",
				dataType : "json",
				success : function(data) {
					console.log(data);
					serverTime=new Date(data.serverTime);
					$('#now').html(data.serverTime);
					window.setTimeout("flashServerTime()",1000);
				}
	});	
	
	
	//登录成功后获取当前用户的签到状态
	$.ajax({
				type : "POST",
				url : "${ctx}/sign/getSignState.do?userid=${user.id}",
				dataType : "json",
				success : function(data) {
					//jsonObj = eval("(" + data + ")");					
					signState=data.signState;
					$('#workTime').html(data.msg);
					console.log(data.signState);
					if(signState==0){//0表示目前已经是签到状态，页面显示签退按钮，签到按钮隐藏
							
						$('#signInBtn').hide();
						$('#signOutBtn').show();
					}if(signState==1){//0表示目前已经是未签到状态，页面显示签退按钮，签到按钮隐藏
						
						$('#signInBtn').show();
						$('#signOutBtn').hide();
					}					
				}
	});
})


function signIn(){
	$.ajax({
				type : "POST",
				url : "${ctx}/sign/signIn.do",
				data: {"signType":"0"},//传给后台的值
				//type:0表示签到，1表示签退
				dataType : "json",
				success : function(data) {
					//jsonObj = eval("(" + data + ")");
					$("#workTime").html(data.msg);
					if(data.signstate==1){
						$('#signInBtn').show();
						$('#signOutBtn').hide();
					}else if(data.signstate==0){
						
						$('#signInBtn').hide();
						$('#signOutBtn').show();
					}
					/* if(data.signId>0){//插入成功！
					
						$('#workTime').html(data.msg);	
						
					}else{
						alert("签到失败，请刷新页面重试!");
					} */
					
					
				}
	});
}

//签退，后台方法同签到方法，只是signType此时为1
function signOut(){
	$.ajax({
				type : "POST",
				url : "${ctx}/sign/signIn.do",
				data: {"signType":"1"},
				dataType : "json",
				success : function(data) {
					//jsonObj = eval("(" + data + ")");
					$("#workTime").html(data.msg);
					if(data.signstate==1){
						$('#signInBtn').show();
						$('#signOutBtn').hide();
					}else if(data.signstate==0){
						
						$('#signInBtn').hide();
						$('#signOutBtn').show();
					}
					/* if(data.signId>0){
						window.location.reload()
					}else{
						alert("签到失败，请刷新页面重试!");
					} */
				}
	});
}

</script>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="http://localhost:8080/WebTest/user/login.do#">${user.name }</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="${ctx }/sign/sign.do">签到</a></li>
            <li><a href="${ctx }/sign/findAllsignByuserid.do">签到记录</a></li>
            <li><a href="${ctx }/user/logout.do">注销</a></li>
        </ul>
    </div>
    </div>
</nav>

<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">当前时间</label>
			<div class="col-sm-10">
				<p class="form-control-static" id="now"> </p>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">签到状态</label>
			<div class="col-sm-10">
				<p class="form-control-static" id="workTime"></p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-8">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-default" onclick="signIn()" id="signInBtn" >签到</button>
				<button type="button" class="btn btn-default" onclick="signOut()" id="signOutBtn">签退</button>
			</div>
		</div>
	</form>


</body></html>