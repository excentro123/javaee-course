<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<%@ include file="head.jsp" %>

<body>

<jsp:include page="navigation.jsp">
    <jsp:param name="title" value="Category" />
</jsp:include>

<div class="container">
    <div class="row py-2">
        <div class="col-12">
            <c:url value="/category/new" var="newCustomerUrl" />
            <a class="btn btn-primary" href="${newCustomerUrl}">Add Category</a>
        </div>
        <div class="col-12">
            <table class="table table-bordered my-2">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${requestScope.categories.isEmpty()}">
                        <tr>
                            <td colspan="2">
                                No data
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="category" items="${requestScope.categories}">
                            <tr>
                                <th scope="row">
                                    <c:out value="${category.id}" />
                                </th>
                                <td>
                                    <c:out value="${category.name}" />
                                </td>
                                <td>
                                    <c:url value="/category/${category.id}" var="customerUrl" />
                                    <a class="btn btn-success" href="${customerUrl}"><em class="fas fa-edit"></em></a>
                                    <a class="btn btn-danger" href="#"><em class="far fa-trash-alt"></em></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="scripts.jsp" %>

</body>
</html>