package Exam11;

import java.util.Scanner;

public class Test01 {

	public static void main(String[] args) {
//		입력 : 3명분의 이름, 국어, 영어, 수학
//		출력 : 이름 국어 영어 수학 총점
		
		Scanner sc = new Scanner(System.in);
		
		String studentInfo = "";
		int studentCounter = 3;
		
		for(int i = 0; i<studentCounter; i++) {
			String imsi = "";
			
			System.out.print("이름 입력 : ");
			imsi += "," + sc.nextLine();
			System.out.print("국어 : ");
			imsi += "," + sc.nextLine();
			System.out.print("영어 : ");
			imsi += "," + sc.nextLine();
			System.out.print("수학 : ");
			imsi += "," + sc.nextLine();
			
			imsi = imsi.substring(1);//첫번째 ,
			studentInfo += "|" + imsi; // 누적
		
//			System.out.println(imsi); // 조, 90, 90, 90
//			System.out.println(studentInfo); // |조, 90, 90, 90|인, 90, 90, 90
		}
		
		sc.close();
		studentInfo = studentInfo.substring(1); // 첫번째 | 
	
//		String[] stuList = studentInfo.split("[|]");
//		System.out.println(stuList[0]);
//		System.out.println(stuList[1]);
		
		
		String disp = "";
		String[] studentInfoArray = studentInfo.split("[|]");
//		System.out.println(studentInfoArray[0]);
		
		for(int i = 0; i<studentInfoArray.length; i++) {
			String imsi = studentInfoArray[i];
			String[] imsiArray = imsi.split(",");
			//System.out.println(imsiArray[0]);
			
			String tmp = "";
			for(int j = 0; j<imsiArray.length; j++) {
				tmp += imsiArray[i] + "\t";
			}
			
			disp += tmp + "\n";
		}
		System.out.printf("%s",disp);
		
	
		
		
	}

}
