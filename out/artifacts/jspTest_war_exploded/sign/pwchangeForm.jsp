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


        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn {
            float: left;
            width: 49%;
        }

        .signupbtn {
            padding: 14px 20px;
            background-color: #4CAF50;
            margin: 8px 1% 8px 0px;
        }


        /* Float cancel and signup buttons and add an equal width */
        .signupbtn {
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

        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }


    </style>
    <title>비밀번호 변경</title>
</head>
<body>
<% String email = (String)session.getAttribute("id");
//System.out.println(id);
%>
<form action="./pwchange.jsp" method="post">

    <div class="container">
        <label><b>UserID</b></label>
        <input type="text" placeholder="Enter Username" name="email" value = "<%=email%>"  readOnly >

        <label><b>Ol dPassword</b></label>
        <input type="password" placeholder="Enter Old Password" name="oldpw" required>

        <label><b>New Passowrd</b></label>
        <input type="password" placeholder="Enter New Password" name="newpw" required>

        <label><b>Repeat Password</b></label>
        <input type="password" placeholder="Repeat Password" name="repw" required>

        <div class="clearfix">
            <button type="button" class="cancelbtn">Cancel</button>
            <button type="submit" class="signupbtn">Change Password</button>
        </div>
</form>
</body>
</html>
