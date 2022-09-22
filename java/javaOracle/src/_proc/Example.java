package _proc;

import java.util.Scanner;

import member.proc.MemberExample;
import product.proc.ProductExample;
import sungjuk.proc.SungjukExample;

public class Example {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("프로그램선택(1:회원, 2:상품, 3:성적, 기타:종료)");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				//member.proc.MemberExample.main(args);
				MemberExample memberExample = new MemberExample();
				memberExample.memberExec();
				
			} else if(menu.equals("2")) {
				ProductExample productExample = new ProductExample();
				productExample.productExec();
				
			} else if(menu.equals("3")) {
				SungjukExample sungjukExample = new SungjukExample();
				sungjukExample.sungjukExec();
				
			} else {
				break;
			}
		}
		System.out.println("-- 프로그램 종료 --");
		
		String uri = "/jspPortfolioModel2/";
		String[] imsiUriArray = uri.split("/");
		System.out.println("imsiUriArray : " + imsiUriArray);
		
		String imsiUrlFileName = imsiUriArray[imsiUriArray.length - 1];
		
		System.out.println("imsiUriArray.length : " + imsiUriArray.length);
		System.out.println("imsiUrlFileName: " + imsiUrlFileName);
		
		//imsiUrlFileName = imsiUrlFileName.replace(".do", "");
	}

}
