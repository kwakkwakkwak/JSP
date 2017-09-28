<%@ page import="DAO.UserDao" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.Board" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    //insert
    request.setCharacterEncoding("utf-8");
    UserDao userDao = UserDao.getInstence();
    BoardDAO boardDAO = BoardDAO.getInstence();
    Board board = new Board(0,
            request.getParameter("title"),
            request.getParameter("content"),
            new java.sql.Date(new java.util.Date().getTime()),
            new java.sql.Date(new java.util.Date().getTime()),
            0,
            userDao.emailForindex((String) session.getAttribute("id")));
    boardDAO.insertBoard(board);
%>
<script type="text/javascript">
    location.href="/board/board.jsp";
    alert("글쓰기 완료!");
</script>