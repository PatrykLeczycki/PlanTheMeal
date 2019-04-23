<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit recipe</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>
<%@include file="../sections/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <form:form action="/recipe/add" method="post" modelAttribute="recipe">
            <%@include file="editform.jsp"%>
        </form:form>

    </div>
</section>



<%@include file="../sections/footer.jsp"%>

<%@include file="../utils/scripts.jsp"%>
</body>
</html>
