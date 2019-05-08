<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-color-darker">
    <div class="dashboard-content border-dashed p-3 m-4 view-height"> <%--p-3 m-4 view-height odpowiada za wydłuzanie/poszerzanie diva--%>
        <div class="mt-4 ml-4 mr-4">
            <div class="row border-bottom border-3">
                <div class="col"><h3 class="color-header text-uppercase">New recipe</h3></div>
                <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Add</button></div>
            </div>

            <table class="table borderless">
                <tbody>
                <tr>
                    <td>Name</td>
                    <td>
                        <form:input path="name"/>
                    </td>
                    <td>
                        <form:errors path="name" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td> <form:textarea path="description"/></td>
                    <td>
                        <form:errors path="description" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <td>Preparation time (min)</td>
                    <td>
                        <form:input path="preparationTime"/>
                    </td>
                    <td>
                        <form:errors path="preparationTime" cssClass="error"/>
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
                <div class="col-5 p-4 flex example preparation">

                    <c:if test="${nopreparation}">
                        <span class="error">Preparation list must not be empty</span>
                    </c:if>
                    <c:choose>
                        <c:when test="${not empty steps}">
                            <c:forEach items="${steps}" var="step" varStatus="count">
                                <div class="step">
                                    <input type="text" name="step" value="${step}"/>
                                    <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="step">
                                <input type="text" name="step"/>
                                <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="btn add">Add</div>
                </div>
                <div class="col-2"></div>

                <div class="col-5 p-4 flex example ingredient">
                    <c:if test="${noingredients}">
                        <span class="error">Ingredient list must not be empty</span>
                    </c:if>
                    <c:choose>
                        <c:when test="${not empty ingredients}">
                            <c:forEach items="${ingredients}" var="ingredient">
                                <div>
                                    <input type="text" name="ingredient" value="${ingredient}"/>
                                    <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div>
                                <input type="text" name="ingredient" value="${ingredient}"/>
                                <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="btn add">Add</div>
                </div>
            </div>
        </div>
    </div>
</div>
