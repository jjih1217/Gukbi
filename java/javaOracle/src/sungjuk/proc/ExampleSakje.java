package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleSakje {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("삭제할 No를 입력하세요 : ");
		String no_ = sc.nextLine();
		sc.close();
		
		int no = Integer.parseInt(no_);
		
		SungjukDTO dto = new SungjukDTO();
		dto.setNo(no);
		
		SungjukDAO dao = new SungjukDAO();
		int result = dao.setDelete(dto);
		
		if(result > 0) {
			System.out.println("-- delete success -- : " + result);
		} else {
			System.out.println("-- delete fail -- : " + result);
		}

	}

}
