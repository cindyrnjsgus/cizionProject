<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int bnum = Integer.parseInt(request.getParameter("bnum"));
%>

<style type="text/css">
#tdd{
	text-align: center;
	
}
input[type='button']{
	background-color: 	#FFF5EE;
	width: 80%;	
	margin-bottom: 5%;
	font-weight: bolder;
	color: #8B4513;
}

#tddd{
	text-align: center;
	padding-bottom: 10%;
	font-weight: bolder;
}

table{
	border-collapse: collapse; 
	align-content: center; 
	top:50%; 
	left:50%; 
	position: absolute; 
	transform:translate(-50%,-50%); 
	text-align: center;
	width: 30%;
	height: 40%;
}

</style>


<div style="background-color: #fcf1e2; width:100%; height: 100%;">
<table>
	<tr>
		<td id="tddd">SNS로그인해서 댓글 쓰기</td>
	</tr>
	<tr>
		<td id="tdd"><input type="button" name="naver" onclick="location.href='login.jsp?bnum=<%=bnum %>'" value="네이버로 로그인"/></td>
	</tr>
	<tr>
		<td id="tdd"><input type="button" name="kakaotalk" onclick="location.href='login.jsp?bnum=<%=bnum %>'" value="카카오톡으로 로그인"/></td>
	</tr>
	<tr>
		<td id="tdd"><input type="button" name="facebook" onclick="location.href='login.jsp?bnum=<%=bnum %>'" value="페이스북으로 로그인"/></td>
	</tr>
	<tr>
		<td id="tdd"><input type="button" name="google" onclick="location.href='login.jsp?bnum=<%=bnum %>'" value="구글로 로그인"/></td>
	</tr>
	<tr>
		<td id="tdd"><input type="button" name="twitter" onclick="location.href='login.jsp?bnum=<%=bnum %>'" value="트위터로 로그인"/></td>
	</tr>
</table>
</div>