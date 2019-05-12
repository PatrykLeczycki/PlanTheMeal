<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Plan details</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>

<%@include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">

        <%@include file="../sections/sidebar.jsp"%>
        <div class="m-4 p-3 width-medium ">
            <div class="dashboard-content border-dashed p-3 m-4">
                <c:if test="${mealnotfound}">
                    <div class="m-4 p-3 width-medium">
                        <div class="dashboard-content border-dashed p-3 m-4">
                            <span class="error">Error: meal with given ID not found</span>
                        </div>
                    </div>
                </c:if>
                <c:if test="${mealdeleted}">
                    <div class="m-4 p-3 width-medium">
                        <div class="dashboard-content border-dashed p-3 m-4">
                            <span class="error">Meal deleted successfully</span>
                        </div>
                    </div>
                </c:if>
                <div class="row border-bottom border-3 p-1 m-1">
                    <div class="col noPadding">
                        <h3 class="color-header text-uppercase">PLAN DETAILS</h3>
                    </div>
                    <div class="col d-flex justify-content-end mb-2 noPadding">
                        <a href="#" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Back</a>
                    </div>
                </div>

                <div class="schedules-content">
                    <div class="schedules-content-header">
                        <div class="form-group row">
                                <span class="col-sm-2 label-size col-form-label">
                                    Plan name
                                </span>
                            <div class="col-sm-10">
                                <p class="schedules-text">${planname}</p>
                            </div>
                        </div>
                        <div class="form-group row">
                                <span class="col-sm-2 label-size col-form-label">
                                    Plan description
                                </span>
                            <div class="col-sm-10">
                                <p class="schedules-text">
                                    ${plandesc}
                                </p>
                            </div>
                        </div>
                    </div>

                    <c:forEach items="${weekplan}" var="day">
                        <table class="table">
                            <thead>
                            <tr class="d-flex">
                                <th class="col-2">${day.key}</th>
                                <th class="col-7"></th>
                                <th class="col-1"></th>
                                <th class="col-2"></th>
                            </tr>
                            </thead>
                            <tbody class="text-color-lighter">
                            <c:forEach items="${day.value}" var="meal">
                                <tr class="d-flex">
                                    <td class="col-2">${meal.name}</td>
                                    <td class="col-7">${meal.recipe.name}</td>
                                    <td class="col-1 center">
                                        <a href="/admin/plan/${planid}/deletemeal/${meal.id}" onclick="return confirm('Are you sure you want to delete this meal from plan?');" class="btn btn-danger rounded-0 text-light m-1">Delete</a>
                                    </td>
                                    <td class="col-2 center">
                                        <a href="/user/recipe/details/${meal.id}" class="btn btn-info rounded-0 text-light m-1">Details</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
