<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <%@include file="utils/files.jsp"%>
</head>
<body>

<%@include file="sections/header.jsp"%>

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">

                <form:form method="post" action="" cssClass="padding-small" modelAttribute="userDto">
                    <h1 class="text-color-darker">Registration</h1>
                    <div class="form-group">
                        <br><form:errors path="name" cssClass="error"/>
                        <form:input path="name" placeholder="Name" class="form-control" id="name"/>
                    </div>
                    <div class="form-group">
                        <br><form:errors path="surname" cssClass="error"/>
                        <form:input path="surname" placeholder="Surname" class="form-control" id="surname"/>
                    </div>
                    <div class="form-group">
                        <br><form:errors path="email" cssClass="error"/>
                        <c:if test="${emailexists}">
                            <br><span class="error">E-mail address is already in use</span>
                        </c:if>
                        <form:input path="email" placeholder="E-mail address" class="form-control" id="email"/>
                        </div>
                    <div class="form-group">
                        <br><form:errors path="password" cssClass="error"/>
                        <c:if test="${emaileqpass}">
                            <br><span class="error">Login and password must differ</span>
                        </c:if>
                        <form:password path="password" placeholder="Password" class="form-control" id="password"/>
                        </div>
                    <div class="form-group">
                        <c:if test="${passwordseq}">
                            <br><span class="error">Passwords must be equal</span>
                        </c:if>
                        <form:password path="confirmPassword" placeholder="Confirm password" class="form-control" id="confirmPassword"/>
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Register</button>
                </form:form>
            </div>
        </div>
    </div>
</section>

<%@include file="utils/files.jsp"%>

</body>
</html>
