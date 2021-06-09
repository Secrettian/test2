<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li>
            <a href="${ctx}/teacher/showCourse">我的课程<span class="glyphicon glyphicon-leaf pull-right"></span></a>
        </li>
        <li>
            <a href="${ctx}/teacher/passwordRest">修改密码<sapn class="glyphicon glyphicon-pencil pull-right"/></a>
        </li>
        <li>
            <a href="${ctx}/teacher/profile">个人信息<sapn class="glyphicon glyphicon-floppy-open pull-right"/></a>
        </li>
        <li>
            <a href="${ctx}/logout">退出系统<sapn class="glyphicon glyphicon-log-out pull-right"/></a>
        </li>

    </ul>
</div>