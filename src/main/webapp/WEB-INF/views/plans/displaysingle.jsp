<tr class="d-flex">
    <td class="col-1">${plan.id}</td>
    <td class="col-2">${plan.name}</td>
    <td class="col-7">${plan.description}</td>
    <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
        <a href="${pageContext.request.contextPath}/admin/plan/delete/${plan.id}" onclick="return confirm('Are you sure you want to delete this plan?');" class="btn btn-danger rounded-0 text-light m-1">Delete</a>
        <a href="${pageContext.request.contextPath}/user/plan/details/${plan.id}" class="btn btn-info rounded-0 text-light m-1">Details</a>
        <a href="${pageContext.request.contextPath}/user/plan/edit/${plan.id}"  class="btn btn-warning rounded-0 text-light m-1">Edit</a>
    </td>
</tr>