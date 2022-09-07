package product.proc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ProductExample {

	public void productExec() {
		// 메뉴를 선택하세요(0:종료, 1:목록, 2:상세보기, 3:추가, 4:수정, 5:삭제)
	
		Scanner sc = new Scanner(System.in);

		while(true) {
			System.out.print("상품관리메뉴선택(1:목록, 2:상세보기, 3:추가, 4:수정, 5:삭제, 기타:종료) : ");
			String choice = sc.nextLine();
			
			if(choice.equals("1")) {// 1:목록
				
				ProductDAO productDao = new ProductDAO();
				ArrayList<ProductDTO> list = productDao.getSelectAll();
				
				for(int i=0; i<list.size(); i++) {
					ProductDTO productDto = list.get(i);
					productDto.display("list");
				}
				
			} else if(choice.equals("2")) { //2:상세보기
				ProductDTO productDto = new ProductDTO();
				productDto.dataInput("view");
				
				ProductDAO productDao = new ProductDAO();
				ProductDTO dto = productDao.getSelectOne(productDto);
			
				dto.display("view");
				
			} else if(choice.equals("3")) { //3:추가
				
				ProductDTO productDto = new ProductDTO();
				productDto.dataInput("chuga");
				
				ProductDAO dao = new ProductDAO();
				int result = dao.setInsert(productDto);
				
			} else if(choice.equals("4")) { //4: 수정
				
				ProductDTO productDto = new ProductDTO();
				productDto.dataInput("sujung");
				
				ProductDAO productDao = new ProductDAO();
				int result = productDao.setUpdate(productDto);
				
			} else if(choice.equals("5")) { //5:삭제
				
				ProductDTO productDto = new ProductDTO();
				productDto.dataInput("sakje");
				
				ProductDAO productDao = new ProductDAO();
				int result = productDao.setDelete(productDto);
				
			} else {
				break;
			}
		}
		System.out.print("-- 종료 --");
	}
}
