<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	Cookie checkcookie;
	
		String email = request.getParameter("email");
		String target = request.getParameter("target");
		
		String pw = request.getParameter("pw");
		if(!(null != target && "" != target)) // target null check
			target = "../index.jsp";
			// 타겟이 null이 아니라면 target에 main홈페이지로 연결한다.
		Connection conn = null; // null로 초기화 한다.
		PreparedStatement pstmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

			String url = "jdbc:mysql://localhost:3306/jspTest"; // 사용하려는 데이터베이스명을 포함한 URL 기술

			String dbid = "root"; // 사용자 계정

			String dbpw = "1234"; // 사용자 계정의 패스워드

			conn = DriverManager.getConnection(url, dbid, dbpw); // DriverManager 객체로부터 Connection 객체를 얻어온다.
			//out.println("connction complecate");
			//out.println("제대로 연결되었습니다."); // 커넥션이 제대로 연결되면 수행된다.
			//email = "kwakj112@naver.com";
			String sql = "SELECT pw,name FROM user where email = ?";

			pstmt = conn.prepareStatement(sql);
			//out.println("pstmt compale");
			pstmt.setString(1, email);
			//out.println("setString");
			ResultSet rs = pstmt.executeQuery();
			//out.println("Query 실행");
			rs.next();
			//out.println("rs.next"); 
			String resultpw = rs.getString(1);
			String name = rs.getString(2);
			//out.println("rs.getString");

			//pw = "1234";

			if (resultpw.equals(pw)) {
				//out.println("접속!");
				session.setAttribute("id", email);
				//ßSystem.out.println(request.getParameter("remember"));
				if(null != request.getParameter("remember")){ //Cookie 값이 있을때,
					checkcookie = new Cookie("email",request.getParameter("email"));
					checkcookie.setPath("/");
					response.addCookie(checkcookie);
				}else{ //Cookie 값이 없을때, 
					checkcookie = new Cookie("email","");
					//System.out.println(checkcookie.getValue());
					checkcookie.setPath("/");
					checkcookie.setMaxAge(0);
					response.addCookie(checkcookie);
				}
	%>
				<script type="text/javascript">
					location.href="<%=target%>";
					alert("<%=name%>님 환영합니다!");
				</script>
	<%
			} else{
				%>
				<script type="text/javascript">
				history.back();
				alert("비밀번호가 다릅니다.");
				</script>
			<%
			}
			

		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			
			e.printStackTrace();
		%><script type="text/javascript">
				history.back();
				alert("존재하지 않는 아이디 입니다.");
			</script><% 

		}
	%>

</body>
</html>