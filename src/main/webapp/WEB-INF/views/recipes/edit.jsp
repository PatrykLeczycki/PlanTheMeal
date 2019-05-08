<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit recipe</title>
    <%@include file="../utils/files.jsp"%>

</head>
<body>
<%@include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <form:form action="/user/recipe/edit" method="post" modelAttribute="recipe">
            <form:hidden path="id"/>
            <form:hidden path="created"/>
            <form:hidden path="author"/>
            <form:hidden path="ingredients"/>
            <form:hidden path="preparation"/>
            <%@include file="editform.jsp"%>
        </form:form>
    </div>
</section>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/recipescripts.js"></script>

<%@include file="../sections/footer.jsp"%>

<%@include file="../utils/scripts.jsp"%>
</body>
</html>
