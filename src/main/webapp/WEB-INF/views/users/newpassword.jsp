<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: patryk
  Date: 21.04.19
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit password</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>
<%@include file="../sections/header/header.jsp"%>


<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <div class="m-4 p-3 width-medium text-color-darker">
            <div class="m-4 border-dashed view-height">
                <div class="mt-4 ml-4 mr-4">
                    <form:form action="/user/newpassword" method="post">
                        <div class="row border-bottom border-3">
                            <div class="col"><h3 class="color-header text-uppercase">Edit password</h3></div>
                            <div class="col d-flex justify-content-end mb-2"><button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Zapisz</button></div>
                        </div>

                        <table class="table borderless">
                            <tbody>
                            <tr class="d-flex">
                                <th scope="row" class="col-2"><h4>Old password</h4></th>
                                <td class="col-4">
                                    <input type="password" name="oldPassword" class="w-100 p-1">
                                </td>
                                <td>
                                    <c:if test="${oldwrong}">
                                        <span class="error">
                                            Old password doesn't match
                                        </span>
                                    </c:if>
                                </td>
                            </tr>
                            <tr class="d-flex">
                                <th scope="row" class="col-2"><h4>New password</h4></th>
                                <td class="col-4">
                                    <input type="password" name="newPassword" class="w-100 p-1">
                                </td>
                                <td>
                                    <c:if test="${passnoteq}">
                                        <span class="error">
                                            Passwords don't match
                                        </span>
                                    </c:if>
                                </td>
                            </tr>
                            <tr class="d-flex">
                                <th scope="row" class="col-2"><h4>Confirm new password</h4></th>
                                <td class="col-4">
                                    <input type="password" name="newPasswordRepeat" class="w-100 p-1">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form:form>
                </div>
            </div>
        </div>
        </div>
</section>

<%@include file="../sections/footer.jsp"%>

<%@include file="../utils/scripts.jsp"%>
</body>
</html>
