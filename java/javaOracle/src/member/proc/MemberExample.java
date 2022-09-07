package member.proc;

import java.util.ArrayList;
import java.util.Scanner;

import member.model.MemberDAO;
import member.model.MemberDTO;
import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class MemberExample {

	public void memberExec() {
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.print("회원관리메뉴선택(1:목록, 2:상세, 3:추가, 4:수정, 5:삭제, 기타:종료) : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> list = dao.getSelectAll();//[dto, dto,...]
				
				for(int i=0; i<list.size(); i++) {
					MemberDTO dto = list.get(i); 
					dto.display();
				}
				
			} else if(menu.equals("2")) {
				MemberDTO arguDto = new MemberDTO();
				arguDto.input("view");
				
				MemberDAO dao = new MemberDAO();
				MemberDTO resultDto = dao.getSelectOne(arguDto);
				resultDto.display();
				
			} else if(menu.equals("3")) {
				MemberDTO dto = new MemberDTO();
				dto.input("chuga");
				
				MemberDAO dao = new MemberDAO();
				int result = dao.setInsert(dto);
				
			} else if(menu.equals("4")) {
				MemberDTO dto = new MemberDTO();
				dto.input("sujung");
				
				MemberDAO dao = new MemberDAO();
				int result = dao.setUpdate(dto);
				
			} else if(menu.equals("5")) {
				MemberDTO dto = new MemberDTO();
				dto.input("sakje");
				
				MemberDAO dao = new MemberDAO();
				int result = dao.setDelete(dto);
			} else {
				break;
			}
		}
		System.out.println("-- 시스템 종료 --");

	}

}
