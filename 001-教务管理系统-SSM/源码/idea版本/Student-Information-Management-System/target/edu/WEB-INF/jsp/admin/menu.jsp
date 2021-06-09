<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="${ctx}/admin/showCourse">课程管理<span class="glyphicon glyphicon-home pull-right"></span></a></li>
        <li><a href="${ctx}/admin/showStudent">学生管理<span class="glyphicon glyphicon-user pull-right"></span></a></li>
        <li><a href="${ctx}/admin/showTeacher">教师管理<span class="glyphicon glyphicon-leaf pull-right"></span></a></li>
        <li><a href="${ctx}/admin/userPasswordRest">账号密码重置
            <sapn class="glyphicon glyphicon-repeat pull-right"/>
        </a></li>
        <li><a href="${ctx}/admin/passwordRest">修改密码
            <sapn class="glyphicon glyphicon-pencil pull-right"/>
        </a></li>
        <li><a href="${ctx}/logout">退出系统
            <sapn class="glyphicon glyphicon-log-out pull-right"/>
        </a></li>

    </ul>
</div>