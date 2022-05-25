package dao;

import java.util.ArrayList;
import java.util.List;

import dto.product;


public class ProductRepository {
	
	private List<product> listOfProducts = new ArrayList<product>();
	private static ProductRepository instance =  new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		product phone = new product("P1234","iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 REnina HD display, 8-megapixel iSight Camera");
		phone.setCategory("smart Phone");
		phone.setManufacture("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("new");
		phone.setFilename("P1234.png");
		
		product notebook = new product("P1235","LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacture("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		
		product tablet = new product("P1236","Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacture("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	// 모든 상품 조회
	public List<product> getAllProducts() {
		return listOfProducts ;
	}
	
	// 상품 조회
	public product getProductById(String productId) {
		product productById = null;
		
		for(int i = 0; i< listOfProducts.size();i++) {
			product product = listOfProducts.get(i);
			if(product !=null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(product product) {
		listOfProducts.add(product);
	}
}
