package factory.model.dto;

import java.sql.Date;

public class EmployeeDTO {
	private int sabun;
	private String name;
	private String phone;
	private Date hireDate;
	private String email;
	private int salary;
	private String buseo;
	private Date regiDate;
	
	private int buseoNo;
	private String buseoName;
	private int positionNo;
	
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getBuseo() {
		return buseo;
	}
	public void setBuseo(String buseo) {
		this.buseo = buseo;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	public int getBuseoNo() {
		return buseoNo;
	}
	public void setBuseoNo(int buseoNo) {
		this.buseoNo = buseoNo;
	}
	public String getBuseoName() {
		return buseoName;
	}
	public void setBuseoName(String buseoName) {
		this.buseoName = buseoName;
	}
	public int getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}
	
	
}
