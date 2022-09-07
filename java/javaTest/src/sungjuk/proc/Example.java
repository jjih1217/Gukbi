package sungjuk.proc;

import java.util.ArrayList;
import java.util.Scanner;

import sungjuk.model.SungjukDTO;

public class Example {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		ArrayList<SungjukDTO> list = new ArrayList<>(); //[]: 빈 리스트  //[100(주소값),200(주소값)...]
//		arraylist : 길이 제한 없음
//		<Genelic> : <>안의 값만 가능
		
		for(int i=0; i<3; i++ ) {
//			System.out.print("이름:");
//			String name = sc.nextLine();
//			System.out.print("국어:");
//			String kor_ = sc.nextLine();
//			System.out.print("영어:");
//			String eng_ = sc.nextLine();
//			System.out.print("수학:");
//			String mat_ = sc.nextLine();
//			
//			int kor = Integer.parseInt(kor_);
//			int eng = Integer.parseInt(eng_);
//			int mat = Integer.parseInt(mat_);
			
			SungjukDTO dto = new SungjukDTO(); //이름이 dto인 객체 3개 생성 // 100 200... //작은가방
			dto.inputData();
//			dto.setName(name);
//			dto.setKor(kor);
//			dto.setEng(eng);
//			dto.setMat(mat);
			
			list.add(dto);//생성한 객체의 값을 list에 add //큰가방
				
		}
		
		
//		System.out.println(list); //[sungjuk.model.SungjukDTO@5f2050f6, sungjuk.model.SungjukDTO@3b81a1bc, sungjuk.model.SungjukDTO@64616ca2]
		//System.out.println("list.size() : " + list.size()); //3
		
		
		for(int i=0; i<list.size(); i++) {
			SungjukDTO dto = list.get(i);//객체(작은가방) = 인덱스의 위치에 있는 객체를 리턴
			
//			int tot = dto.getKor() + dto.getEng() + dto.getMat(); // 0, tot는 입력하지 않은 값, 객체생성시 필드에 초기값
//			dto.setTot(tot);//중요필수 //총점을변수에 저장
			dto.sumTot();
			
//			System.out.println(dto.getName() + "/" + dto.getKor() + "/" + dto.getEng() + "/" + dto.getMat() +  "/" + dto.getTot());
			dto.display();
		}
		

	}

}
