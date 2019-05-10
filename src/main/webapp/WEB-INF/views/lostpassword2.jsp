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
                <form action="${pageContext.request.contextPath}/lostpassword/${id}/${token}" method="post">
                    <h1 class="text-color-darker">Retrieve password</h1>
                    <div class="form-group">
                        <c:if test="${passlength}">
                            <br><span class="error">Password must have at least 8 characters</span>
                        </c:if>
                        <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter password">
                    </div>
                    <div class="form-group">
                        <c:if test="${passnoteq}">
                            <br><span class="error">Passwords must be equal</span>
                        </c:if>
                        <input type="password" class="form-control" name="newPasswordRepeat" id="newPasswordRepeat" placeholder="Confirm password">
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
