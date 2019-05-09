<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit data</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>

<%@include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">

        <%@include file="../sections/sidebar.jsp"%>

        <div class="m-4 p-3 text-color-darker">
            <div class="m-4 border-dashed">
                <div class="mt-4 ml-4 mr-4">
                    <form action="${pageContext.request.contextPath}/user/editdata" method="post">

                        <div class="row border-bottom border-3">
                            <div class="col"><h3 class="color-header text-uppercase">Edit data</h3></div>
                            <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Save</button></div>
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
                                <td>Surname</td>
                                <td>
                                    <input class="w-100 p-1" name="surname" value="${surname}">
                                </td>
                                <td>
                                    <c:if test="${emptysurname}">
                                        <span class="error">Surname must not be empty</span>
                                    </c:if>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
