package product.proc;

import java.sql.Date;
import java.util.ArrayList;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ExampleList {
	public static void main(String[] args) {	
		ProductDAO productDao = new ProductDAO();
		ArrayList<ProductDTO> list = productDao.getSelectAll();
		
		for(int i=0; i<list.size(); i++) {
			// System.out.println(i + "." + list.get(i));
			// 0.product.model.ProductDTO@f0c8a99
			// 1.product.model.ProductDTO@740cae06 => dto의 주소
			 ProductDTO productDto = list.get(i);
			 int productCode = productDto.getProductCode();
			 String productName = productDto.getProductName();
			 int productPrice = productDto.getProductPrice();
			 String vendor = productDto.getVendor();
			 Date regiDate = productDto.getRegiDate();
			 
			 System.out.println("productCode : " + productCode);
			 System.out.println("productName : " + productName);
			 System.out.println("productPrice : " + productPrice);
			 System.out.println("vendor : " + vendor);
			 System.out.println("regiDate : " + regiDate);
			 System.out.println("-------------------------------------");
		}
	}
	
}
