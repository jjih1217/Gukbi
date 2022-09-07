package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleChuga {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = sc.nextLine();
		System.out.print("국어 입력 : ");
		String kor_ = sc.nextLine();
		System.out.print("영어 입력 : ");
		String eng_ = sc.nextLine();
		System.out.print("수학 입력 : ");
		String mat_ = sc.nextLine();
		
		int kor = Integer.parseInt(kor_);
		int eng = Integer.parseInt(eng_);
		int mat = Integer.parseInt(mat_);
		int tot = kor + eng + mat;
		double avg = tot / 3.0;
		
		String grade = "가";
		if(avg >= 90) {
			grade = "수";
		} else if(avg >= 80) {
			grade = "우";
		} else if(avg >= 70) {
			grade = "미";
		} else if(avg >= 60) {
			grade = "양";
		} 
		
//		String imsi = "";
//		imsi += name + "|";
//		imsi += kor + "|";
//		imsi += eng + "|";
//		imsi += mat + "|";
//		imsi += tot + "|";
//		imsi += avg + "|";
//		imsi += grade;
		
//		String[] array = new String[7];
//		array[0] = name;
//		array[1] = kor + "";
//		array[2] = eng + "";
//		array[3] = mat + "";
//		array[4] = tot + "";
//		array[5] = avg + "";
//		array[6] = grade;
		
		SungjukDTO dto = new SungjukDTO();
		dto.setName(name);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		dto.setTot(tot);
		dto.setAvg(avg);
		dto.setGrade(grade);
		
		SungjukDAO dao = new SungjukDAO();
		//dao.setInsert01(name, kor, eng, mat, tot, avg, grade);
		//dao.setInsert02(imsi);
		//dao.setInsert03(array);
		int result = dao.setInsert04(dto);
		
		if(result > 0) {
			System.out.println("-- 입력 성공 --");
		} else {
			System.out.println("-- 입력 실패 --");
		}
		
		
		
		
	}

}
