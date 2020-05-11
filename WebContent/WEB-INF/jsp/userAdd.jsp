<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0045)http://localhost:8080/WebTest/jsp/addUser.jsp -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>新增用户</title>
<link rel="stylesheet" type="text/css" href="${ctx }/frame/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx }/frame/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx }/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/frame/js/DateFormat.js"></script>
<script type="text/javascript" src="${ctx }/frame/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
var accountFlag;
var passwordFlag

function checkAccount() {
	 accountFlag = false;
	var account = $('#inputAccount').val();
	if (account != null && account != "") {
		$.ajax({
			type : "POST",
			url : "${ctx}/user/findAccount.do",
			data : {
				"account" : account
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				 if (data.id == 0) {
					accountFlag = true;
					console.log("1111");
					$('#accountDiv').removeClass("has-error");
					$('#accountDiv').addClass("has-success");
				} else {
					
					accountFlag = false;
					$('#accountDiv').removeClass("has-success");
					$('#accountDiv').addClass("has-error");
				}
			},
			error:function(data){
				console.log("error");
			}
		});
	}else{
		accountFlag = false;
		$('#accountDiv').removeClass("has-success");
		$('#accountDiv').addClass("has-error");
	}
}
function checkPassword() {
	 passwordFlag = false;
	var password = $('#inputPassword').val();
	var passwordRe = $('#inputPasswordRe').val();
	if (password == passwordRe && password != null && password != "") {
		passwordFlag = true;
		$('#passwordDiv').removeClass("has-error");
		$('#passwordReDiv').removeClass("has-error");
		$('#passwordDiv').addClass("has-success");
		$('#passwordReDiv').addClass("has-success");
	} else {
		passwordFlag = false;
		$('#passwordDiv').removeClass("has-success");
		$('#passwordReDiv').removeClass("has-success");
		$('#passwordDiv').addClass("has-error");
		$('#passwordReDiv').addClass("has-error");
	}
}

function check() {
	var submitflag = true;
	if( $('#inputPassword').val()==""||$('#inputAccount').val()==""){
		submitflag = false;
	}
	
	if (accountFlag == false) {
		submitflag = false;
		$('#accountDiv').addClass("has-error");
	}
	if (passwordFlag == false) {
		submitflag = false;
		$('#passwordDiv').addClass("has-error");
		$('#passwordReDiv').addClass("has-error");
	}
	return submitflag;
}
function goBack(){
	window.location = "${ctx}/user/getusers.do";
}
</script>
</head>
<body>

<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="">${user.name }</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="${ctx }/user/getusers.do">用户管理</a></li>
            <li><a href="${ctx }/user/findAllsignByuser.do">签到记录</a></li>
             <li><a href="${ctx }/user/logout.do">注销</a></li>
        </ul>
    </div>
    </div>
</nav>
<form class="form-horizontal" method="post" action="${ctx }/user/addUser.do?type=0&id=${user2.id}" onsubmit="return check()" id="loginForm">
		<div class="form-group" id="accountDiv">
			<label for="inputAccount" class="col-sm-2 control-label">账号</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="account" id="inputAccount" value="${user2.account }" placeholder="请输入账号" <c:if test="${empty user2}">onblur="checkAccount()"</c:if>>
			</div>
		</div>
		<div class="form-group" id="nameDiv">
			<label for="inputPassword" class="col-sm-2 control-label">姓名</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="name" id="userName" value="${user2.name }" placeholder="请输入姓名">
			</div>
		</div>
		<div class="form-group" id="passwordDiv">
			<label for="inputPassword" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" name="pswd" id="inputPassword" value="${user2.pswd }" placeholder="请输入密码" onblur="checkPassword()">
			</div>
		</div>
		<div class="form-group" id="passwordReDiv">
			<label for="inputPassword" class="col-sm-2 control-label">确认密码</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" name="inputPasswordRe" id="inputPasswordRe" value="${user2.pswd }" placeholder="请再次输入密码" onblur="checkPassword()">
			</div>
		</div>
		<div class="form-group" id="passwordDivRe">
			<label for="inputPassword" class="col-sm-2 control-label">用户状态</label>
			<div class="col-sm-8">
				<label class="radio-inline"> <input type="radio" name="enable" id="enableRadio1" value="1" <c:if test="${user2.enable==1 }">checked="checked"</c:if>> 启用</label>
				 <label class="radio-inline"> <input type="radio" name="enable" id="enableRadio0" value="0" <c:if test="${user2.enable==0 }">checked="checked"</c:if>>
					禁用
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-8">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-default">添加</button>
				
		  	    <button type="reset" class="btn btn-default">重置</button>
				<button class="btn btn-default" onclick="goBack()">返回</button>
			</div>
		</div>
	</form>
	<div style="height: 30px;"></div>
	

</body>
</html>