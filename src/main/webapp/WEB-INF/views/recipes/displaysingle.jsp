<tr class="d-flex">
    <th scope="row" class="col-1">${recipe.id}</th>
    <td class="col-2">
        ${recipe.name}
    </td>
    <td class="col-7">${recipe.description}</td>
    <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
        <a href="${pageContext.request.contextPath}/user/recipe/delete/${recipe.id}" class="btn btn-danger rounded-0 text-light m-1">Delete</a>
        <a href="${pageContext.request.contextPath}/user/recipe/details/${recipe.id}" class="btn btn-info rounded-0 text-light m-1">Details</a>
        <a href="${pageContext.request.contextPath}/user/recipe/edit/${recipe.id}" class="btn btn-warning rounded-0 text-light m-1">Edit</a>
    </td>
</tr>