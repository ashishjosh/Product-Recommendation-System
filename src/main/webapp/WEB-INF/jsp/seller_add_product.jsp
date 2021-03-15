<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <jsp:include page="template-imports.jsp" />
    <title>Manage product</title>
</head>

<body>

<jsp:include page="menu-template.jsp" />

<br><br><br><br><br>
<p>${uploadMessage}</p>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Add new Product</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <form id="newProductForm" action="/seller/add_product" method="post">
                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Name">
                        <br>
                        <label>Product Description</label>
                        <input type="text" name="description" class="form-control" placeholder="Description">
                        <br>
                        <label>Price</label>
                        <input name="price" class="form-control" placeholder="Price">
                        <br>
                        <label>Image</label>
                        <input type="text" name="imageUrl" class="form-control" placeholder="Image link">
                        <br>
                    </div>
                    <div class="form-group">
                        <label for="category">Product Category</label>
                        <input type="text" name="categoryName" class="form-control" id="Category" placeholder="Category" >
                        <br>
                        <label for="productBrand">Product Brand</label>
                        <input type="text" name="brandName" class="form-control" id="productBrand" placeholder="Brand" >
                    </div>
                    <button type="submit" class="btn btn-outline-primary btn-sm">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-sm btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn-sm btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Edit Movie</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <form id="editMovieForm" action="/a/movies/edit" method="post">
                    <div class="form-group">
                        <label>Movie Title</label>
                        <input type="text" name="title" class="form-control" placeholder="Title">
                    </div>
                    <div class="form-group">
                        <label>Director</label>
                        <input type="text" name="director" class="form-control" placeholder="Director">
                        <br>
                        <label>Trailer Video</label>
                        <input type="text" name="trailerVideo" class="form-control" placeholder="Trailer Video link">
                        <br>
                        <label>Trailer Picture</label>
                        <input type="text" name="trailerPicture" class="form-control" placeholder="Trailer Picture link">
                        <br>
                    </div>
                    <div class="form-group">
                        <label>Synopsis</label>
                        <textarea class="form-control" name="synopsis">Enter the movie synopsis</textarea>
                        <br>

                        <label>Duration</label>
                        <input class="form-control" type="text" name="duration" >
                    </div>
                    <div class="form-group">
                        <label for="selectRating">Rating</label>
                        <select name="rating" class="form-control" id="selectRatingUpdate">
                            <option>G</option>
                            <option>PG-13</option>
                            <option>R</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-sm btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn-sm btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!--Actual content is shown because of the section below-->
<div class="container">

    <form action="#">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3">
                    <input type="text" id="myInput" class="form-control" placeholder="Search Product"> <br>
                    <input type="submit" class="btn btn-outline-success btn-sm">

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
                        Add new Product
                    </button>

                </div>
            </div>
        </div>
    </form>

    <br><br>
    <table class="table table-hover" id="myTable">
        <thead>
        <tr>
            <th scope="col">id</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            <th scope="col">Brand</th>
            <th scope="col">Category</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${products}" var="product" >
            <tr id="${product.id}">
                <th scope="row" id="productID">${product.id}</th>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.productBrand.brandName}</td>
                <td>${product.productCategory.categoryName}</td>
                <td><a class="btn btn-outline-success btn-sm"  data-toggle="modal" data-target="#exampleModal">Edit</a></td>
                <td><a href="#" class="btn btn-outline-danger btn-sm btn-delete-movie">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="<c:url value="/js/movie.js" />" type="application/javascript">
</script>
</body>
</html>