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
		window.location="${ctx}/sign/findAllsignByuserid.do?pageNo="+pageNo;
			
	}
</script>
<title>用户签到记录</title>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="">${user.name }</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="${ctx }/sign/sign.do">签到</a></li>
            <li  class="active"><a href="${ctx }/sign/findAllsignByuserid.do">签到记录</a></li>
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
					<th>姓名</th>
					<th>时间</th>
					<th>类型</th>
				</tr>
			</thead>
			
				<tbody>
				<c:forEach var="s" items="${page.result }">
				<tr>
					<td>${s.id }</td>
					<td>${s.user.name }</td>
					<td>${s.signtime }</td>
					<td><c:if test="${s.type==1 }">签退</c:if><c:if test="${s.type==0 }">签到</c:if></td>
					     
				</tr>
			
				</c:forEach>
				
			
		</tbody></table>
	</div>
	
	<!-- 分页 -->
	<div class="row">
		<div class="col-md-6" style="text-align:right;">
			<nav>      <p> 
			<ul class="pagination">
		   	<c:if test="${!page.firstPage }">
			<li><a href="${ctx }/sign/findAllsignByuserid.do?pageNo=${page.pageNo-1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach var="i" items="${page.slider }">
				<li><a href="${ctx }/sign/findAllsignByuserid.do?pageNo=${i }">${i }</a></li>
			</c:forEach>	
			
			<c:if test="${!page.lastPage }">
				<li><a href="${ctx }/sign/findAllsignByuserid.do?pageNo=${page.pageNo+1 }">&raquo;</a></li>
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

</body></html>