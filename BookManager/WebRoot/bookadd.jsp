<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'books.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript">
 	function checkBook(){
 		if(document.f1.bid.value==""){
 		alert("编号不能为空");document.f1.bid.focus();return false;
 		}else if (document.f1.name.value==""){
 		alert("图书名称不能为空");document.f1.name.focus();return false;
 		}else if (document.f1.author.value==""){
 		alert("作者不能为空");document.f1.author.focus();return false;
 		}else if (document.f1.publish.value==""){
 		alert("出版社不能为空");document.f1.publish.focus();return false;
 		}else if (document.f1.price.value.search("^\\d+(\\.\\d+)*$")!=0){
 		alert("单价必须是合法的数值");document.f1.price.focus();return false;
 		}
 	}
  </script>
  
  <body>
 <form action="bookdeal.jsp?action=add" method="post" name="f1" onsubmit=" return checkBook()">
    <h2 align="center">添加图书信息</h2>
    <table align="center">
    	<tr>
    		<td>
   				 图书编号:<input type="text" name="bid"><br><br>
  		 		 图书名称:<input type="text" name="name"><br><br>
  		 		 作      者:<input type="text" name="author"><br><br>
   		 		 出 版 社:<input type="text" name="publish"><br><br>
   		 		 单     价: <input type="text" name="price"><br><br>
   				 <input type="submit" value="保存添加">
        	</td>
        </tr>
     </table>
 </form>
</body>
</html>
