package sungjuk.proc;

import java.sql.Date;
import java.util.ArrayList;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleList {

	public static void main(String[] args) {
		SungjukDAO dao = new SungjukDAO();
		ArrayList<SungjukDTO> list = dao.getSelectAll();
		
		for(int i=0; i<list.size(); i++) {
			 SungjukDTO SungjukDto = list.get(i);
			 int no = SungjukDto.getNo();
			 String name = SungjukDto.getName();
			 int kor = SungjukDto.getKor();
			 int eng = SungjukDto.getEng();
			 int mat = SungjukDto.getMat();
			 int tot = SungjukDto.getTot();
			 double avg = SungjukDto.getAvg();
			 String grade = SungjukDto.getGrade();
			 Date regiDate = SungjukDto.getRegiDate();


			 System.out.println("no : " + no);
			 System.out.println("name : " + name);
			 System.out.println("kor : " + kor);
			 System.out.println("eng : " + eng);
			 System.out.println("mat : " + mat);
			 System.out.println("tot : " + tot);
			 System.out.println("avg : " + avg);
			 System.out.println("tot : " + tot);
			 System.out.println("grade : " + grade);
			 System.out.println("regiDate : " + regiDate);
			 System.out.println("-------------------------------------");
		}

	}

}
