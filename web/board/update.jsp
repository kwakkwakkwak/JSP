<%@ page import="DAO.UserDao" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.Board" %><%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2017. 9. 27.
  Time: PM 5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    UserDao userDao = UserDao.getInstence();
    BoardDAO boardDAO = BoardDAO.getInstence();
    Board board = boardDAO.selectBoard(Integer.parseInt(request.getParameter("boardid")));
    board.setContent(request.getParameter("content"));
    board.setTitle(request.getParameter("title"));
    boardDAO.updateBoard(Integer.parseInt(request.getParameter("boardid")),board);
%>
<script type="text/javascript">
    location.href="/board/board.jsp";
    alert("글쓰기 수정 완료!");
</script>
