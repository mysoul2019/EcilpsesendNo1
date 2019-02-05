<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'booklist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<!--  <jsp:useBean id="deal" scope="page class="com.Model.Bookpagedeal"></jsp:useBean>
  <jsp:setProperty property="pagesize" name="deal" value="3"/>
  <jsp:setProperty property="currpage" name="deal" param="currPage"/>
 [' -->
  
<%
	//没有登入不让打开页面
	//还未写

	//连接驱动
    Class.forName("com.mysql.jdbc.Driver");
    //连接数据库
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db", "root", "12345678");
   //Statement 拼写完整的SQL提交给数据库执行
    Statement st = conn.createStatement();
    //查询语句
    ResultSet rs = st.executeQuery("select * from booklist");
%>

	<table width="700px" border="1" align="center"
		style="background-image:url(table.PNG)">
		<caption>图书信息列表</caption>
		<tr>
			<th>编号</th>
			<th>书名</th>
			<th>作者</th>
			<th>出版社</th>
			<th>价格</th>
			<th>操作</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<%--循环 --%>
		<tr>
			<td><%=rs.getString("bid")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("author")%></td>
			<td><%=rs.getString("publish")%></td>
			<td><%=rs.getString("price")%></td>
			<td><a href="bookedit.jsp?bid=<%=rs.getString("bid")%>">修改</a> <a
				href="bookdeal.jsp?action=del&bid=<%=rs.getString("bid")%>">删除</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<table align="center">
		<tr>
			<td><input type="submit" value="添加图书"
				onclick="window.location.href='bookadd.jsp'"></td>
		</tr>
	</table>
	<div align="center">
		<a href="booklist.jsp?currPage=1">首页</a>
		<%
		int currPage=deal.getCurrPage();
		if(currPage<=1){
		   out.println("<span>上一页<span/>");
		}else{
		   out.println("<a href="'booklist.jsp?currPage="+(currPage-1)+"'>上一页<a/>");
		}
		if(currPage>deal.getPageCount()){
		   out.println("<span>下一页<span/>");
		}else{
		   out.println("<a href="'booklist.jsp?currPage="+(currPage+1)+"'>下一页<a/>");
		}
		 %>
		 <a href="booklist.jsp?currPage=<%=deal.getPageCount() %>">尾页</a>
	</div>
  </body>
</html>
