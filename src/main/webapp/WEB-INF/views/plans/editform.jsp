<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="m-4 p-3">
    <div class="dashboard-content border-dashed p-3 m-4 <%--view-height--%>">
        <div class="row border-bottom border-3">
            <div class="col"><h3 class="color-header text-uppercase">Add plan</h3></div>
            <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Add</button></div>
        </div>

        <table class="table borderless">
            <tbody>
            <tr>
                <td>Name</td>
                <td>
                    <input class="w-100 p-1" name="name" value="${name}">
                </td>
                <td>
                    <c:if test="${emptyname}">
                        <span class="error">Name must not be empty</span>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <input class="w-100 p-1" name="description" value="${description}">
                </td>
                <td>
                    <c:if test="${emptydesc}">
                        <span class="error">Description must not be empty</span>
                    </c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>