<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recipe details</title>
    <%@ include file="../utils/files.jsp"%>
</head>
<body>

<%@ include file="../sections/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <div class="m-4 p-3 width-medium text-color-darker">
            <div class="dashboard-content border-dashed p-3 m-4 view-height">
                <div class="mt-4 ml-4 mr-4">
                    <div class="row border-bottom border-3">
                        <div class="col"><h3 class="color-header text-uppercase">Recipe details</h3></div>
                        <div class="col d-flex justify-content-end mb-2"><a href="${pageContext.request.contextPath}/recipe/all" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Back</a></div>
                    </div>

                    <table class="table borderless">
                        <tbody>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Name</th>
                            <td class="col-7">
                                ${recipe.name}
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Description</th>
                            <td class="col-7">${recipe.description}</td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Preparation time (min)</th>
                            <td class="col-7">
                                ${recipe.preparationTime}
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
                            <p>${recipe.preparation}</p>
                        </div>
                        <div class="col-2"></div>
                        <div class="col-5 p-4">
                            <c:forEach items="${ingredients}" var="ingredient">
                                ${ingredient}<br>
                            </c:forEach>
                        </div>
                        <%--<ul class="col-5 p-4 list-unstyled">
                            <li>brukselka 300g</li>
                            <li>ziemniaki 500g</li>
                            <li>Fix Naturalnie makaronowa z szynką Knorr 1 szt.</li>
                            <li>średnia cebula 1szt.</li>
                            <li>ząbek czosnku 1szt.</li>
                            <li>kiełbasa np. śląska 500g</li>
                            <li>śmietana 18% 200 ml</li>
                            <li>Rama Smaż jak szef kuchni, wariant klasyczny 4 łyżki</li>
                            <li>gałązka tymianku 1 szt.</li>
                        </ul>--%>
                    </div>

                </div>
            </div>
        </div>
</section>

<%@ include file="../sections/footer.jsp"%>
<%@ include file="../utils/scripts.jsp"%>
</body>
</html>
