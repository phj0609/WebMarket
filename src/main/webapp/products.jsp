<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:useBean id="productDAO" class="dao.ProductRepository" />

<%@ include file="/layout/menu.jspf" %>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 목록</h1>
	</div>
</div>
<div class="container">
	<div class="row" align="center">
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<div class="col-md-4">
			<img src="${pageContext.request.contextPath}/upload/<%=rs.getString("p_fileName")%>" style="width:100%">
				<h3><%= rs.getString("p_name") %></h3>
				<p><%= rs.getString("p_description") %></p>
				<p><%= rs.getString("p_unitPrice") %>원</p>
				<p> <a href="./product.jsp?id=<%=rs.getString("p_id")%>"
				class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
			</div>
			<% 
		  			}
			%>
			<%
		  	if(rs !=null)
		  		rs.close();
		  	if(pstmt !=null)
		  		pstmt.close();
		  	if(conn !=null)
		  		conn.close();
		  	%>
	</div>
	<hr>
</div>
<%@ include file="/layout/footer.jspf" %>
</body>
</html>