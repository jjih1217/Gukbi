package haksa.model.dto;

import java.sql.Date;

public class SungjukDTO {
	private int sungjukNo;
	private int kor;
	private int eng;
	private int mat;
	private int sci;
	private int his;
	private int tot;
	private Double avg;
	private String grade;
	private int hakbun;
	private int sihumNo;
	private Date regiDate;
	
	private String studentName;
	private String sihumName;
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getSihumName() {
		return sihumName;
	}
	public void setSihumName(String sihumName) {
		this.sihumName = sihumName;
	}
	
	
	public int getSungjukNo() {
		return sungjukNo;
	}
	public void setSungjukNo(int sungjukNo) {
		this.sungjukNo = sungjukNo;
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
	public int getSci() {
		return sci;
	}
	public void setSci(int sci) {
		this.sci = sci;
	}
	public int getHis() {
		return his;
	}
	public void setHis(int his) {
		this.his = his;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public Double getAvg() {
		return avg;
	}
	public void setAvg(Double avg) {
		this.avg = avg;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getHakbun() {
		return hakbun;
	}
	public void setHakbun(int hakbun) {
		this.hakbun = hakbun;
	}
	public int getSihumNo() {
		return sihumNo;
	}
	public void setSihumNo(int sihumNo) {
		this.sihumNo = sihumNo;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
	
}
