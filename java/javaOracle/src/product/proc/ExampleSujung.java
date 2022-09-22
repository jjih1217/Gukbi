package product.proc;

import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ExampleSujung {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("수정할 상품 코드: "); 
		String productCode_ = sc.nextLine();
		
		System.out.print("수정할 상품이름 : "); 
		String productName = sc.nextLine();
		System.out.print("수정할 상품가격 : "); 
		String productPrice_ = sc.nextLine();
		System.out.print("수정할 상품설명 : "); 
		String productContent = sc.nextLine();
		System.out.print("수정할 제조사 : "); 
		String vendor = sc.nextLine();
		
		int productCode = Integer.parseInt(productCode_);
		int productPrice = Integer.parseInt(productPrice_);
		
		ProductDTO productDto = new ProductDTO();
		productDto.setProductCode(productCode);
		productDto.setProductName(productName);
		productDto.setProductPrice(productPrice);
		productDto.setProductContent(productContent);
		productDto.setVendor(vendor);
		
		ProductDAO productDao = new ProductDAO();
		int result = productDao.setUpdate(productDto);
		
		if(result > 0) {
			System.out.println("-- success update");
		} else {
			System.out.println("-- fail update");
		}
		
	}

}
