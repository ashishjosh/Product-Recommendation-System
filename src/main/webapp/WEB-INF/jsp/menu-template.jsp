<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>


<c:if test="${sessionScope.user != null && sessionScope.user.userCategory.userType == 'customer'}" >
    <div class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Recommendation System E commerce</a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="nav navbar-nav ml-auto">

                    <li class="nav-item"><a class="nav-link" href="/products">Browse Products</a></li>

<!--                    <li class="nav-item"><a class="nav-link" href="/search">Search</a></li>-->

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">${sessionScope.user.firstname}</a>
                        <div class="dropdown-menu dropdown-menu-right">
<!--                            <a class="dropdown-item" href="/edit-profile">Edit Profile</a>-->
                            <a class="dropdown-item" href="/order-history">View Order History</a>

                            <a class="dropdown-item" href="/logout">Logout</a>
                        </div>
                    </li>

                    <li>

                        <form class="form-inline my-2 my-lg-0" action="/products/search">
                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" name="productName" placeholder="Search Products">
                                <div class="input-group-append">
                                    <button type="submit" id="btnSearchProduct" class="btn btn-secondary btn-number">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            <a class="btn btn-success btn-sm ml-3" href="/cart">
                                <i class="fa fa-shopping-cart"></i> Cart
                            </a>
                        </form>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${sessionScope.user.userCategory.userType == 'seller'}" >
    <div class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Recommendation System E commerce</a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Products menu</a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/seller/${sessionScope.user.id}/all_products">Your products</a>
                            <a class="dropdown-item" href="/seller/add_product">Add new product</a>
                            <a class="dropdown-item" href="/seller/edit_product/product_id">Edit product</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">${sessionScope.user.firstname}</a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/edit-profile">Edit Profile</a>
                            <a class="dropdown-item" href="/order-history">View Order History</a>
                            <a class="dropdown-item" href="/logout">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</c:if>


<c:if test="${sessionScope.user.userCategory.userType == 'admin'}" >
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Recommendation System E commerce</a>
        </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
              <span class="navbar-toggler-icon"></span>
          </button>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <ul class="nav navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="/admin/manage_customers">Manage Customers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/manage_sellers">Manager Sellers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/manage_products">Manager Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Log Out</a>
        </li>
          </ul>
      </div>
      </div>
    </nav>
</c:if>


<c:if test="${sessionScope.user == null}" >

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="navbar-header">
          <a class="navbar-brand" href="/">Recommendation System E commerce</a>
        </div>
      <!-- Links -->

    <div class="collapse navbar-collapse" id="collapsibleNavbar">

        <ul class="nav navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="/login">Log In</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/signup">Sign Up</a>
            </li>
            <li>
            <form class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="/login">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">0</span>
                </a>
            </form>
            </li>

      </ul>
    </div>
    </nav>
</c:if>
