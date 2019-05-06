<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="text-color-darker">
    <div class="dashboard-content border-dashed p-3 m-4 view-height"> &lt;%&ndash;p-3 m-4 view-height odpowiada za wydłuzanie/poszerzanie diva&ndash;%&gt;
        <div class="mt-4 ml-4 mr-4">
            <div class="row border-bottom border-3">
                <div class="col"><h3 class="color-header text-uppercase">Edit recipe</h3></div>
                <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Edit</button></div>
            </div>

            <form:hidden path="id"/>

            <table class="table borderless">
                <tbody>
                <tr>
                    &lt;%&ndash;<th scope="row" class="col-2">Name</th>&ndash;%&gt;
                    <td>Name</td>
                    <td>
                        <form:input path="name"/>
                    </td>
                </tr>
                <tr>
                    &lt;%&ndash;<th scope="row" class="col-2">Description</th>&ndash;%&gt;
                    <td>Description</td>
                    <td> <form:textarea path="description"/></td>
                </tr>
                <tr>
                    <td>Preparation time (min)</td>
                    &lt;%&ndash;<th scope="row" class="col-2">Preparation time (min)</th>&ndash;%&gt;
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
                        <c:forEach items="${ingredients}" var="ingredient" varStatus="count">
                            <div class="ingredient">
                                <input type="text" name="ingredient" value="${ingredient}"/>
                                <div class="deleteingredient"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                            </div>

                        </c:forEach>

                        <div class="btn" id="addingredient">Add</div>
                    </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).on("click", ".deleteingredient",function() {
        $(this).parent().remove();
        console.log("removed");
    });
</script>

<script type="text/javascript">
    $("#addingredient").on("click", function(){
        var newIngredient = $("<div class='ingredient'><input type='text' name='ingredient'/><div class='delete'><i class='fa fa-trash' style='padding-right: 5px;'></i></div></div>");

        newIngredient.insertBefore($(this));
    })
</script>
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="text-color-darker">
    <div class="dashboard-content border-dashed p-3 m-4 view-height"> <%--p-3 m-4 view-height odpowiada za wydłuzanie/poszerzanie diva--%>
        <div class="mt-4 ml-4 mr-4">
            <div class="row border-bottom border-3">
                <div class="col"><h3 class="color-header text-uppercase">Edit recipe</h3></div>
                <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Edit</button></div>
            </div>

            <form:hidden path="id"/>

            <table class="table borderless">
                <tbody>
                <tr>
                    <td>Name</td>
                    <td>
                        <form:input path="name"/>
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td> <form:textarea path="description"/></td>
                </tr>
                <tr>
                    <td>Preparation time (min)</td>
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
                <div class="col-5 p-4 flex example preparation">
                    <%--<form:textarea path="preparation"/>--%>
                        <c:forEach items="${steps}" var="step" varStatus="count">
                            <div>
                                <input type="text" name="step" value="${step}"/>
                                <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                            </div>

                        </c:forEach>

                        <div class="btn add">Add</div>
                </div>
                <div class="col-2"></div>

                <div class="col-5 p-4 flex example ingredient">
                    <c:forEach items="${ingredients}" var="ingredient" varStatus="count">
                        <div>
                            <input type="text" name="ingredient" value="${ingredient}"/>
                            <div class="delete"><i class="fa fa-trash" style="padding-right: 5px;"></i></div>
                        </div>

                    </c:forEach>

                    <div class="btn add">Add</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).on("click", ".delete",function() {

        var grandparent = $(this).parent().parent();

        if(grandparent.children().length > 2){
            var parent = $(this).parent();
            parent.remove();
        }
    });
</script>


<script type="text/javascript">

    $(document).on("mouseenter", ".delete", function() {
        // hover starts code here

        var grandparent = $(this).parent().parent();

        if(grandparent.children().length == 2){
            var parent = $(this).parent();

            var text;

            var test = [];

            parent.each(function(){
                test.push($(this).attr('class'));
            });

            for(var i = 0; i < test.length; i++){
                console.log(test[i]);
            }
            if (parent.hasClass("step")){
                text = "Preparation can't be empty."
            } else text = "Ingredients list can't be empty.";

            this.notice = $('<div>')
                .addClass('notice')
                .css({
                    bottom: $(this).offset().bottom + 1000
                }).text(text)
                .appendTo(this);
        }
    });

    $(document).on("mouseleave", ".delete", function() {
        // hover ends code here
        if(this.notice){
            this.notice.remove();
        }
    });

</script>



<%--
<script type="text/javascript">


    $('.delete').hover(function (e) {

        var parent = $(this).parent();

        var text;

        var test = [];

        parent.each(function(){
            test.push($(this).attr('class'));
        });

        for(var i = 0; i < test.length; i++){
            console.log(test[i]);
        }
        if (parent.hasClass("step")){
            text = "Preparation can't be empty."
        } else text = "Ingredients list can't be empty.";

        this.notice = $('<div>')
            .addClass('notice')
            .css({
                top: $(this).offset().top + 15,
                left: $(this).offset().left + 20
            }).text(text)
            .appendTo(this);
    }, function () {
        this.notice.remove();
    });

</script>
--%>

<script type="text/javascript">
    $(".add").on("click", function(){

        var parent = $(this).parent();
        var newIngredient;

        if (parent.hasClass('preparation'))
            newIngredient = $("<div><input type='text' name='step'/><div class='delete'><i class='fa fa-trash' style='padding-right: 5px;'></i></div></div>");
        else newIngredient = $("<div><input type='text' name='ingredient'/><div class='delete'><i class='fa fa-trash' style='padding-right: 5px;'></i></div></div>");

        newIngredient.insertBefore($(this));
    })
</script>

