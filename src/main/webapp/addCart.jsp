<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	product product = dao.getProductById(id);
	if(product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<product> goodsList = dao.getAllProducts();
	product goods = new product();
	for(int i = 0; i<goodsList.size(); i++) {
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)) {
			break;
		}
	}
	
	List<product> list = (List<product>) session.getAttribute("cartlist");
		if(list == null) {
			list = new ArrayList<product>();
			session.setAttribute("cartlist", list);
		}
		
		int cnt= 0;
		product goodsQnt = new product();
		
		for(int i = 0; i< list.size(); i++) {
			goodsQnt = list.get(i);
			if(goodsQnt.getProductId().equals(id)) {
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
		}
		}
		if(cnt == 0) {
			goods.setQuantity(1);
			list.add(goods);
		}
	
	response.sendRedirect("product.jsp?id=" + id);
%>