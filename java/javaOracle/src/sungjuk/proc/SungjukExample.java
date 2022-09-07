package sungjuk.proc;

import java.util.ArrayList;
import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class SungjukExample {

	public void sungjukExec() {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("성적관리메뉴선택(1:목록, 2:상세, 3:추가, 4:수정, 5:삭제, 기타:종료) : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {//1:목록
				SungjukDAO dao = new SungjukDAO();
				ArrayList<SungjukDTO> list = dao.getSelectAll();//[dto, dto,...]
				
				for(int i=0; i<list.size(); i++) {
					SungjukDTO dto = list.get(i); 
					dto.display();
				}
				
			} else if(menu.equals("2")) {//2:상세
				SungjukDTO dto = new SungjukDTO();
				dto.input("view");
				
				SungjukDAO dao = new SungjukDAO();
				SungjukDTO dto2 = dao.getSelectOne(dto);
				dto2.display();
				
			} else if(menu.equals("3")) {//3:추가
				//입력
				SungjukDTO dto = new SungjukDTO();
				dto.input("chuga");
				dto.tot();
				dto.avg();
				dto.grade();
				//저장
				SungjukDAO dao = new SungjukDAO();
				int result = dao.setInsert04(dto);
				
			} else if(menu.equals("4")) {//4:수정
				SungjukDTO dto = new SungjukDTO();
				dto.input("sujung");
				dto.tot();
				dto.avg();
				dto.grade();
			
				SungjukDAO dao = new SungjukDAO();
				int result = dao.setUpdate(dto);
				
			} else if(menu.equals("5")) {//5:삭제
				SungjukDTO dto = new SungjukDTO();
				dto.input("sakje");
				
				SungjukDAO dao = new SungjukDAO();
				int result = dao.setDelete(dto);
			} else {
				break;
			}
		}
		System.out.println("-- 프로그램 종료 --");

	}

}
