<%@page import="java.sql.*"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.product"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<%@ include file="/layout/menu.jspf" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product where p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("id"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
		%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="${pageContext.request.contextPath}/upload/<%=rs.getString("p_fileName")%>" style="width:100%">
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %>
				<p> <b>상품 코드 : </b><span class="badge badge-danger">
				<%=rs.getString("p_id") %></span>
				<p> <b>제조사</b> : <%=rs.getString("p_manufacture") %></p>
				<p> <b>분류</b> : <%=rs.getString("p_category") %></p>
				<p> <b>재고 수</b> : <%= rs.getString("p_unitsInStock")%></p>
				<h4><%=rs.getString("p_unitPrice") %>원</h4>
				<p> <form name="addForm" action="./addCart.jsp?id=<%= rs.getString("p_id")%>" method="post"> 
				<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
				<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
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