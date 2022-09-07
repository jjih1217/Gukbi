package member.model;

import java.sql.Date;
import java.util.Scanner;

public class MemberDTO {
	private int memberNo;
	private String memberId;
	private String memberPasswd;
	private String memberName;
	private String memberJumin;
	private String memberPhone;
	private String memberEmail;
	private String memberAddress;
	private Date regiDate;
	
	public void input(String gubun) {
		Scanner sc = new Scanner(System.in);
		
		if(gubun.equals("view") || gubun.equals("sujung") || gubun.equals("sakje")) {
			String imsi ="상세보기";
			if(gubun.equals("sujung")) {
				imsi = "수정";
			} else if(gubun.equals("sakje")) {
				imsi = "삭제";
			}
			System.out.print(imsi + "할 회원번호 : ");
			String memberNo_= sc.nextLine();
			memberNo = Integer.parseInt(memberNo_);
		}
		
		if(gubun.equals("chuga")) {
			System.out.print("아이디 : ");
			memberId = sc.nextLine();
			System.out.print("비밀번호 : ");
			memberPasswd = sc.nextLine();
			System.out.print("이름 : ");
			memberName = sc.nextLine();
			System.out.print("주민번호 : ");
			memberJumin = sc.nextLine();
		}
		
		if(gubun.equals("chuga") || gubun.equals("sujung")) {
			System.out.print("전화번호 : ");
			memberPhone = sc.nextLine();
			System.out.print("이메일 : ");
			memberEmail = sc.nextLine();
			System.out.print("주소 : ");
			memberAddress = sc.nextLine();
		}
	}
	
	public void display() {
		String msg = "";
		msg += memberNo + "\t";
		msg += memberId + "\t";
		msg += memberName + "\t";
		msg += memberJumin + "\t";
		msg += memberPhone + "\t";
		msg += memberEmail + "\t";
		msg += memberAddress+ "\t";
		msg += regiDate;
		System.out.printf("%s\n", msg);
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPasswd() {
		return memberPasswd;
	}

	public void setMemberPasswd(String memberPasswd) {
		this.memberPasswd = memberPasswd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberJumin() {
		return memberJumin;
	}

	public void setMemberJumin(String memberJumin) {
		this.memberJumin = memberJumin;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public Date getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
	
	
}
