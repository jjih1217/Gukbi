package member.proc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class ExampleChuga {
	//DB 추가
	public static void main(String[] args) {
		Scanner sc  = new Scanner(System.in);
		
		System.out.print("아이디 : ");
		String memberId = sc.nextLine();
		System.out.print("비밀번호 : ");
		String memberPasswd = sc.nextLine();
		System.out.print("이름 : ");
		String memberName = sc.nextLine();
		System.out.print("주민번호 : ");
		String memberJumin = sc.nextLine();
		System.out.print("전화번호 : ");
		String memberPhone = sc.nextLine();
		System.out.print("이메일 : ");
		String memberEmail = sc.nextLine();
		System.out.print("주소 : ");
		String memberAddress = sc.nextLine();
		sc.close();
		
		MemberDTO dto  = new MemberDTO();
		
		dto.setMemberId(memberId);
		dto.setMemberPasswd(memberPasswd);
		dto.setMemberName(memberName);
		dto.setMemberJumin(memberJumin);
		dto.setMemberPhone(memberPhone);
		dto.setMemberEmail(memberEmail);
		dto.setMemberAddress(memberAddress);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.setInsert(dto);
		
		if(result > 0) {
			System.out.println("--- success insert !! ---");
		} else {
			System.out.println("--- fail insert !! ---");			
		}
		
	}

}
