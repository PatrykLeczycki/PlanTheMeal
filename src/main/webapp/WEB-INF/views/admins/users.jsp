<%--
  Created by IntelliJ IDEA.
  User: patryk
  Date: 21.04.19
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <%@include file="../utils/files.jsp"%>
</head>
<body>

<%@include file="../sections/header.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@include file="../sections/sidebar.jsp"%>

    <div class="m-4 p-3 width-medium">
        <div class="m-4 p-3 border-dashed view-height">

            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">LISTA UŻYTKOWNIKÓW</h3>
                </div>
                <div class="col d-flex justify-content-end mb-2 noPadding">
                    <a href="#" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Powrót</a>
                </div>
            </div>

            <div class="schedules-content">
                <table class="table">
                    <thead>
                    <tr class="d-flex">
                        <th class="col-1">ID</th>
                        <th class="col-3">IMIĘ</th>
                        <th class="col-6">NAZWISKO</th>
                        <th class="col-2 center">AKCJE</th>
                    </tr>
                    </thead>
                    <tbody class="text-color-lighter">
                    <tr class="d-flex">
                        <td class="col-1">1</td>
                        <td class="col-3">Marek</td>
                        <td class="col-6">Marecki</td>
                        <td class="col-2 center">
                            <a href="#" class="btn btn-danger rounded-0 text-light m-1">Blokuj</a>
                        </td>
                    </tr>
                    <tr class="d-flex">
                        <td class="col-1">2</td>
                        <td class="col-3">Marek</td>
                        <td class="col-6">Marecki</td>
                        <td class="col-2 center">
                            <a href="#" class="btn btn-danger rounded-0 text-light m-1">Blokuj</a>
                        </td>
                    </tr>
                    <tr class="d-flex">
                        <td class="col-1">3</td>
                        <td class="col-3">Marek</td>
                        <td class="col-6">Marecki</td>
                        <td class="col-2 center">
                            <a href="#" class="btn btn-danger rounded-0 text-light m-1">Blokuj</a>
                        </td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    </div>
    </section>

<%@include file="../sections/footer.jsp"%>

<%@include file="../utils/scripts.jsp"%>
</body>
</html>
