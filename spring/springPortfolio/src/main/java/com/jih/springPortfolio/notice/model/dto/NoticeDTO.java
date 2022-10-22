package com.jih.springPortfolio.notice.model.dto;

import java.sql.Date;

public class NoticeDTO {
	private int no;
	private int num;
	private String tbl;
	private String writer;
	private String subject;
	private String content;
	private String passwd;
	private int refNo;
	private int hit;
	private int memberNo;
	private int noticeNo;
	private Date regiDate;
	private String attachInfo;
	
	private String searchGubun;
	private String searchData;
	
	private int preNo;
	private String preSubject;
	private int nxtNo;
	private String nxtSubject;
	
	private int startRecord;
	private int lastRecord;
	
	public int getRefNo() {
		return refNo;
	}
	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTbl() {
		return tbl;
	}
	public void setTbl(String tbl) {
		this.tbl = tbl;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	public String getAttachInfo() {
		return attachInfo;
	}
	public void setAttachInfo(String attachInfo) {
		this.attachInfo = attachInfo;
	}
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getSearchData() {
		return searchData;
	}
	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	public int getPreNo() {
		return preNo;
	}
	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}
	public String getPreSubject() {
		return preSubject;
	}
	public void setPreSubject(String preSubject) {
		this.preSubject = preSubject;
	}
	public int getNxtNo() {
		return nxtNo;
	}
	public void setNxtNo(int nxtNo) {
		this.nxtNo = nxtNo;
	}
	public String getNxtSubject() {
		return nxtSubject;
	}
	public void setNxtSubject(String nxtSubject) {
		this.nxtSubject = nxtSubject;
	}
	public int getStartRecord() {
		return startRecord;
	}
	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}
	public int getLastRecord() {
		return lastRecord;
	}
	public void setLastRecord(int lastRecord) {
		this.lastRecord = lastRecord;
	}
	
	
}
