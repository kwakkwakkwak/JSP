
<%@ page import="DAO.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%

    BoardDAO boardDAO = BoardDAO.getInstence();

    boardDAO.deleteBoard(Integer.parseInt(request.getParameter("boardid")));


%>
<script type="text/javascript">
    location.href="/board/board.jsp";
    alert("글삭제 완료!");
</script>