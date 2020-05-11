<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>签到系统首页</title>
<link rel="stylesheet" type="text/css" href="${ctx }/frame/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx }/frame/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx }/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function checkName(){			
		if($("#inputAccount").val()==""){
			$("#accountDiv").addClass("has-error");
		}else{
			$("#accountDiv").removeClass("has-error");
			
		}		
	}
	
	function checkPassword(){
		if($("#inputPassword").val()==""){
			$("#passwordDiv").addClass("has-error");			
			
		}else{
			$("#passwordDiv").removeClass("has-error");
		}
	}
	
	function check(){
		var flag=true;
		if($('#inputAccount').val()==""){
			$('#accountDiv').addClass("has-error");
			flag=false;
		}
		if($('#inputPassword').val()==""){
			$('#passwordDiv').addClass("has-error");
			flag=false;
		}
		return flag;
	}
	//判断提示，模态框  loginType的值来自于UserController的dologin方法
	//loginType=-1表示用户禁用状态，loginType=-2表示用户不存在
	$(function() {
		var longinType = 0;
		var longinType = "${loginType}";
		
		if (longinType == -1) {
  			$('#loginErrorModal').modal();
		}
		if (longinType == -2) {
  			$('#unEnableModal').modal();
		}
		
	})
</script>
</head>
<body>
	<div id="main" style="background-color: rgb(217, 237, 247)">
		<div class="page-header col-sm-offset-5 col-sm-8">
			<h1>
				<small>签到系统</small>
			</h1>
		</div>
		<form class="form-horizontal" method="post" action="${ctx }/user/login.do" onsubmit="return check()" id="loginForm">
			<div class="form-group" id="accountDiv">
				<label for="inputAccount" class="col-sm-2 control-label">账号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="account" id="inputAccount" placeholder="请输入账号" onblur="checkName()">
				</div>
			</div>
			<div class="form-group" id="passwordDiv">
				<label for="inputPassword" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="pswd" id="inputPassword" placeholder="请输入密码" onblur="checkPassword()">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-8">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-default">登录</button>
				</div>
			</div>
		</form>
		<div style="height: 30px;"></div>
	</div>

	<!--错误模态框 -->
	<!-- tabindex=-1代表此元素禁止使用键盘上的tab键对其导航，就是按tab键的时候，会跳过这个div
	
		role=“dialog”代表这是一个对话框
	
		aria-labelledby：是残障人士使用屏幕阅读器时，会读取的内容，显示id中的内容
	
		aria-hidden:是使用屏幕阅读器时，忽略该元素值 -->
		
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="loginErrorModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">登录失败</h4>
				</div>
				<div class="modal-body">
				<div class="alert alert-danger" role="alert" style="text-align: center">
					用户名或密码错误
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!--禁用模态框 -->
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="unEnableModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">登录失败</h4>
				</div>
				<div class="modal-body">
				<div class="alert alert-warning" role="alert" style="text-align: center">
					用户已被禁用
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

</body></html>