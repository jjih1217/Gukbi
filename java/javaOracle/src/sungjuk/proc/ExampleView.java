package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleView {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("상세보기할 No를 입력하세요 : ");
		String no_ = sc.nextLine();		
		int no = Integer.parseInt(no_);
		
		SungjukDTO dto = new SungjukDTO();
		dto.setNo(no);
		
		SungjukDAO dao = new SungjukDAO();
		SungjukDTO sungjukDto = dao.getSelectOne(dto);
		
		System.out.println("no : " + sungjukDto.getNo());
		System.out.println("name : " + sungjukDto.getName());
		System.out.println("kor : " + sungjukDto.getKor());
		System.out.println("eng : " + sungjukDto.getEng());
		System.out.println("mat : " + sungjukDto.getMat());
		System.out.println("tot : " + sungjukDto.getTot());
		System.out.println("avg : " + sungjukDto.getAvg());
		System.out.println("grade : " + sungjukDto.getGrade());
		System.out.println("regiDate : " + sungjukDto.getRegiDate());
		
	}

}
