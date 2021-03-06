<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recipe details</title>
    <%@ include file="../utils/files.jsp"%>
</head>
<body>

<%@ include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <div class="m-4 p-3 width-medium text-color-darker">
            <div class="dashboard-content border-dashed p-3 m-4 view-height">
                <div class="mt-4 ml-4 mr-4">
                    <div class="row border-bottom border-3">
                        <div class="col"><h3 class="color-header text-uppercase">Recipe details</h3></div>
                        <div class="col d-flex justify-content-end mb-2"><a href="${pageContext.request.contextPath}/user/recipe/all" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Back</a></div>
                    </div>

                    <table style="border-collapse: separate; border-spacing: 10px;">
                        <tbody>
                        <tr>
                            <td><p>Name</p></td>
                            <td>
                                <p>${recipe.name}</p>
                            </td>
                        </tr>
                        <tr>
                            <td><p>Description</p></td>
                            <td>
                                <p>${recipe.description}</p>
                            </td>
                        </tr>
                        <tr>
                            <td><p>Preparation time (min)</p></td>
                            <td>
                                <p>${recipe.preparationTime}</p>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="row d-flex">
                        <div class="col-5 border-bottom border-3"><h3 class="text-uppercase">Preparation</h3></div>
                        <div class="col-2"></div>
                        <div class="col-5 border-bottom border-3"><h3 class="text-uppercase">Ingredients</h3></div>
                    </div>
                    <div class="row d-flex">
                        <div class="col-5 p-4">
                            <c:forEach items="${steps}" var="step">
                            <p>${step}</p>
                        </c:forEach>
                        </div>
                        <div class="col-2"></div>
                        <div class="col-5 p-4">
                            <c:forEach items="${ingredients}" var="ingredient">
                                <p>${ingredient}</p>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </div>
</section>

<%@ include file="../sections/footer.jsp"%>
<%@ include file="../utils/scripts.jsp"%>
</body>
</html>
