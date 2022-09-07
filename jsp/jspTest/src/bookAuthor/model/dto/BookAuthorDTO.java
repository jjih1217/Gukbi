//bookAuthor/model/dto/BookAuthorDTO.java
package bookAuthor.model.dto;

import java.sql.Date;

public class BookAuthorDTO {
	private int authorNo;
	private String author;
	private Date regiDate;
	
	public int getAuthorNo() {
		return authorNo;
	}
	public void setAuthorNo(int authorNo) {
		this.authorNo = authorNo;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
	
}
