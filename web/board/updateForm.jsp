<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판 수정</title>
    <style>
        body {
            font-family: Arial;
            margin: 0;
            color: white;

        }

        .contexter {
            margin: auto;
            width: 900px;

        }
        h1 {
            text-align: center;
        }
        input{
            width: 100%;
            color: white;
            background-color: #111111;;
            margin-bottom: 30px;
            height: 30px;
            font-size: 16px;
            outline: none;
        }
        textarea{
            outline: none;
            color: white;
            background-color: #111111;
            width: 100%;
            height: 500px;
            resize: none;
            overflow-y:hidden

        }
        button{
            color: #FFF;
            text-decoration: none;
            outline: none;
            border: none;
            background-color: #9f9f9f;
            float: right;
            width: 80px;
            height: 30px;
            font-size: 14px;
            padding: 6px 16px 6px 16px;
            margin: 10px 0px 10px 10px;
        }
        button:hover{
            background-color: #cccccc;
        }
    </style>
</head>
<body bgcolor="black">
<%@ include file="../header.jsp" %>
<%@ page import="DAO.*" %>
<%
    int boardid = Integer.parseInt(request.getParameter("boardid"));
    BoardDAO boardDAO = BoardDAO.getInstence();
    Board board = boardDAO.selectBoard(Integer.parseInt(request.getParameter("boardid")));
%>
<div class="contexter">
    <form action="./update.jsp?boardid=<%=boardid%>" method="post">
        <h1> 글쓰기 </h1>

        <label><b>Title</b></label>
        <input type="text" placeholder="Enter Title" name="title" required
               value="<%=board.getTitle()%>">

        <label><b>Content</b></label>
        <textarea placeholder="Enter Contents" name="content" ><%=board.getContent()%></textarea>
        <Button type="submit"> 등록 </Button> <Button type="reset"> 취소 </Button>
    </form>
</div>
</body>
</html>