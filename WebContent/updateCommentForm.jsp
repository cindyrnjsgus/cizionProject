<%@page import="comment.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int cnum = Integer.parseInt(request.getParameter("cnum"));
int bnum = Integer.parseInt(request.getParameter("bnum"));

/* 수정할 댓글 가져오기 */
CommentDao cdao = CommentDao.getInstance();
ArrayList<CommentBean> clist = cdao.getThisComment(cnum);
%>

<!-- 게시글 -->
<div style="background-color:black; height: 50%; overflow: scroll;">
</div>

<!-- 댓글 -->
<div style="background-color: #fcf1e2; height: 20%; overflow: scroll;">
</div>

<!-- 기존 댓글 -->
<div style="background-color: #fcf1e2; height: 30%;">
	<p style="font-size: medium; font-weight: bolder;">댓글 수정하기</h3></p>
	<%
	for(int i=0;i<clist.size();i++){
		%>
		
		<form action="updateComment.jsp">
			<input type="hidden" name="cnum" value="<%=cnum%>"/>
			<input type="hidden" name="bnum" value="<%=bnum%>"/>
			<input type="text" name="comment" value="<%=clist.get(i).getCcomment()%>" style="width: 70%;"/> 
			<input type="submit" value="댓글 수정" style="width: 20%;"/>
		</form>
		<%
	}
	%>
	
</div>


