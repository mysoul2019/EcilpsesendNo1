<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//防止中文乱码
	request.setCharacterEncoding("utf-8");
	//连接驱动
	Class.forName("com.mysql.jdbc.Driver");
	//连接数据库
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db", "root", "12345678");
	
	Statement st = conn.createStatement();
	//查询语句
	ResultSet rs = st.executeQuery("select * from booklist");

	String action = request.getParameter("action");
	//添加功能
	if ("add".equals(action)) { 	
			//PrepareStatement
			//sql语句可以不完整拼写，在语句需要接收值得地方，用点位符(?)，替换语句
			//select * from users where uname = ? and passwrod = ?
			//sql = insert into book values(?,?,?,?);
			//1.先把含点位符的sql语句提交给数据库编译
			//2.再通过传参的方式，给每个占位符传值进去
			//3.调用数据库执行语句
			
			//预编译语句PrepareStatement ,
			// 当被执行多次时，只编译一次，执行速度比Statement快
			
			//解决sql防注入问题
			//PrepareStatement pst = conn.PrepareStatement(String sql);
			//pst.setxxx(int index , object value)
			//调用数据库执行 
			//int n=pst.executeUpdate();
		String bid = request.getParameter("bid");
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String publish = request.getParameter("publish");
		String price = request.getParameter("price");
		String sql = " insert into booklist values(?,?,?,?,?)";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1,bid);pst.setString(2,name);
		pst.setString(3,author);pst.setString(4,publish);
		pst.setFloat(5, Float.parseFloat(price));
		int n=pst.executeUpdate();
		
		/*String sql = "insert into booklist(name,author,publish,price) values('" + name + "','" + author + "','"
				+ publish + "','" + price + "')";
		//out.println(sql);
		int n = st.executeUpdate(sql);*/
		response.sendRedirect("booklist.jsp");
		//修改功能
	} else if ("edit".equals(action)) {  
		String bid = request.getParameter("bid");
		String bid2 = request.getParameter("bid2");
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String publish = request.getParameter("publish");
		String price = request.getParameter("price");
		
			String sql=" update booklist set name=?,author=?,publish=?,price=?,bid=? where bid=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1,name);
		pst.setString(2,author);
		pst.setString(3,publish);
	    pst.setFloat(4, Float.parseFloat(price));
	    pst.setString(5,bid);
	    pst.setString(6,bid2);
		int n = pst.executeUpdate();
	/**String sql = "update booklist set name='" + name + "',author='" + author + "',publish='" + publish
				+ "',price=" + price + " where bid='" + bid + "'";
		out.println(sql);
		int n = st.executeUpdate(sql);*/
		response.sendRedirect("booklist.jsp");
		 //删除功能
	}else if ("del".equals(action)) {
		String bid = request.getParameter("bid");
		String sql = " delete from booklist where bid='"+bid+"' ";
		out.println(sql);
		int n = st.executeUpdate(sql);
		response.sendRedirect("booklist.jsp");
		}
%>
