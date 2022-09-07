package product.proc;

import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ExampleSakje {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("삭제할 상품 코드: "); 
		String productCode_ = sc.nextLine();
		
		int productCode = Integer.parseInt(productCode_);
		
		ProductDTO productDto = new ProductDTO();
		productDto.setProductCode(productCode);
		
		ProductDAO productDao = new ProductDAO();
		int result = productDao.setDelete(productDto);
		
		if(result > 0) {
			System.out.println("-- success delete");
		} else {
			System.out.println("-- fail delete");
		}

	}

}
