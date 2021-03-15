<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="template-imports.jsp"/>
    <title>Showing Products</title>
</head>

<style>
    .quantityInput {
        padding: 5px;
        width: 3em;
        height: 2em;
        border: 2px solid rgba(49, 200, 100, 0.7);
        border-radius: 4px;
    }

    #suggestedProductContainer {
        width: 200px;
        height: 600px;
        overflow-y: auto;
    }
</style>
<body>
<jsp:include page="menu-template.jsp"/>

<br><br>
<br><br>

<div class="row">
    <div class="offset-3 col-md-6 text-center" id="addProductContainer"></div>
</div>


<div class="container container-fluid">

    <div class="row">
            <div id="productContainer" class="col-6 col-md-4">
                <div class="card">
                    <img class="card-img-top img-fluid" src="${product.imageUrl}">
                    <div class="card-body">

                    </div>
                </div>
            </div>

            <div class="product_description col-md-4">
                <h4 class="card-title"><a href="/products/${product.id}/details">${product.name}</a></h4>
                <p class="card-text">${product.description}</p>
                <div class="row">
                    <div class="col">
                        <p id="totalPrice" class="btn btn-danger btn-block btn-sm">$${product.price}</p>
                    </div>
                    <div class="col">
                        <input id="btnQuantity" type="number" min="1" max="10" class="quantityInput" value="1"
                               data-price="${product.price}">
                    </div>
                    <div class="col">
                        <div>
                            <button class="btn btn-outline-success btn-sm" id="btnAddProduct">Add to cart
                            </button>
                        </div>
                    </div>
                    <div data-productid="${product.id}" data-userid="${sessionScope.user.id}"
                         data-cartid="${sessionScope.cart.id}" id="paramsDiv"></div>
                    <c:if test="${sessionScope.user.userCategory.userType == 'seller'}">
                        <div>
                            <a href="/products/${product.id}/edit">Edit</a>
                            <!--                            TODO: implement bootstrap modal here to update the product -->
                        </div>
                    </c:if>
                </div>
            </div>

        <!--        TODO: suggest for multiple close neighbor products -->

        <div id="suggestedProductContainer" class="offset-1 col-4 col-md-3 col-xs-6">
            <h4>Suggested Items:</h4>
            <c:forEach var="predictedProduct" items="${predictedProducts}">
                <div class="card">
                    <img class="card-img-top img-fluid" src="${predictedProduct.imageUrl}">
                    <div class="card-body">
                        <div class="product_description">
                            <h4 class="card-title"><a href="/products/${predictedProduct.id}/details">${predictedProduct.name}</a></h4>
                            <p class="card-text">Brand: ${predictedProduct.productBrand.brandName}</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block btn-sm">$${predictedProduct.price}</p>
                                </div>
                                <div class="col">
                                    <div><a class="btn btn-outline-success btn-sm"
                                            href="/products/${predictedProduct.id}/details">Details</a>
                                    </div>
                                </div>
                                <div data-productid="${product.id}" data-userid="${sessionScope.user.id}"
                                     data-cartid="${sessionScope.cart.id}" id="paramsDiv"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </c:forEach>
        </div>


    </div>

</div>
</body>

<script>

    var msgdiv = $("#addProductContainer");
    var newdiv = '<div  class="alert alert-info" role="alert">Added to Cart</div>';

    var paramsdiv = $("#paramsDiv");
    var product_id = paramsdiv.data('productid');


    let user_id = paramsdiv.data('userid');
    let cart_id = paramsdiv.data('cartid');
    let quantity = $("#btnQuantity").val();

    // get the count from the number input
    quantity = quantity;
    if (quantity == NaN) {
        quantity = 0;
    }

    let total = parseFloat($("#btnQuantity").data('price')) * parseInt(quantity);

    $("#btnQuantity").on('keyup mouseup', function () {
        quantity = $(this).val();
        quantity = isNaN(quantity) ? 0 : quantity;
        total = parseFloat($(this).data('price')) * parseInt(quantity);
        $("#totalPrice").text('$' + total.toFixed(2));
    });

    let counter = 0;
    $("#btnAddProduct").click(function () {
        window.product_id = product_id;
        // alert(`Product id: ${product_id}`);
        // serialize data into json and create an ajax request to send to the /cart/add/{product_id}?u=user_id&c=cart_id
        $.ajax({
            'url': '/cart/add/' + product_id,
            'type': 'POST',
            'data': {
                'user_id': user_id,
                'cart_id': cart_id,
                'quantity': quantity
            },
            success: function (data) {
                console.log(data);
            }

        });

        msgdiv.append(newdiv);
        setTimeout(function () {
            msgdiv.fadeOut();
        }, 1200);
    });


</script>
</html>