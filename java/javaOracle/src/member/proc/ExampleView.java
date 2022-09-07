package member.proc;

import java.util.Scanner;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class ExampleView {

	public static void main(String[] args) {
		// 상세보기
		Scanner sc = new Scanner(System.in);
		System.out.print("상세보기할 회원번호를 입력하세요 : ");
		String memeberNo_ = sc.nextLine();
		int memberNo = Integer.parseInt(memeberNo_);
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberNo(memberNo);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDto = dao.getSelectOne(dto);
		
		System.out.println("MemberNo : " + memberDto.getMemberNo());
		System.out.println("MemberId : " + memberDto.getMemberId());
		System.out.println("MemberJumin : " + memberDto.getMemberJumin());
		System.out.println("MemberPhone : " + memberDto.getMemberPhone());
		System.out.println("MemberEmail : " + memberDto.getMemberEmail());
		System.out.println("MemberAddress : " + memberDto.getMemberAddress());
		System.out.println("regiDate : " + memberDto.getRegiDate());

	}

}



