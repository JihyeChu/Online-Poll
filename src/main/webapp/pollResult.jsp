<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.tjoeun.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="refresh" content="5; url='?'">

<title>투표 결과 보기</title>
<link rel="icon" href="logo.png">
<style type="text/css">
	hr {
		border: solid 2px skyblue;
	}
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
	int itemCount = (poll.size() - 1) / 2;

	int sum = 0;
	for (int i=itemCount + 1; i<poll.size(); i++) {
		sum += Integer.parseInt(poll.get(i));
	}

	DecimalFormat df1 = new DecimalFormat("#,##0표");
	DecimalFormat df2 = new DecimalFormat("0.00%"); 
%>

<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">
	<tr>
		<th colspan="2" class="edge">
			<%=poll.get(0)%>
		</th>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<%=df1.format(sum)%>
		</td>
	</tr>
<%
	for (int i=1; i<=itemCount; i++) {
		int pyo = Integer.parseInt(poll.get(i + itemCount)); 
		double per = (double) pyo / sum; 
%>
	<tr>
		<td width="250">
			<%=poll.get(i)%>(<%=df1.format(pyo)%>)
		</td>
		<td width="350">
			<hr color="aliceblue" size="10" width="<%=350 * per%>" align="left">
		</td>
	</tr>
<%
	}
%>		
	<tr>
		<td colspan="2" align="center" class="edge">
			<input class="btn" type="button" value="투표하러 가기" onclick="location.href='pollRead.jsp'">
		</td>
	</tr>
</table>

</body>
</html>
