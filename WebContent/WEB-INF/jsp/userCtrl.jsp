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

<script type="text/javascript">
	function skipPage(){
		var pageNo=$("#skipPage").val();
		if(pageNo==null||pageNo==""){
			pageNo=1;
		}
		window.location="${ctx}/user/getusers.do?pageNo="+pageNo;
			
	}
	function deleteUser(userid){
		deleteId=userid;
		$(delModal).modal();
	}
	function sendDelete(){
		window.location = "${ctx}/user/deleteUser.do?userid="+deleteId;
	}
	
	function updateUser(userid){
		window.location = "${ctx}/user/edit.do?userid="+userid;
	}
</script>
<title>用户管理</title>
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

<!-- /.container-fluid --> 
	<div id="signListDiv">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>id</th>
					<th>账号</th>
					<th>密码</th>
					<th>真实姓名</th>
					<th>状态</th>
					<th>操作</th>
					
				</tr>
			</thead>
			
				<tbody>
				<c:forEach var="s" items="${page.result }">
				<tr>
					<td>${s.id }</td>
					<td>${s.account }</td>
					<td>${s.pswd }</td>
					<td>${s.name }</td>
					<td><c:if test="${s.enable==1 }">启用</c:if><c:if test="${s.enable==0 }">禁用</c:if></td>
					  <td>
						<button type="button" class="btn btn-default" onclick="updateUser(${s.id})" id="update">修改</button>
						<button type="button" class="btn btn-default" onclick="deleteUser(${s.id})" id="delete">删除</button>
					</td>   
				</tr>
			
				</c:forEach>
				
			
		</tbody></table>
		<a href="${ctx }/user/userAdd.do"><button  class="btn btn-default">新增</button></a>
	</div>
	
	<!-- 分页 -->
	<div class="row">
		<div class="col-md-6" style="text-align:right;">
			<nav>      <p> 
			<ul class="pagination">
		   	<c:if test="${!page.firstPage }">
			<li><a href="${ctx }/user/getusers.do?pageNo=${page.pageNo-1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach var="i" items="${page.slider }">
				<li><a href="${ctx }/user/getusers.do?pageNo=${i }">${i }</a></li>
			</c:forEach>	
			
			<c:if test="${!page.lastPage }">
				<li><a href="${ctx }/user/getusers.do?pageNo=${page.pageNo+1 }">&raquo;</a></li>
			</c:if>
		  </ul>
			</p>	
		<b>共${page.totalPages}</b>页,当前第<span>${page.pageNo}</span>页
				</nav>		
		</div>
		<div class="input-group col-md-2" style="text-align:left; padding-top: 20px;">
			<span class="input-group-addon">跳转至第</span> 
			<input type="text" class="form-control" aria-label="" id="skipPage">  <span class="input-group-addon">页</span> <span class="input-group-btn">
				<button class="btn btn-default" type="button" onclick="skipPage()">Go!</button>
			</span>
		</div>
	</div>
	<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" id="delModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">删除确认</h4>
				</div>
				<div class="modal-body">
				<div class="alert alert-danger" role="alert" style="text-align: center">
					确定要删除该用户吗？
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="sendDelete()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body></html>