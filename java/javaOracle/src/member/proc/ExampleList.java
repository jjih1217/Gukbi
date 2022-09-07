package member.proc;

import java.util.ArrayList;
import java.util.Date;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class ExampleList {

	public static void main(String[] args) {
		MemberDAO memberDao = new MemberDAO();
		ArrayList<MemberDTO> list = memberDao.getSelectAll();
		
		for(int i=0; i< list.size(); i++) {
			MemberDTO memberDto = list.get(i);
			int memberNo = memberDto.getMemberNo();
			String memberId = memberDto.getMemberId();
			String memberName = memberDto.getMemberName();
			Date regiDate = memberDto.getRegiDate();
			
			 System.out.println("memberNo : " + memberNo);
			 System.out.println("memberId : " + memberId);
			 System.out.println("memberName : " + memberName);
			 System.out.println("regiDate : " + regiDate);
			 System.out.println("-------------------------------------");
		
		}
	}

}


