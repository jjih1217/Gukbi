package test;

import java.util.Scanner;

public class Example {

	public static void main(String[] args) {
		// 메뉴를 선택하세요(1:목록, 2:상세보기, 3:추가, 4:수정, 5: 삭제 , 기타: 종료)
		//--목록
		
		Scanner sc = new Scanner(System.in);
		Sample sample = new Sample();
		
		while(true) {
			System.out.print("메뉴를 선택하세요(0:종료, 1:목록, 2:상세보기, 3:추가, 4:수정, 5:삭제)");
			String choice = sc.nextLine();
			
			if(choice.equals("1")) {
				sample.getSelectAll();
			} else if(choice.equals("2")) {
				sample.getSelectOne();
			} else if(choice.equals("3")) {
				sample.setInsert();
			} else if(choice.equals("4")) {
				sample.setUpdate();
			} else if(choice.equals("5")) {
				sample.setDelete();
			} else {
				break;
			}
		}
		System.out.print("-- 종료 --");
	}
}
