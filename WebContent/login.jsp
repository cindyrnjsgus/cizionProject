<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
table{
	border-collapse: collapse; 
	align-content: center; 
	top:50%; 
	left:50%; 
	position: absolute; 
	transform:translate(-50%,-50%); 
	text-align: center;
	width: 30%;
	height: 30%;
}
#tdd{
	text-align: center;
}
#tddd{
	text-align: right;
}
input[type='submit']{
	align-content:center;
	background-color: 	#FFF5EE;
	width: 50%;	
	margin-bottom: 5%;
	font-weight: bolder;
	color: #8B4513;
}
input[type='text']{
	width: 90%;

}
</style>    
<%
int bnum = Integer.parseInt(request.getParameter("bnum"));
%>
<div style="background-color: #fcf1e2; width:100%; height: 100%;">

<form action="loginPro.jsp">
<input type="hidden" name="bnum" value="<%=bnum %>">
<table>
	<tr>
		<td id="tdd">id</td>
		<td id="tddd"><input type="text" name="id" placeholder="아이디를 입력하세요."/></td>
	</tr>
	<tr>
		<td id="tdd">pw</td>
		<td id="tddd"><input type="text" name="pw" placeholder="패스워드를 입력하세요."/></td>
	</tr>
	<tr>
		<td id="tdd" colspan="2"><input type="submit" value="로그인"/></td>
	</tr>
</table>
</form>

</div>