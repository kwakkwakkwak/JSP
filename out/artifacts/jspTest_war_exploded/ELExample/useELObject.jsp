<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2017. 9. 27.
  Time: AM 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
request.setAttribute("name","곽경진");
%>
<html>
<head>
    <title>EL Object</title>
</head>
<body>
요청 URI : ${pageContext.request.requestURI}<br>
request의 name 속성 : ${requestScope.name}<br>
code 파리미터 : ${param.code}<br>
</body>
</html>
