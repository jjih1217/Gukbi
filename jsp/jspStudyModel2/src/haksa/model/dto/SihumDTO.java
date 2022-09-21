package haksa.model.dto;

import java.sql.Date;

public class SihumDTO {
	private int sihumNo;
	private String sihumName;
	private Date sihumDate;
	private Date regiDate;
	
	public int getSihumNo() {
		return sihumNo;
	}
	public void setSihumNo(int sihumNo) {
		this.sihumNo = sihumNo;
	}
	public String getSihumName() {
		return sihumName;
	}
	public void setSihumName(String sihumName) {
		this.sihumName = sihumName;
	}
	public Date getSihumDate() {
		return sihumDate;
	}
	public void setSihumDate(Date sihumDate) {
		this.sihumDate = sihumDate;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
	
}
