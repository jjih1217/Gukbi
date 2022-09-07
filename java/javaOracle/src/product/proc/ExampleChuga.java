package product.proc;

import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ExampleChuga {

	public static void main(String[] args) {		
		Scanner sc = new Scanner(System.in);
		System.out.print("상품이름 : ");
		String productName = sc.nextLine();
		System.out.print("상품가격 : ");
		String productPrice_ = sc.nextLine();
		System.out.print("상품설명 : ");
		String productContent = sc.nextLine();
		System.out.print("제조사 : ");
		String vendor = sc.nextLine();
		
		int productPrice = Integer.parseInt(productPrice_);
		
		ProductDTO productDto = new ProductDTO();
		productDto.setProductName(productName);
		productDto.setProductPrice(productPrice);
		productDto.setProductContent(productContent);
		productDto.setVendor(vendor);
		
		ProductDAO dao = new ProductDAO();
		int result = dao.setInsert(productDto);
		//메소드의 반환형return 이 있으므로 변수에 저장해야함
		
		if(result > 0) {
			System.out.println("-- success insert");
		} else {
			System.out.println("-- fail insert");
		}
		
	}

}
