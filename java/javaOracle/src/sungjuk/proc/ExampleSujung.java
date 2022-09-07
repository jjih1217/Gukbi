package sungjuk.proc;

import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class ExampleSujung {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("수정할 No를 입력하세요 : ");
		String no_ = sc.nextLine();
		System.out.print("수정할 국어 성적 입력 : ");
		String kor_ = sc.nextLine();
		System.out.print("수정할 영어 성적 입력 : ");
		String eng_ = sc.nextLine();
		System.out.print("수정할 수학 성적 입력 : ");
		String mat_ = sc.nextLine();
		
		int no = Integer.parseInt(no_);
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
		
		SungjukDTO dto = new SungjukDTO();
		dto.setNo(no);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		dto.setTot(tot);
		dto.setAvg(avg);
		dto.setGrade(grade);
		
		SungjukDAO dao = new SungjukDAO();
		int result = dao.setUpdate(dto);
		
		if(result > 0) {
			System.out.println("-- update success --");
		} else {
			System.out.println("-- update fail --");
		}
	}

}
