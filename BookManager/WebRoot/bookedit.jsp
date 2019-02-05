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
    
    <title>My JSP 'bookedit.jsp' starting page</title>
    
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
<%
	//获取id
	String bid = request.getParameter("bid");
	//查询语句
	String sql = "select*from booklist where bid='" + bid + "'";
	//连接驱动
	Class.forName("com.mysql.jdbc.Driver");
	//连接数据库 "jdbc:mysql://地址：端口号/数据库名称"，"数据库名"，"数据库密码"
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db", "root", "12345678");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	rs.next();
%>
	<form action="bookdeal.jsp?action=edit" method="post">
		<h2 align="center">图书信息修改</h2>
		<table align="center">
			<tr>
				<td>
				<input type="hidden" name="bid2" value="<%=rs.getString("bid")%>">
				编号:<input type="text" name="bid"
						value="<%=rs.getString("bid")%>"><br><br>
				 书名:<input type="text" name="name"
						value="<%=rs.getString("name")%>"><br><br>
				 作者:<input type="text" name="author"
						value="<%=rs.getString("author")%>"><br><br>
				出版社:<input type="text" name="publish"
						value="<%=rs.getString("publish")%>"><br><br>
				 价格:<input type="text" name="price"
						value="<%=rs.getString("price")%>"><br><br>
					 <input type="submit" value="保存修改">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
