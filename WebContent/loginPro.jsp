<%@page import="member.MemberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mbean  = mdao.loginInfo(id,pw);

	int sessionMnum = mbean.getMnum();
	String sessionId = mbean.getId();
	String sessionPw = mbean.getPw();
	
	String msg="",url="";
	
	if(sessionId!=null || sessionPw!=null){
		msg = "반갑습니다.";
		url = request.getContextPath()+"/boardContent.jsp";
	}else{
		msg = "없는 회원입니다.";
		url = "login.jsp";
	}
	session.setAttribute("memid",sessionId);
	session.setAttribute("memmnum",sessionMnum);

%>

<script type="text/javascript">
	alert("<%=msg%>")
    location.href = "<%=url%>"+"?bnum="+<%=bnum%>;
</script>

