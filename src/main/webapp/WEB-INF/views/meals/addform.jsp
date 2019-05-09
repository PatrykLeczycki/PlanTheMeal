<div class="m-4 p-3 <%--width-medium--%>">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="row border-bottom border-3">
            <div class="col"><h3 class="color-header text-uppercase">Add meal to plan</h3></div>
            <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Add</button></div>
        </div>
        <table class="table borderless">
            <tbody>
            <tr>
                <td>Plan</td>
                <td>
                    <form:select path="plan" cssClass="multi-select-demo" id="choosePlan">
                        <form:option value="0" label="None selected"/>
                        <form:options itemValue="id" itemLabel="name" items="${plans}"/>
                    </form:select>
                </td>
                <td>
                    <form:errors path="plan" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <form:input path="name" id="name" class="form-control" placeholder="Meal name"/>
                </td>
                <td>
                    <form:errors path="name" cssClass="error"/><br>
                </td>
            </tr>
            <tr>
                <td>Meal order</td>
                <td>
                    <form:input path="sequence" id="number" class="form-control" placeholder="Meal order"/>
                </td>
                <td>
                    <form:errors path="sequence" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <td>Recipe</td>
                <td>
                    <form:select path="recipe" cssClass="multi-select-demo" id="chooseRecipe">
                        <form:option value="0" label="None selected"/>
                        <form:options itemValue="id" itemLabel="name" items="${recipes}"/>
                    </form:select>
                </td>
                <td>
                    <form:errors path="recipe" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <td>Weekday</td>
                <td>
                    <form:select path="weekday" cssClass="multi-select-demo" id="chooseDay">
                        <form:option value="0" label="None selected"/>
                        <form:options itemValue="id" itemLabel="name" items="${weekdays}"/>
                    </form:select>
                </td>
                <td>
                    <form:errors path="weekday" cssClass="error"/>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</div>
</section>
