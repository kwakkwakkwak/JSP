<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8"); // request endcoding uft-8

    String email = request.getParameter("email");
    //out.println(email);
    String oldpw = request.getParameter("oldpw");
    String newpw = request.getParameter("newpw");
    String repw = request.getParameter("repw");


    Connection conn = null; // null로 초기화 한다.
    PreparedStatement pstmt = null;
    if (!newpw.equals(repw)) {
        %>
        <script>
            alert("새로운 비밀번호가 일치하지 않습니다.");
            history.go(-1);
        </script>
        <%
    }else {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

            String url = "jdbc:mysql://localhost:3306/jspTest"; // 사용하려는 데이터베이스명을 포함한 URL 기술

            String dbid = "root"; // 사용자 계정

            String dbpw = "1234"; // 사용자 계정의 패스워드

            conn = DriverManager.getConnection(url, dbid, dbpw); // DriverManager 객체로부터 Connection 객체를 얻어온다.
            //out.println("connction complecate");
            out.println("제대로 연결되었습니다."); // 커넥션이 제대로 연결되면 수행된다.
            //email = "kwakj112@naver.com";
            String sql = "SELECT pw FROM user where email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,email);

            ResultSet rs = pstmt.executeQuery();
            rs.next();
            String timestamp = new Timestamp(System.currentTimeMillis()).toString();

            System.out.println(timestamp);
            String db_oldpw = rs.getString("pw");
            //out.println("select end : " + db_oldpw);
            if(db_oldpw.equals(oldpw)){
                pstmt.close();
                sql = "UPDATE USER SET pw = ? , up_date = ? WHERE email = ? ";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1,newpw);
                pstmt.setDate(2,new java.sql.Date(new java.util.Date().getTime()));
                pstmt.setString(3,email);

                pstmt.executeUpdate();
                %>
                <script type="text/javascript">
                    location.href="../index.jsp";
                    alert("비밀번호가 변경되었습니다.");
                </script>
                <%
            }
            else
            {
            %>
            <script>
                alert("예전 비밀번호가 일치하지 않습니다.");
                history.go(-1);
            </script>
            <%
            }

        } catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.

            e.printStackTrace();

        }
    }
%>

</body>
</html>