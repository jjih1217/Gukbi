package sungjuk.model;

import java.sql.Date;
import java.util.Scanner;

public class SungjukDTO {
	private int no;
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	private String grade;
	private Date regiDate;
	
	public void input(String gubun) {
		Scanner sc = new Scanner(System.in);
		
		if(gubun.equals("view") || gubun.equals("sujung") || gubun.equals("sakje")) {
			System.out.print("no : ");
			String no_= sc.nextLine();
			this.no = Integer.parseInt(no_);
		}
		
		if(gubun.equals("chuga") || gubun.equals("sujung")) {
			
			if(!gubun.equals("sujung")) {
				System.out.print("이름 : ");
				this.name = sc.nextLine();
			}
			
			System.out.print("국어 : ");
			String kor_ = sc.nextLine();
			this.kor = Integer.parseInt(kor_);
			
			System.out.print("영어 : ");
			String eng_ = sc.nextLine();
			this.eng = Integer.parseInt(eng_);
			
			System.out.print("수학 : ");
			String mat_ = sc.nextLine();
			this.mat = Integer.parseInt(mat_);
		}

	}
	

	public void tot() {
		tot = kor + eng + mat;
	}
	
	public void avg() {
		avg = tot / 3.0;
	}
	
	public void grade() {
		grade = "가";
		if(avg > 90) {
			grade = "수";
		} else if(avg > 80) {
			grade = "우";
		} else if(avg > 70) {
			grade = "미";
		} else if(avg > 60) {
			grade = "양";
		}
	}
	
	public void display() {
		String msg = "";
		msg += no + "\t";
		msg += name + "\t";
		msg += kor + "\t";
		msg += eng + "\t";
		msg += mat + "\t";
		msg += tot + "\t";
		msg += avg + "\t";
		msg += grade + "\t";
		msg += regiDate;
		System.out.printf("%s\n", msg);
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	

}
