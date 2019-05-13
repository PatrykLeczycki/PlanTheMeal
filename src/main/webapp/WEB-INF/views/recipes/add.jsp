<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add recipe</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>
<%@include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

        <form:form action="/user/recipe/add" method="post" modelAttribute="recipeDto">
            <%@include file="addform.jsp"%>
        </form:form>

    </div>
</section>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/recipescripts.js"></script>
<%@include file="../sections/footer.jsp"%>

<%@include file="../utils/scripts.jsp"%>
</body>
</html>
