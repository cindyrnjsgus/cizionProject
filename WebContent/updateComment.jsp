<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int cnum = Integer.parseInt(request.getParameter("cnum"));
int bnum = Integer.parseInt(request.getParameter("bnum"));
String comment = request.getParameter("comment");

/* 댓글수정 */
CommentDao cdao = CommentDao.getInstance();
cdao.updateThisComment(cnum,comment);

%>

<script type="text/javascript">
	location.href="boardContent.jsp?bnum=<%=bnum%>";
</script>
