<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")) {
		response.sendRedirect("product.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	product product = dao.getProductById(id);
	if(product==null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<product> carList = (List<product>) session.getValue("cartlist");
	product goodsQnt = new product();
	for(int i=0; i<carList.size();i++) {
		goodsQnt = carList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			carList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>