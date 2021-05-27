<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int cnum = Integer.parseInt(request.getParameter("cnum"));
int bnum = Integer.parseInt(request.getParameter("bnum"));

/* 댓글삭제 */
CommentDao cdao = CommentDao.getInstance();
cdao.deleteComment(cnum);
%>

<script type="text/javascript">
	location.href="boardContent.jsp?bnum=<%=bnum%>";
</script>


