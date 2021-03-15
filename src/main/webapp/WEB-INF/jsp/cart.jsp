<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="template-imports.jsp" />
    <title>Showing Products</title>
</head>

<style>
    .quantityInput {
        padding: 5px;
        width: 5em;
        height: 2em;
        border: 2px solid rgba(49,200,100,0.7);
        border-radius: 4px;
    }

    .cartItem {
        padding: 10px;
        border: 2px solid grey;
        margin-bottom: 10px;
    }

    .grandTotal {
        background-color: black;
        color: gold;
        font-family: 'DejaVu Sans Mono', monospace;
    }
</style>
<body>
<jsp:include page="menu-template.jsp" />

<br><br>
<br><br>
<div class="row">
    <div class="offset-3 col-md-6 text-center" id="addProductContainer"></div>
</div>

<div class="container container-fluid">
    <form action="/cart/order-placed" method="post">
        <div class="row">
            <div id="productContainer" class="offset-3 col-md-4 col-xs-6">
                <c:forEach var="cartItem" items="${cartItemList}">
                    <div class="card cartItemDiv" id="cart-item-${cartItem.id}" data-id="${cartItem.id}">
                        <img src="${cartItem.product.imageUrl}" class="card-img-top img-fluid">
                        <div class="card-body">
                            <div class="product_description">
                                <h4 class="card-title"><a href="/products/${cartItem.product.id}/details">${cartItem.product.name}</a></h4>
                                <p class="card-text">${cartItem.product.description}</p>
                                <hr>
                                <div class="row">
                                    <div class="col-5">
                                        <p id="totalPrice-${cartItem.id}" class="btn btn-danger btn-block btn-sm">$${cartItem.totalPrice}</p>
                                    </div>
                                    <div class="col-3" data-cid="${cartItem.id}">
                                        <button type="button" class="btn btn-outline-danger btn-sm btnRemove">Remove</button>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-3"  data-cid="${cartItem.id}">
                                        <input id="btnQuantity" style="display: inline" type="number" min="1" max="10" class="quantityInput" value="${cartItem.quantity}" data-price="${cartItem.product.price}">
                                    </div>
                                    <div class="col-4" data-cid="${cartItem.id}">
                                        <button type="button" class="btnUpdateQuantity btn btn-outline-info btn-sm">Update</button>
                                    </div>
                                    <div data-productid="${cartItem.product.id}" data-userid="${sessionScope.user.id}"  data-cartid="${sessionScope.cart.id}" id="paramsDiv" ></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br>
                </c:forEach>

                <br>
                <h4 class="align-content-center">Grand total = <span class="grandTotal">$${cart.grandTotal}</span></h4>
                <br>
                <br>
                <c:if test="${cartItemList.size() > 0}">
                    <button id="placeOrder" type="submit" class="btn btn-outline-success">Place Order</button>
                </c:if>
            </div>
        </div>
    </form>
</div>
</body>





<script>
    var msgdiv = $("#addProductContainer");
    var newdiv = '<div  class="alert alert-info" role="alert">Removed from Cart</div>';

    var paramsdiv = $("#paramsDiv");
    let cartItemId = $(".cartItem").data('id');

    let user_id = paramsdiv.data('userid');
    let cart_id = paramsdiv.data('cartid');

    let quantity = $("#btnQuantity").val();

    if (quantity == NaN) {
        quantity = 0;
    }

    let total = parseFloat($("#btnQuantity").data('price')) * parseInt(quantity);

    $(".quantityInput").on('keyup mouseup', function () {
        quantity = $(this).val();
        quantity = isNaN(quantity) ? 0 : quantity;
        total = parseFloat($(this).data('price')) * parseInt(quantity);
        let id = $(this).closest('div').data('cid');
        $("#totalPrice-"+id).text('$' + total.toFixed(2));
    });

    $(".btnUpdateQuantity").click(function () {
        let id = $(this).closest('div').data('cid');
        $.ajax({
            'url': '/cart/update/' + id,
            'type': 'PUT',
            'data': {
                'quantity': quantity
            },
            success: function (cartAndCartItem) {
                console.log(cartAndCartItem)
                $("#totalPrice-"+id).text('$' + cartAndCartItem[1].totalPrice.toFixed(2));
                $(".grandTotal").text("$"+ cartAndCartItem[0].grandTotal.toFixed(2))

            }
        });
    });


   $(".btnRemove").click(function() {

       let id = $(this).closest('div').data('cid');
       console.log(id)
        $.ajax({
            'url': '/cart/remove/'+id,
            'type': 'DELETE',
            success: function (cart) {
                console.log(cart);
                console.log("remove cartItem " + cartItemId);
                $("#cart-item-"+id).remove();
                $(".grandTotal").text("$"+cart.grandTotal)
                if(cart.cartItemList <= 0) {
                    $("#placeOrder").remove();
                }
            }
        });
    });

</script>
</html>
