<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <jsp:include page="template-imports.jsp"/>
</head>
<body>

<script language = 'javascript'>
    function check(input){
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Password Must be Matching.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }

</script>

<jsp:include page="menu-template.jsp" />

<form action="signup" method="POST">
    <div class="formGroup container">
        <h1 style = "color:white;">Register For An Account</h1>
        <div class="row">
            <div class="col-md-4">
                <label for="firstname"><b>First Name:</b></label>
                <br>
                <input type="text" class="form-control" name="firstname" placeholder="First Name" pattern="[A-Za-z]+" required>
                <br>
                <label for="lastname"><b>Last Name:</b></label>
                <br>
                <input type="text" class="form-control" name="lastname" placeholder="Last Name" pattern="[A-Za-z]+" required>
                <br>
                <label for="email"><b>Email:</b></label>
                <br>
                <input type="email" class="form-control" name="email" placeholder="Email" required>
                <br>
                <label for="password"><b>Password:</b></label>
                <br>
                <input type="password" id = "password" class="form-control" name="password" placeholder="*****" required>
                <br>
                <label for="psw-repeat"><b>Repeat Password:</b></label>
                <br>
                <input type="password" id="repeatPassword" class="form-control" name="psw-repeat" oninput="check(this)" placeholder="*****" required>
                <br>
            </div>
            <div class="col-md-6">
                <label for="street"><b>Street:</b></label>
                <br>
                <input type="text" id="street" class="form-control" name="street" placeholder="Street" required>
                <br>
                <label for="apt"><b>Apt Number:</b></label>
                <input type="text" id="apt" class="form-control" name="aptNumber" placeholder="Apt #" required>
                <br>
                <label for="city"><b>City:</b></label>
                <br>
                <input type="text" id="city" class="form-control" name="city" placeholder="City" required>
                <br>
                <label for="state"><b>State:</b></label>
                <br>
                <input type="text" id="state" class="form-control" name="state" placeholder="State" required>
                <br>
                <label for="zipCode"><b>Zip Code:</b></label>
                <br>
                <input type="text" id="zipCode" class="form-control" name="zip" title="Need 5 digits" placeholder="Zip Code" required>
                <br>
                <label for="phone"><b>Phone number:</b></label>
                <br>
                <input type="text" id="phone" class="form-control" name="phone" title="Need 10 digits" placeholder="Phone">
                <br>
                <input type="hidden" id="active" name="active" value="1">
                <br>
                <input type="radio" id="radioCustomer" name="userType" value="customer" checked>
                <label for="radioCustomer">Customer</label><br>
                <input type="radio" id="radioSeller" name="userType" value="seller">
                <label for="radioSeller">Seller</label><br>
            </div>
        </div>
        <br>
        <p>By creating an account you agree to our Terms & Privacy</p>
        <button type="submit" class="btn btn-success registerbtn" onclick="regConfirm.html">Register</button>
        </center>
    </div>
</form>
</body>
</html>