<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log in</title>
<%@include file="utils/files.jsp"%>
</head>
<body>
<%@include file="sections/header.jsp"%>

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <form class="padding-small text-center" action="${pageContext.request.contextPath}/perform_login" method="post">
                    <h1 class="text-color-darker">Login panel</h1>
                    <div class="form-group">
                        <c:if test="${param.error}">
                            ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
                        </c:if>
                        <input type="text" class="form-control" id="email" name="email" placeholder="E-mail address">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Log in</button>
                </form>
            </div>
        </div>
    </div>
</section>

<%@include file="utils/scripts.jsp"%>

</body>
</html>
