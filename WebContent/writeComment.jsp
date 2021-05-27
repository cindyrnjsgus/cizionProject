<%@page import="member.MemberBean"%>
<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int bnum = Integer.parseInt(request.getParameter("bnum"));
int mnum = (int)session.getAttribute("memmnum");
String comment = request.getParameter("comment");
String coMemid = (String)session.getAttribute("memid");

/* 금지어 */
if(comment.contains("바보")||
		comment.contains("멍청이")||
		comment.contains("극혐")){
%>
<script type="text/javascript">
	alert("등록할 수 없는 내용입니다.");
	location.href = "boardContent.jsp?bnum=<%=bnum%>";
</script>
<%	
	
}
else{
	CommentDao dao = CommentDao.getInstance();
	
	/* 회원이 해당 게시물에 쓴 댓글 수 */
	int cnt = dao.getCommentWriter(bnum,mnum);
	
	/* 도배방지 */
	if(cnt>9){
	%>
		<script type="text/javascript">
			alert("작성하신 댓글 10개 초과로 작성하실수 없습니다.");
			location.href = "boardContent.jsp?bnum=<%=bnum%>";
		</script>
	<%
	}else{
		
		/* 댓글 작성 */
		dao.writeComment(bnum,mnum,comment);
	%>
		<script type="text/javascript">
			location.href = "boardContent.jsp?bnum=<%=bnum%>";
		</script>
	<%
	}

}
%>
