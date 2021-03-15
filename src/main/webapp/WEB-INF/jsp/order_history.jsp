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

<style>
    .orderSummary {
        padding: 10px;
        border: 2px solid grey;
        margin-bottom: 10px;
    }
</style>
<body>
<jsp:include page="menu-template.jsp" />

<br><br>
<br><br>
<div class="row">
    <div class="offset-3 col-md-6 text-center">

        <h1>Order History:</h1>
        <c:forEach var="order" items="${customerOrderList}">
            <br><br>
            <div class="orderSummary">
                <br><br><br>
                <h4>Items:</h4>
                <c:forEach var="cartItem" items="${order.cart.cartItemList}">
                    <br><br>
                    <div class="content">
                    <h3><a href="/proucts/{cartItem.product.id}/details">${cartItem.product.description}</a></h3>
                        <img src="${cartItem.product.imageUrl}" class="img-fluid img-thumbnail trailer-image">
                        <p>${cartItem.quantity} x ${cartItem.product.productBrand.brandName} ${cartItem.product.productCategory.categoryName} @ ${cartItem.product.price} + TAX per each</p>
                    </div>
                </c:forEach>
                <h6>
                    Grand Total: ${order.cart.grandTotal}
                </h6>
            </div>
        </c:forEach>
        <!--        <h2>-->
        <!--            Please rate the products you purchased!-->
        <!--        </h2>-->
    </div>
</div>
</body>
</html>