<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn=null;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@DESKTOP-LQ77LA1:1521:XE";
	
	Boolean connect=false;
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, "c##java", "java");
		
		connect=true;
		
		conn.close();
	}catch(Exception e) {
		connect=false;
		e.printStackTrace();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연동 테스트 예제</title>
</head>
<body>
<h1>
<% if(connect==true) { %>
	연결되었습니다
<% }else { %>
	연결에 실패하였습니다
<% } %>
</h1>
</body>
</html>