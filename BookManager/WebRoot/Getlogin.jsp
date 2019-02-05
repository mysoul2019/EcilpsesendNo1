<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");//中文处理，登录用户名为中文时，需要添加该代码
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	//加载驱动
	Class.forName("com.mysql.jdbc.Driver");
	//连接数据库
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "12345678");
	String sql = " select * from users where username = ? and password = ?";
	//使用预编译处理，防止sql注入
	PreparedStatement pst =conn.prepareStatement(sql);
	pst.setString(1,username);
	pst.setString(2,password);
	ResultSet rs =pst.executeQuery();
	/*Statement st = conn.createStatement();	
	//查询你所要登录得用户名密码
	String sql = " select * from users where username='" + username + "' and password='" + password + "' ";//查询语句
	//out.println(sql);
	ResultSet rs = st.executeQuery(sql);*/
	
	//判断是否登录成功
	if (rs.next()) {
		response.sendRedirect("booklist.jsp");//登录成功，重定向返回主菜单
	} else {
		response.sendRedirect("Login.jsp");//登录失败，重定向返回登录界面
	}
%>
