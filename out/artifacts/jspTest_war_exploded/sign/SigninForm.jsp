
<!DOCTYPE html>
<%@page import="java.net.URLDecoder"%>
<html>
<style>
    *{
        color: white;
        background-color:  black;
    }
    form {
        border: 3px solid #f1f1f1;
    }

    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
        color: white;
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    button:hover {
        opacity: 1;
    }

    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }

    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }

    img.avatar {
        width: 40%;
        border-radius: 50%;
    }

    .container {
        padding: 16px;
    }

    span.psw {
        float: right;
        padding-top: 16px;
    }

    /* Change styles for span and cancel button on extra small screens
        ì´í´ê° ìë¨*/
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
    #target{
    		display :none;
    }
</style>
<body bgcolor="black">

<h2>Login Form</h2>
<%
String target = "";
if(null != request.getParameter("target"))
	target = request.getParameter("target");

//쿠기캆이 있는지 확인 
Cookie[] cookie = request.getCookies();

String checkcookie = "";
for(int i = 0 ; i < cookie.length ; i++)
	if(cookie[i].getName().equals("email")){
		cookie[i].setPath("/");
		checkcookie = URLDecoder.decode(cookie[i].getValue(),"UTF-8");
		break;
	}

%>
<form action="./signin.jsp?target=<%=target %>" method="post">
    <div class="imgcontainer">
        <img src="../img/avatar.png" alt="Logo" class="avatar">
    </div>

    <div class="container">
        <label><b>UserID</b></label>
        <input type="text" placeholder="Enter Username" name="email" value = "<%=checkcookie %>" required >

        <label><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="pw" required>

        <button type="submit">Login</button>
        <input type="checkbox" name ="remember" <%=checkcookie != "" ? "checked" :""  %> >Remember me
    </div>
<hr style="height: 2px; background-color: #ffffff;">
    <div class="container" style="background-color:#000">
        <button type="button" class="cancelbtn">Cancel</button>
        <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
</form>

</body>
</html>
