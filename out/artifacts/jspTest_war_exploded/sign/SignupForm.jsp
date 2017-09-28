<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

    *{
        color: white;
        background-color: black;
    }
    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
        color: white;
    }

    /* Set a style for all buttons */
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.8;

    }

    /* Extra styles for the cancel button */
    .cancelbtn {
        padding: 14px 20px;
        background-color: #f44336;
        margin: 8px 1% 8px 0px;
    }
    .signupbtn{
        margin: 8px 0px 8px 1%;
    }

    /* Float cancel and signup buttons and add an equal width */
    .cancelbtn,.signupbtn {
        float: left;
        width: 49%;
    }

    /* Add padding to container elements */
    .container {
        padding: 16px;
    }

    /* Clear floats */
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    button:hover {
        opacity: 1;
    }


    /* Change styles for cancel button and signup button on extra small screens */
    @media screen and (max-width: 300px) {
        .cancelbtn, .signupbtn {
            width: 90%;

        }
    }
</style>
</head>
<body bgcolor="black">

<h2>Signup Form</h2>

<form action="signup.jsp" style="border:1px solid #ccc" method="post">
    <div class="container">

        <label><b>Name</b></label>
        <input type="text" placeholder="Enter Name" name="name" required>

        <label><b>Email</b></label>
        <input type="text" placeholder="Enter Email" name="email" required>

        <label><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="pw" required>

        <label><b>Repeat Password</b></label>
        <input type="password" placeholder="Repeat Password" name="repw" required>

        <input type="checkbox" name ="remember" > Remember me
        <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

        <div class="clearfix">
            <button type="button" class="cancelbtn">Cancel</button>
            <button type="submit" class="signupbtn">Sign Up</button>
        </div>
    </div>
</form>

</body>
</html>
