<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="nav flex-column long-bg">
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">
            <span>Dashboard</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/recipe/all">
            <span>Recipes</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/plan/all">
            <span>Plans</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/editdata">
            <span>Edit data</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link disabled" href="${pageContext.request.contextPath}/user/newpassword">
            <span>Edit password</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
            <span>Users</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
</ul>