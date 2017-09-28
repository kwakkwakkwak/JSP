<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

        table {

            border-collapse: collapse;
            width: 100%;
        }

        tr {
            background-color: white;
            color: black;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }

        tr:hover {
            background-color: #9f9f9f;
        }

        th {

            background-color: #3f3f3f;
            color: white;
        }

        #write {
            float: right;
            background-color: #3f3f3f;
            color: white;
            font-size: 18px;
            font-style: italic;

            border: none;
            margin-top: 10px;
            padding: 8px 16px 8px 16px;

        }

        #write:hover {
            display: block;
            background-color: #9f9f9f;
        }

        a {
            text-decoration: none;
            color: black;
        }

        #right {
            margin: 5px;
            display: block;
            text-align: right;
        }

        #right a {
            font-size: 16px;
            color: white;
        }

        h1 {
            text-align: center;
        }

        .boradfoot {
            display: block;
        }

        .boradfoot a {
            color: white;
            float: right;

            padding: 10px 6px 10px 6px;
        }

        .boradlist {
            margin-top: 80px;
        }

        .context {
            min-height: 800px;
        }

    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판</title>
    <%@ include file="../header.jsp" %>
    <%@ page import="DAO.*" %>
    <%@ page import="java.util.List" %>
</head>
<body bgcolor="black">
<div class="contexter">
    <div class="board">
        <H1>게시판</H1>
        <%
            BoardDAO boardDAO = BoardDAO.getInstence();
            UserDao userDao = UserDao.getInstence();
            int id = 0;
            if (null != request.getParameter("boardid"))
                if (0 < (id = Integer.parseInt(request.getParameter("boardid")))) {
                    Board board = boardDAO.selectBoard(id);
                    board.setCount(board.getCount() + 1);
                    boardDAO.updateBoard(id, board);

        %>
        <table>
            <tr>
                <th style="width: 20%; min-width: 100px"><%=userDao.selectUser(board.getWriter()).getEmail()%>
                </th>
                <th style="width: 60%; min-width: 600px"><%=board.getIn_date()%>
                </th>
                <th style="width: 20%; min-width: 100px"><%=board.getCount()%>
                </th>
            </tr>
        </table>
        <span id="right"><a href="board.jsp">목록</a></span>
        <div class="context">
            <p>
            <h1><%=board.getTitle()%>
            </h1>
            </p>
            <pre><%=board.getContent() %></pre>

        </div>
        <div class="boradfoot">
            <a href="./updateForm.jsp?boardid=<%=id%>"> 수정 </a>
            <a href="./delete.jsp?boardid=<%=id%>"> 삭제 </a>

        </div>


        <%

                }
        %>

    </div>
    <div class="boradlist">


        <H3>목록</H3>

        <table>
            <tr>
                <th style="min-width: 50px">no</th>
                <th style="min-width: 400px">제목</th>
                <th style="min-width: 200px;">날짜</th>
                <th style="min-width: 50px; ">죄회수</th>
                <th style="min-width: 100px;">작성자</th>
            </tr>


            <%

                List<Board> boardList = boardDAO.selectBoardAll();
                Board board = null;
                for (int i = boardList.size()-1 ; i >= 0 ; i--) {
                    board = boardList.get(i);
            %>

            <tr>
                <td><%=board.getBoradId()%>
                </td>
                <td><a href="board.jsp?boardid=<%=board.getBoradId()%>"><%=board.getTitle()%>
                </a>
                </td>
                <td><%=board.getIn_date()%>
                </td>
                <td><%=board.getCount()%>
                </td>
                <td><%=userDao.selectUser(board.getWriter()).getEmail()%>
                </td>
            </tr>

            <%
                }
            %>
        </table>
        <a id = "write"href="insertForm.jsp"> 글쓰기</a>
    </div>
</div>
</body>
</html>