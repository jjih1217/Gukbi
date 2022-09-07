package sungjuk.model;

import java.util.Scanner;

public class SungjukDTO {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	private String grade;


	public void inputData() {//
		Scanner sc = new Scanner(System.in);
		System.out.print("이름:");
		String name = sc.nextLine();
		System.out.print("국어:");
		String kor_ = sc.nextLine();
		System.out.print("영어:");
		String eng_ = sc.nextLine();
		System.out.print("수학:");
		String mat_ = sc.nextLine();
		
		int kor = Integer.parseInt(kor_);
		int eng = Integer.parseInt(eng_);
		int mat = Integer.parseInt(mat_);
		
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	public void sumTot() {
		this.tot = this.kor + this.eng + this.mat;
	}
	
	public void display() {
		System.out.println(name + "\t" + kor + "\t" + eng + "\t" + mat + "\t" + tot );
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
	
	
	
}
