<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#cen{
	text-align: center;
}
</style>
<%
	BoardDao dao = BoardDao.getInstance();
	ArrayList<BoardBean> lists = dao.getArticles();
%>

<div style="background-color: #fcf1e2; overflow: scroll; height: 100%;">
	<div style="text-align: center; height: 10%;">
		<span style="font-weight: bolder;">게시글</span>
	</div>
	
	<table border="1" style=" width: 100%; border-collapse: collapse; border-color: #D2B48C; ">
		<tr style="text-align: center;">
			<td><span style="font-weight: bolder; color:#8B4513;">제목</span></td>
			<td width="20%"><span style="font-weight: bolder; color:#8B4513;">작성자</span></td>
			<td width="10%"><span style="font-weight: bolder; color:#8B4513;">조회수</span></td>
		</tr>
		<%
			for (BoardBean article : lists) {
		%>
		<tr style="height: 50px;">
			<td>&nbsp;&nbsp;<a href="boardContent.jsp?bnum=<%=article.getBnum()%>" style=" text-decoration: none; "><%=article.getSubject()%></a></td>
			<td id="cen"><%=article.getWriter()%></td>
			<td id="cen"><%=article.getReadcount()%></td>
		</tr>
		<%
			}
		%>

	</table>
</div>
