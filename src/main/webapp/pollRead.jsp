<%@page import="kr.tjoeun.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 투표</title>
<link rel="icon" href="./logo.png">
<style type="text/css">
	table {
		background: ivory;
		border-radius: 10px;
	}
	* {
		border-radius: 10px;
	}
	.btn {
		background: ivory;
		border: solid 2px #000080;
	}
	.edge{
		background:  #F0F8FF;
	}
</style>
</head>
<body>
<%
	String filepath = application.getRealPath("/") + "poll.txt";

	ArrayList<String> poll = PollRead.pollRead(filepath);
	int itemCount = (poll.size()-1) / 2;
%>

<form action="pollWrite.jsp" method="post">
	<table width="500" border="1"  align="center" cellpadding="5" cellspacing="0">
		<tr>
			<th class="edge">
				<%=poll.get(0)%>
			</th>
		</tr>
	<%
		pageContext.setAttribute("poll", poll);
	%>
		<c:forEach var="i" begin="1" end="12" step="1">
		<tr>
			<td>
				<%-- <input type="radio" name="poll" value="<%=i%>"><%=poll.get(i)%> --%>
				<input type="radio" name="poll" value="${i}">${poll.get(i)}
			</td>
		</tr>
		</c:forEach>

		<tr>
			<td align="center" class="edge">
				<input class="btn" type="submit" value="투표하기"/>
				<input class="btn" type="button" value="결과보기"  onclick="location.href='pollResult.jsp'"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>