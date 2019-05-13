<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>
<%@include file="../sections/header/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>


        <form action="/user/plan/edit/${id}" method="post">
            <%@include file="editform.jsp"%>
        </form>

    </div>
</section>


<%@include file="../sections/footer.jsp"%>

<%@include file="../utils/scripts.jsp"%>
</body>
</html>
