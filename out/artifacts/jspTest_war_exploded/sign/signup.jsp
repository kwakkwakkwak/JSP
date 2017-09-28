<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String repw = request.getParameter("repw");
		String name = request.getParameter("name");


		if (!pw.equals(repw)) {
	%>
	<script>
		alert("비밀번호가 다릅니다.");
		history.go(-1);
	</script>
	<%
		}

		Connection conn = null; // null로 초기화 한다.
		PreparedStatement pstmt = null;

		try {

			String url = "jdbc:mysql://localhost:3306/jspTest?useUnicode=true&characterEncoding=utf8"; // 사용하려는 데이터베이스명을 포함한 URL 기술

			String dbid = "root"; // 사용자 계정

			String dbpw = "1234"; // 사용자 계정의 패스워드
            //out.println("  class");
			Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

			conn = DriverManager.getConnection(url, dbid, dbpw); // DriverManager 객체로부터 Connection 객체를 얻어온다.

			String sql = "SELECT COUNT(*) FROM user where email = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				%><script type="text/javascript">
					history.back();
					alert("존재하는 아이디 입니다.");
				</script>
				<%
				} else {
				pstmt.close();
				sql = "INSERT INTO user(email , pw , name , in_date , up_date ) VALUES( ? , ? , ? , ? , ? )";
				//out.println(email);
				pstmt = conn.prepareStatement(sql);

				//out.println("sql  컴파일 ");
				pstmt.setString(1, email);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setDate(4, new java.sql.Date(new java.util.Date().getTime()));
				pstmt.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
				//out.println("aa");
				pstmt.executeUpdate();
				//out.println("Query 실행");
				
				RequestDispatcher rd = request.getRequestDispatcher("./signin.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.

			e.printStackTrace();

		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				} // PreparedStatement 객체 해제
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}
		}
	%>


</body>
</html>