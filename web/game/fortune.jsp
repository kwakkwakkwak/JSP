<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	background-color: black;
	color: white;
	font-family: Arial;
}

body {
	margin: 0;
}

p {
	font-size: 14px;
	padding-left: 20px;
}

.inputdiv {
	display: flex;
	flex-dirction: row;
	justify-content: center;
}
h1{
text-align : center;
}
</style>
<title>Dailly Foutune</title>
</head>
<body bgcolor="black">
	<%@ include file="../header.jsp"%>
	<%
		int result;
		Date date = new Date();
		//System.out.println(date.getYear());
	%>
	<div class="inputdiv">
		<p>생년월일 이름을 입력하세요.</p>


	</div>
	<div class="inputdiv">
		<form action="./fortune.jsp" method="post">
			<select name="year">
				<%
					for (int i = 1950; i < 1900 + date.getYear()+1; i++) {
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
					}
				%>
			</select> <select name="mouth">
				<%
					for (int i = 1; i < 13; i++) {
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
					}
				%>
			</select> <select name="day">
				<%
					for (int i = 1; i < 32; i++) {
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
					}
				%>
			</select> 이름 : <input type="text" name="name">
			<button type="submit" class="result_btn">결과보기</button>
		</form>
	</div>
	<%
	request.setCharacterEncoding("utf-8");
		if (!(request.getParameter("year") == null) && !(request.getParameter("year") == null)
				&& !(request.getParameter("year") == null) && !(request.getParameter("year") == null)) {
			int hash = request.getParameter("year").hashCode() + request.getParameter("mouth").hashCode()
					+ request.getParameter("day").hashCode() + request.getParameter("name").hashCode();
			String name = request.getParameter("name") ;

			switch (Math.abs(hash+date.getDay()) % 7) {
			case 0:
	%>
	<h1><%=name  %> 님의 오늘은 완전 최악이에요 오늘 하루는 집에 계신걸 추천합니다</h1>
	<%
		break;
			case 1:
	%>
	<h1><%=name %> 님의 오늘은 최악이에요 오늘 하루 조심하셔야 해요</h1>
	<%
		break;
			case 2:
	%>
	<h1><%=name  %> 님의 오늘은 별로에요. 조심해서 나쁠건 없어요 </h1>
	<%
		break;
		case 3:
	%>
	<h1><%=name %> 님의 오늘은 SoSo... 그저 그래요</h1>
	<%
			break;
		case 4:
	%>
	<h1><%=name  %> 님의 오늘은 보통이에요 </h1>
	<%
			break;

		case 5:
	%>
	<h1><%=name %> 님의 오늘은 완전 좋아요 오늘하루는 행복하실 거에요!!</h1>
	<%
					break;
		case 6:
	%>
	<h1><%=name %> 님의 오늘은 완전 완전 좋아요 복권함번 사보시는건 어떨까요??</h1>
	<%
					break;

			}
		}
	%>

</body>
</html>