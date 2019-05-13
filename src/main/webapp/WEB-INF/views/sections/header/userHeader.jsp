<header class="page-header">
    <nav class="navbar navbar-expand-lg justify-content-between">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand main-logo">
            Plan <span>The Meal</span>
        </a>
        <ul class="nav nounderline text-uppercase">

            <c:if test="${!dashboard}">
                <li class="nav-item ml-4">
                    <a class="nav-link color-header" href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a>
                </li>
            </c:if>
            <li class="nav-item ml-4">
                <a class="nav-link color-header" href="${pageContext.request.contextPath}/logout">Logout</a>
            </li>
        </ul>
        <div class="d-flex justify-content-around">
            <h4 class="text-light mr-3"><sec:authentication property="principal.username" /></h4>
            <div class="circle-div text-center"><i class="fas fa-user icon-user"></i></div>
        </div>
    </nav>
</header>
