<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="template-imports.jsp" />
    <title>Showing Products</title>
</head>

<body>
<jsp:include page="menu-template.jsp" />

<br><br>

<h1 class="text-center">Products belonging to ${productCategory}</h1>
<div class="container container-fluid">
    <div class="row">

        <c:forEach var="product" items="${productsModel}" >
            <div class="col-10 col-md-4 col-lg-3">
                <div class="card">
                    <img class="card-img-top img-fluid" src="${product.imageUrl}">
                    <div class="card-body">
                        <h4 class="card-title"><a href="product.html" title="View Product">${product.name}</a></h4>
                        <p class="card-text">${product.description}</p>
                        <div class="row">
                            <div class="col">
                                <p class="btn btn-danger btn-sm">$${product.price}</p>
                            </div>
                            <div class="col">
                                <a href="/products/${product.id}/details" class="btn btn-outline-success btn-sm">Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </c:forEach>
    </div>
</div>
</body>
</html>