package guestBook.model;

import java.sql.Date;
import java.util.Scanner;

public class GuestDTO {
	private int no;
	private String writer;
	private String subject;
	private String content;
	private String passwd;
	private Date regiDate;
	
	public void input (String gubun) {
		Scanner sc = new Scanner(System.in);
		
		if(gubun.equals("view") || gubun.equals("sujung") || gubun.equals("sakje")) {
			String imsi ="상세보기";
			if(gubun.equals("sujung")) {
				imsi = "수정";
			} else if(gubun.equals("sakje")) {
				imsi = "삭제";
			}
			System.out.print(imsi + "할 번호 : ");
			String no_ = sc.nextLine();
			this.no = Integer.parseInt(no_);
		}
		
		if(gubun.equals("chuga") || gubun.equals("sujung")) {
			System.out.print("작성자 : ");
			this.writer = sc.nextLine();
			System.out.print("제목 : ");
			this.subject = sc.nextLine();
			System.out.print("내용 : ");
			this.content = sc.nextLine();
			System.out.print("비밀번호 : ");
			this.passwd = sc.nextLine();
		}
	}
	
	public void display() {
		String msg = "";
		msg += no + "\t";
		msg += writer + "\t";
		msg += subject + "\t";
		msg += content + "\t";
		msg += passwd + "\t";
		msg += regiDate;
		
		System.out.println(msg);
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
	
}
