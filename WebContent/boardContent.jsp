<%@page import="member.MemberDao"%>
<%@page import="member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentBean"%>
<%@page import="comment.CommentDao"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("UTF-8");

	/* 게시글 */
	int bnum = Integer.parseInt(request.getParameter("bnum"));

	BoardDao dao = BoardDao.getInstance();
	BoardBean article = dao.getArticle(bnum);

	String writer = article.getWriter();
	String subject = article.getSubject();
	String content = article.getContent();
	int readcount = article.getReadcount();
%>

<%
	/* 댓글 */
	CommentDao cdao = CommentDao.getInstance();
	ArrayList<CommentBean> comment = cdao.getComments(bnum);
%>



<!-- 게시글 -->
<div style="background-color:black; height: 50%; overflow: scroll;">
	<a href="./main.jsp" style="color: white; text-decoration: none; font-weight: bolder;"> &nbsp;< </a>
	<table style="height:100%; width:100%;">
		<tr>
			<td><p style="color: white; text-align: center; font-size: large;"><%=subject%></p></td>
		</tr>
		<tr>
			<td><p style="color: white; text-align:right; font-size: small;"><%=writer%>님의 글&nbsp;</p></td>
		</tr>
		<tr>
			<td><p style="color: white; font-size: medium; padding-left: 10%; padding-right: 10%;"><%=content%></p></td>
		</tr>
	</table>
</div>


<!-- 댓글 -->
<div style="background-color: #fcf1e2; height: 30%; overflow: scroll;">
	<table>
		<tr>
			<td>댓글<hr><td>
		</tr>
		<tr>
			<td>
			<%
 			for (int i=0; i<comment.size(); i++) {
 			%> 
 				<!-- 아이디 -->
 				<span style="font-size: small; font-weight: bolder;"><%=comment.get(i).getId()%></span>&nbsp
 				
 				<!-- 좋아요 -->
 				<a href="good.jsp?cnum=<%=comment.get(i).getCnum()%>&bnum=<%=bnum%>">
 					<img src="./image/good.png" style="width: 1.5%"/>
 				</a>
 				<span style="font-size: x-small;" ><%=comment.get(i).getGood() %></span>&nbsp
 				
 				<!-- 싫어요 -->
 				<a href="bad.jsp?cnum=<%=comment.get(i).getCnum()%>&bnum=<%=bnum%>">
 					<img src="./image/bad.png" style="width: 1.5%"/>
 				</a>
 				<span style="font-size: x-small;" ><%=comment.get(i).getBad() %></span><br>
 				
 				<%="-" %>
 				<span><%=comment.get(i).getCcomment()%></span><br>
 				
 				<!-- 삭제/수정 -->
 				<% 
 				String thisid = comment.get(i).getId();
 				int cnum = comment.get(i).getCnum();
 				if(session.getAttribute("memid")==null){
 					%>
 					<hr>
 					<%
 					continue;
 				}else if(session.getAttribute("memid").equals(thisid)){
 				%>
					<input type="button" value="삭제" onclick="location.href='deleteComment.jsp?cnum=<%=cnum%>&bnum=<%=bnum%>'"/>
					<input type="button" value="수정" onclick="location.href='updateCommentForm.jsp?cnum=<%=cnum%>&bnum=<%=bnum%>'"/>
 					<hr>
 				<%
 				}else{
 					%>
 					<hr>
 					<%
 					continue;
 				}
 				%>
		        
 			<%
 			}//for
 			%>
			</td>
		</tr>
	</table>

</div>

<!-- 댓글 입력 -->
<div style="background-color: #fcf1e2; height: 20%;">
	<p style="font-size: medium; font-weight: bolder;">나도 한마디!</h3></p>
	<%
		if (session.getAttribute("memid") == null) {
	%>
		<form action="snsLogin.jsp">
			<input type="hidden" name="bnum" value="<%=bnum%>">
			<input type="text" placeholder="댓글을 입력하세요" name="comment" /> 
			<input type="submit" value="입력">
		</form>
	<%
		} else {
	%>
		<form action="writeComment.jsp">
			<input type="hidden" name="bnum" value="<%=bnum%>"/>
			<%-- <%
			if(){
				
			}
			%>  --%>
			<input type="text" placeholder="댓글을 입력하세요" name="comment" style="width: 70%;"/> 
			<input type="submit" value="댓글 입력" style="width: 20%;"/>
		</form>
	<%
		}
	%>
</div>





