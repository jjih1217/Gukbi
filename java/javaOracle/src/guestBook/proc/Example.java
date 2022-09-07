package guestBook.proc;

import java.util.ArrayList;
import java.util.Scanner;

import guestBook.model.GuestDAO;
import guestBook.model.GuestDTO;

public class Example {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);

		while(true) {
			System.out.print("방명록관리메뉴선택(1:목록, 2:상세, 3:추가, 4:수정, 5:삭제, 기타:종료) : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				
				GuestDAO dao = new GuestDAO();
				ArrayList<GuestDTO> list = dao.getSelectAll();
				for(int i=0; i<list.size(); i++) {
					GuestDTO dto = list.get(i);
					dto.display();
				}
				
			} else if(menu.equals("2")) {
				
				GuestDTO dto = new GuestDTO();
				dto.input("view");
				
				GuestDAO dao = new GuestDAO();
				GuestDTO resultDto = dao.getSelectOne(dto);
				resultDto.display();
				
			} else if(menu.equals("3")) {
				
				GuestDTO dto = new GuestDTO();
				dto.input("chuga");
				
				GuestDAO dao = new GuestDAO();
				int result = dao.setInsert(dto);
				
			} else if(menu.equals("4")) {
				
				GuestDTO dto = new GuestDTO();
				dto.input("sujung");
				
				GuestDAO dao = new GuestDAO();
				int result = dao.setUpdate(dto);
				
			} else if(menu.equals("5")) {
				
				GuestDTO dto = new GuestDTO();
				dto.input("sakje");
				
				GuestDAO dao = new GuestDAO();
				int result = dao.setDelete(dto);
				
			} else {
				break;
			}
		}
		System.out.println("-- 시스템 종료 --");
	}

}
