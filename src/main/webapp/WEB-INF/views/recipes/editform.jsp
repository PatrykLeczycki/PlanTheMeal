<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="text-color-darker">
    <div class="dashboard-content border-dashed p-3 m-4 view-height"> <%--p-3 m-4 view-height odpowiada za wydłuzanie/poszerzanie diva--%>
        <div class="mt-4 ml-4 mr-4">
            <div class="row border-bottom border-3">
                <div class="col"><h3 class="color-header text-uppercase">Edit recipe</h3></div>
                <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Edit</button></div>
            </div>

            <table class="table borderless">
                <tbody>
                <tr>
                    <%--<th scope="row" class="col-2">Name</th>--%>
                    <td>Name</td>
                    <td>
                        <form:input path="name"/>
                    </td>
                </tr>
                <tr>
                    <%--<th scope="row" class="col-2">Description</th>--%>
                    <td>Description</td>
                    <td> <form:textarea path="description"/></td>
                </tr>
                <tr>
                    <td>Preparation time (min)</td>
                    <%--<th scope="row" class="col-2">Preparation time (min)</th>--%>
                    <td>
                        <form:input path="preparationTime"/>
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
                    <form:textarea path="preparation"/>
                </div>
                <div class="col-2"></div>

                <div class="col-5 p-4 flex example">
                    <c:forEach items="${ingredients}" var="ingredient">
                        <div id="ingredient">
                            <input type="text" name="ingredient" value="${ingredient}"/>
                            <button type="submit" id="deleteingredient"><i class="fa fa-trash" style="padding-right: 5px;"></i></button>
                        </div>

                    </c:forEach>
                    <%--<div style="float: left">
                        <button type="button" class="btn">X</button>
                    </div>
                    &lt;%&ndash;<form:textarea path="ingredients"/>&ndash;%&gt;
                        <input type="text" name="ingredient"/>
                    <p id="addingredient">Add ingredient</p>--%>
                    <button style="margin: 0 auto; display: block;" class="btn" id="addingredient">Add</button>
                </div>


            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#addingredient").on("click", function(){
    })
</script>
