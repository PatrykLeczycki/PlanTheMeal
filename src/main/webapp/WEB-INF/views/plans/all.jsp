<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Plans</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>

<%@include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">

        <%@include file="../sections/sidebar.jsp"%>

        <div class="m-4 p-3 width-medium">
            <div class="dashboard-content border-dashed p-3 m-4 view-height">
                <c:if test="${mealinplan || mealnotfound || accessdenied}">
                    <div class="m-4 p-3 width-medium">
                        <div class="dashboard-content border-dashed p-3 m-4">
                            <c:if test="${mealinplan}">
                                <span class="error">Error: firstly delete all meals from plan.</span>
                            </c:if>
                            <c:if test="${mealnotfound}">
                                <span class="error">Error: meal with given ID not found</span>
                            </c:if>
                            <c:if test="${accessdenied}">
                                <span class="error">Error: you are not allowed to perform this action</span>
                            </c:if>
                        </div>
                    </div>
                </c:if>

                <div class="row border-bottom border-3 p-1 m-1">
                    <div class="col noPadding"><h3 class="color-header text-uppercase">PLAN LIST</h3></div>
                    <div class="col noPadding d-flex justify-content-end mb-2"><a href="${pageContext.request.contextPath}/user/plan/add" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Add plan</a></div>
                </div>
                <table class="table border-bottom schedules-content">
                    <thead>
                    <tr class="d-flex text-color-darker">
                        <th scope="col" class="col-1">ID</th>
                        <th scope="col" class="col-2">NAME</th>
                        <th scope="col" class="col-7">DESCRIPTION</th>
                        <th scope="col" class="col-2 center">ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody class="text-color-lighter">
                        <c:forEach items="${plans}" var="plan">
                            <%@include file="displaysingle.jsp"%>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>


<%@include file="../sections/footer.jsp"%>

</body>
</html>
