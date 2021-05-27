<%@page import="comment.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int cnum = Integer.parseInt(request.getParameter("cnum"));
int bnum = Integer.parseInt(request.getParameter("bnum"));


CommentDao cdao = CommentDao.getInstance();

ArrayList<CommentBean> colist = cdao.getThisComment(cnum);
for(int i=0;i<colist.size();i++){
	if(session.getAttribute("memid")==null){
		%>
		<script type="text/javascript">
			alert("로그인 후 체크해주세요.");
			location.href="snsLogin.jsp?bnum=<%=bnum%>";
		</script>
		<%
	}
	else if(colist.get(i).getMnum()==(int)session.getAttribute("memmnum")){
		%>
		<script type="text/javascript">
			alert("본인 댓글에는 '싫어요'를 체크하실 수 없습니다.");
			location.href="boardContent.jsp?bnum=<%=bnum%>";
		</script>
		<%
	}
	else{
		/* 싫어요 */
		cdao.updateBad(cnum);
		%>

		<script type="text/javascript">
			location.href="boardContent.jsp?bnum=<%=bnum%>";
		</script>
		<%
	}
}
%>

    