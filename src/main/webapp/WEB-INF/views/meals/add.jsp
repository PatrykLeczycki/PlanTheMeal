<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add meal</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>

<%@include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <form:form action="/user/meal/add" method="post" modelAttribute="meal">
            <%@include file="addform.jsp"%>
        </form:form>

    </div>
</section>

<%@include file="../sections/footer.jsp"%>

</body>
</html>