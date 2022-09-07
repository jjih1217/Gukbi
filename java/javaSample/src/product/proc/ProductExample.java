package product.proc;

import java.util.Scanner;

public class ProductExample {

	public void productExec() {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("상품관리메뉴선택(1:목록, 2:상세보기, 3:추가, 4:수정, 5:삭제, 기타: 종료) : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				System.out.println("-- getSelectAll --");
				
			} else if(menu.equals("2")) {
				System.out.println("-- getSelectOne --");
				
			} else if(menu.equals("3")) {
				System.out.println("-- setInsert --");
				
			} else if(menu.equals("4")) {
				System.out.println("-- setUpdate --");
				
			} else if(menu.equals("5")) {
				System.out.println("-- setDelete --");
				
			} else {
				break;
			}
		}
		System.out.println("-- 상품관리 종료 --");

	}

}
