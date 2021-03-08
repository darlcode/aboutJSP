<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%
	String id = request.getParameter("id");
	String pass=request.getParameter("pass");
	
	Connection conn = null;
	PreparedStatement pstmt=null;
	// ResultSet : Statement 혹은 PreparedStatement 객체로
	//					  SELECT문을 사용하여 얻어온 레코드 값들을
	//					  테이블의 형태로 갖게 되는 객체
	ResultSet rs = null;
	
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn=ds.getConnection();
		
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			if(pass.equals(rs.getString("password"))) {
				session.setAttribute("id", id);
				out.println("<script>");
				out.println("locaiton.href='main.jsp'");
				out.println("</script>");
			}
		}
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
