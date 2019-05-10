<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lost password</title>
    <%@include file="utils/files.jsp"%>
</head>
<body>
<%@include file="sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <form action="${pageContext.request.contextPath}/lostpassword" method="post">
                    <h1 class="text-color-darker">Retrieve password</h1>
                    <div class="form-group">
                        <c:if test="${wrongemailorlogin}">
                            <br><span class="error">No user with given e-mail address or login found</span>
                        </c:if>
                        <input type="text" name="email-login" class="form-control" id="email-login" placeholder="Enter e-mail address or login">
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Retrieve password</button>
                </form>
            </div>
        </div>
    </div>
</section>

<%@include file="utils/scripts.jsp"%>
</body>
</html>
