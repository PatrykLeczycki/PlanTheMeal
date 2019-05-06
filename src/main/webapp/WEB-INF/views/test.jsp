<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add recipe</title>
    <%@include file="utils/files.jsp"%>
</head>
<body>
<%@include file="sections/header.jsp"%>

<section class="dashboard-section">
    <div class="row <%--dashboard-nowrap--%>">
        <%@include file="sections/sidebar.jsp"%>
        <div class="text-color-darker">
            <div class="dashboard-content border-dashed p-3 m-4">
                <div class="row border-bottom border-3">
                    <div class="col"><h3 class="color-header text-uppercase">New recipe</h3></div>
                    <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Add</button></div>
                </div>

                <div class="row">
                    <div class="col-md-5">Preparation</div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">Ingredients</div>
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <c:forEach items="${preparation}" var="step" varStatus="count">
                            <div class="step">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" name="step" value="${step}">
                                    <div class="input-group-append delete">
                                        <i class="fa fa-trash input-group-text"></i>
                                    </div>
                                </div>
                            </div>
                            <%--   <div class="step">
                                   <input type="text" name="step" value="${step}"/>
                                   <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                               </div>--%>

                        </c:forEach>

                        <div class="btn add">Add</div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <c:forEach items="${ingredients}" var="ingredient" varStatus="count">
                            <div class="ingredient">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control">
                                    <div class="input-group-append delete">
                                        <i class="fa fa-trash input-group-text"></i>
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="ingredient">
                                 <input type="text" class="form-control" name="ingredient" value="${ingredient}"/>
                                 <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                             </div>--%>

                        </c:forEach>

                        <div class="btn add">Add</div>
                    </div>
                </div>
            </div>
        </div>


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
<%--                                <form:input path="name"/>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
<%--                            <td> <form:textarea path="description"/></td>--%>
                        </tr>
                        <tr>
                            <td>Preparation time (min)</td>
                            <td>
<%--                                <form:input path="preparationTime"/>--%>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="row">
                        <div class="col-5 border-bottom border-3"><h3 class="text-uppercase">Preparation</h3></div>
                        <div class="col-2"></div>
                        <div class="col-5 border-bottom border-3"><h3 class="text-uppercase">Ingredients</h3></div>
                    </div>
                    <div class="row">
                        <div class="col-5 p-4 example">
                            <%--<form:textarea path="preparation"/>--%>
                            <c:forEach items="${preparation}" var="step" varStatus="count">
                                <div class="step">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" name="step" value="${step}">
                                        <div class="input-group-append delete">
                                            <i class="fa fa-trash input-group-text"></i>
                                        </div>
                                    </div>
                                </div>
                                <%--   <div class="step">
                                       <input type="text" name="step" value="${step}"/>
                                       <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                                   </div>--%>

                            </c:forEach>

                            <div class="btn add">Add</div>
                        </div>
                        <div class="col-2"></div>

                        <div class="col-5 p-4 example">
                            <c:forEach items="${ingredients}" var="ingredient" varStatus="count">
                                <div class="ingredient">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control">
                                        <div class="input-group-append delete">
                                            <i class="fa fa-trash input-group-text"></i>
                                        </div>
                                    </div>
                                </div>
                                <%-- <div class="ingredient">
                                     <input type="text" class="form-control" name="ingredient" value="${ingredient}"/>
                                     <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                                 </div>--%>

                            </c:forEach>

                            <div class="btn add">Add</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">

    $(document).on("click", ".delete",function() {
        var width = $(this).width();
        var parent = $(this).parent();
        parent.remove();
        parent.css('width', width);

        console.log("removed");
    });
</script>

<script type="text/javascript">
    $(".add").on("click", function(){
        var newIngredient = $("<div class='ingredient'><input type='text' name='ingredient'/><div class='delete'><i class='fa fa-trash' style='padding-right: 5px;'></i></div></div>");

        newIngredient.insertBefore($(this));
    })
</script>




<%@include file="sections/footer.jsp"%>

<%@include file="utils/scripts.jsp"%>
</body>
</html>
