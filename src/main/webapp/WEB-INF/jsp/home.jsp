<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="template-imports.jsp" />
    <title>Recommendation System</title>
    <link rel="stylesheet" href="/css/homepage.css">
</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<body>
<jsp:include page="menu-template.jsp" />

<section class="jumbotron text-center">
    <div class="container">

        <br>
        <br>

        <h1 class="jumbotron-heading">E-COMMERCE CATEGORY</h1>
        <p class="lead text-muted mb-0">Buy our products. Project available in Github. Link: </p>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item"><a href="/products/">Category</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sub-category</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-12 col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                <ul class="list-group category_block">
                    <li class="list-group-item"> <a href="/products/Headset" class="btn  a-link cm" ><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQvkmPeCMV82l-qSgD8vUK_C02Rzou_nbOX521ARFC19ihykRIA&usqp=CAU" alt="" style="width:90px"><p style="font-size:12.5px;"><b>Headset</b></p></a></li>
                    <li class="list-group-item"> <a href="/products/Airpod" class="btn  a-link cm" ><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYCY-ySaSn0w5m78A7VKBa3CK-p-zDcLZFtYdVKULRte8oFsHg&s" alt="" style="width:90px"><p style="font-size:12.5px;"><b>Airpod</b></p></a></li>
                    <li class="list-group-item"><a href="/products/">See All</a></li>
                </ul>
            </div>
            <div class="card bg-light mb-3">
                <div class="card-header bg-success text-white text-uppercase">Last product</div>
                <div class="card-body">
                    <img class="img-fluid" src="https://dummyimage.com/600x400/55595c/fff" />
                    <h5 class="card-title">Product title</h5>
                    <p class="card-text">Recently bought or Recommended products for the user or Items on Sale. </p>
                    <p class="bloc_left_price">99.00 $</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="row">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="https://m.media-amazon.com/images/I/61GYC9FsyuL._AC_UL320_ML3_.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title"><a href="product.html" title="View Product">Nike</a></h4>
                            <p class="card-text">Men's Zoom Domination TR 2 Training Shoes.</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">129.00 $</p>
                                </div>
                                <div class="col">
                                    <a href="#" class="btn btn-success btn-block">Add cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="https://m.media-amazon.com/images/I/61hjkO9uHQL._AC_UL320_ML3_.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title"><a href="product.html" title="View Product">Adidas</a></h4>
                            <p class="card-text">adidas Men's Ultraboost Black/Black/Grey Shoes</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">189.00 $</p>
                                </div>
                                <div class="col">
                                    <a href="#" class="btn btn-success btn-block">Add cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="https://images-na.ssl-images-amazon.com/images/I/71o6haTjnQL._AC_UY695_.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title"><a href="product.html" title="View Product">Levi's</a></h4>
                            <p class="card-text">Levi's Shoes Rio Waxed UL NB BT</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">89.00$</p>
                                </div>
                                <div class="col">
                                    <a href="#" class="btn btn-success btn-block">Add cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="https://m.media-amazon.com/images/I/51hMUmm8lGL._AC_UL320_ML3_.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title"><a href="product.html" title="View Product">Lenovo</a></h4>
                            <p class="card-text">Lenovo IdeaPad S145 Newest 15.6 Inch Premium Laptop</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">749.99 $</p>
                                </div>
                                <div class="col">
                                    <a href="#" class="btn btn-success btn-block">Add cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="https://m.media-amazon.com/images/I/61rB5Q7E9YL._AC_UL320_ML3_.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title"><a href="product.html" title="View Product">Samsung</a></h4>
                            <p class="card-text">Samsung Electronics Galaxy S10e Factory Unlocked Phone</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">349.99 $</p>
                                </div>
                                <div class="col">
                                    <a href="#" class="btn btn-success btn-block">Add cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="https://m.media-amazon.com/images/I/51xsSuMBLgL._AC_UL320_ML3_.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title"><a href="product.html" title="View Product">Apple</a></h4>
                            <p class="card-text">Obuolys MacBook Pro 13 Inch Case, New Formula, Ultra-Thin Light and Soft Mac Shell for Model
                                A2159, A1989, A1708, or A1706, Crystal Clear</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">999.99 $</p>
                                </div>
                                <div class="col">
                                    <a href="#" class="btn btn-success btn-block">Add cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <nav aria-label="...">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active">
                                <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<footer class="text-light">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-lg-4 col-xl-3">
                <h5>About</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <p class="mb-0">
                    Team Innovators: Amol Dulal<br>
                    Ashish Joshi<br>
                    Srijal Joshi
                </p>
            </div>


            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                <h5>Informations</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <ul class="list-unstyled">
                    <li><a href="">Help</a></li>
                    <li><a href="">Sell Products</a></li>
                    <li><a href="">Shipping Rates</a></li>
                </ul>
            </div>



            <div class="col-md-4 col-lg-3 col-xl-3">
                <h5>Contact</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <ul class="list-unstyled">
                    <li><i class="fa fa-home mr-2"></i> Innovators</li>
                    <li><i class="fa fa-envelope mr-2"></i> admin@admin.com</li>
                    <li><i class="fa fa-phone mr-2"></i> +123456789</li>
                </ul>
            </div>

        </div>
    </div>
</footer>
</body>
</html>
