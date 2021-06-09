<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="${ctx}/student/showCourse">所有课程<span class="badge pull-right"></span></a></li>
        <li><a href="${ctx}/student/selectedCourse">已选课程<span class="badge pull-right"></span></a></li>
        <li><a href="${ctx}/student/overCourse">已修课程<span class="badge pull-right"></span></a></li>
        <li><a href="${ctx}/student/passwordRest">修改密码
            <sapn class=" pull-right"/>
        </a></li>
        <li>
            <a href="${ctx}/student/profile">个人信息<sapn class="badge pull-right"/></a>
        </li>
        <li><a href="${ctx}/logout">退出系统
        </a></li>

    </ul>
</div>