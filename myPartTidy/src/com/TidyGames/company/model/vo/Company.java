package com.TidyGames.company.model.vo;

import java.sql.Date;

public class Company {

	private int companyNo;
	private String companyName;
	private String companyPwd;
	private String companyHead;
	private String companyComment;
	private Date companyEnroll;
	private String companyStatus;
	private String companyId;
	
	public Company() {}

	public Company(int companyNo, String companyName, String companyPwd, String companyHead, String companyComment,
			Date companyEnroll, String companyStatus, String companyId) {
		super();
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.companyPwd = companyPwd;
		this.companyHead = companyHead;
		this.companyComment = companyComment;
		this.companyEnroll = companyEnroll;
		this.companyStatus = companyStatus;
		this.companyId = companyId;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPwd() {
		return companyPwd;
	}

	public void setCompanyPwd(String companyPwd) {
		this.companyPwd = companyPwd;
	}

	public String getCompanyHead() {
		return companyHead;
	}

	public void setCompanyHead(String companyHead) {
		this.companyHead = companyHead;
	}

	public String getCompanyComment() {
		return companyComment;
	}

	public void setCompanyComment(String companyComment) {
		this.companyComment = companyComment;
	}

	public Date getCompanyEnroll() {
		return companyEnroll;
	}

	public void setCompanyEnroll(Date companyEnroll) {
		this.companyEnroll = companyEnroll;
	}

	public String getCompanyStatus() {
		return companyStatus;
	}

	public void setCompanyStatus(String companyStatus) {
		this.companyStatus = companyStatus;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	@Override
	public String toString() {
		return "Company [companyNo=" + companyNo + ", companyName=" + companyName + ", companyPwd=" + companyPwd
				+ ", companyHead=" + companyHead + ", companyComment=" + companyComment + ", companyEnroll="
				+ companyEnroll + ", companyStatus=" + companyStatus + ", companyId=" + companyId + "]";
	}

	
	
}
