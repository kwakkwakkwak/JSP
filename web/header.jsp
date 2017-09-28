<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/header.css">

<div class="container">

    <a style="float: left" href="/index.jsp">HOME</a>

    <div class="dropdown">
        <button class="dropbtn"><img src="/img/sign.png" style="background-color: inherit"></button>
        <div class="list">
            <%--<%--%>
                <%--//System.out.println((String) session.getAttribute("id"));--%>
                <%--if (session.getAttribute("id") == null) { // session 에 id 값이 없을땐--%>
            <%--%>--%>
                <c:choose  >
                    <c:when test="${empty sessionScope.id }">
            <a href="/sign/SignupForm.jsp">Sign Up</a>
            <a href="/sign/SigninForm.jsp">Sign In</a>
                    </c:when>
            <%--<%--%>
            <%--} else {--%>

            <%--%>--%>
                    <c:when test="${!empty sessionScope.id }">
            <a href="/sign/pwchangeForm.jsp">pwChange</a>
            <a href="/sign/signout.jsp">SignOut</a>
                    </c:when>
                </c:choose>
            <%--<%--%>
                <%--}--%>
            <%--%>--%>
        </div>
    </div>

    <div class="dropdown">
        <button class="dropbtn">About</button>
        <div class="list">
            <a href="https://github.com/kwakkwakkwak">GitHub</a>
            <a href="https://kwakkwakkwak.github.io/">Blog</a>
        </div>
    </div>

    <a href="/board/board.jsp">Borad</a>
    <div class="dropdown">
        <button class="dropbtn">Game</button>
        <div class="list">
            <a href="/game/Dice.jsp">Dice</a>
            <a href="/game/fortune.jsp">Fortune</a>
        </div>
    </div>

</div>

