<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
	margin : 0;
}
*{
color : white;

}
#dice_btn {
	width : 30%;
	height : 40px;
	display : block;
	margin : auto;
	background-color : black;
}
#imgs{
	display : flex;
	flex-dirction : row;
	justify-content : center;
	
	margin : auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function changeimage() {
		var image1 = document.getElementById('img1');
		var image2 = document.getElementById('img2');
		var imgsrc1 = "./../img/dice" + (parseInt(Math.random() * 6) + 1) + ".png";
		var imgsrc2 = "./../img/dice" + (parseInt(Math.random() * 6) + 1) + ".png";
		image1.src = imgsrc1;
		image2.src = imgsrc2;
	}
	
	var timeset = setInterval(changeimage, 1);
	
	function dice() {
		var btn = document.getElementById("btn");
		if(timeset != null) { 
		clearInterval(timeset);
		timeset = null;
		dice_btn.innerHTML = "START";
		}else	{
			timeset = setInterval(changeimage, 1);
			dice_btn.innerHTML = "STOP";
		}
	}
	
	
</script>

<title>DICE</title>
</head>
<body bgcolor="black">
<%@ include file="./../header.jsp" %>

<br>
<br>
<br>
<br>
<div id = "imgs">
	<img id="img1">
	<img id="img2">
</div>
	<br>
	<hr>
	
	<button id = "dice_btn" onclick="dice()">STOP</button>
	
</body>
</html>