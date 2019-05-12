<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>
<%@include file="../sections/header/header.jsp"%>


<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <div class="m-4 p-4 width-medium">
            <div class="dashboard-header m-4">
                <div class="dashboard-menu">
                    <div class="menu-item border-dashed">
                        <a href="${pageContext.request.contextPath}/user/recipe/add">
                            <i class="far fa-plus-square icon-plus-square"></i>
                            <span class="title">add recipe</span>
                        </a>
                    </div>
                    <div class="menu-item border-dashed">
                        <a href="${pageContext.request.contextPath}/user/plan/add">
                            <i class="far fa-plus-square icon-plus-square"></i>
                            <span class="title">add plan</span>
                        </a>
                    </div>
                    <div class="menu-item border-dashed">
                        <a href="${pageContext.request.contextPath}/user/meal/add">
                            <i class="far fa-plus-square icon-plus-square"></i>
                            <span class="title">add meal to plan</span>
                        </a>
                    </div>
                </div>

                <div class="dashboard-alerts">
                    <div class="alert-item alert-info">
                        <i class="fas icon-circle fa-info-circle"></i>
                        <span class="font-weight-bold">Added recipes: ${recipes}</span>
                    </div>
                    <div class="alert-item alert-light">
                        <i class="far icon-calendar fa-calendar-alt"></i>
                        <span class="font-weight-bold">Added plans: ${plans}</span>
                    </div>
                </div>
            </div>

            <c:if test="${!noplan}">
                <div class="m-4 p-4 border-dashed">
                    <h2 class="dashboard-content-title">
                        <span>Latest added plan:</span> ${lastplanname}
                    </h2>

                    <c:if test="${not empty lastplan}">
                        <c:forEach items="${lastplan}" var="day">
                            <table class="table">
                                <thead>
                                <tr class="d-flex">
                                    <th class="col-2">${day.key}</th>
                                    <th class="col-8"></th>
                                    <th class="col-2"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${day.value}" var="meal">
                                    <tr class="d-flex">
                                        <td class="col-2">${meal.name}</td>
                                        <td class="col-8">${meal.recipe.name}</td>
                                        <td class="col-2"><a href="${pageContext.request.contextPath}/user/recipe/details/${meal.recipe.id}?dashboard" class="btn btn-info rounded-0 text-light m-1">Details</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:forEach>
                    </c:if>
                </div>
            </c:if>


        </div>
    </div>
</section>

<%@include file="../sections/footer.jsp"%>

<%@include file="../utils/scripts.jsp"%>
</body>
</html>
