package com.design.db.member.dao;

public class ProjectApprovalVo {
	private String member_no;
	private String project_no;
	private String approval_max_num;
	private String approval_checknum;
	private String approval_count;
	private String approval_detail;
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getProject_no() {
		return project_no;
	}
	public void setProject_no(String project_no) {
		this.project_no = project_no;
	}
	public String getApproval_max_num() {
		return approval_max_num;
	}
	public void setApproval_max_num(String approval_max_num) {
		this.approval_max_num = approval_max_num;
	}
	public String getApproval_checknum() {
		return approval_checknum;
	}
	public void setApproval_checknum(String approval_checknum) {
		this.approval_checknum = approval_checknum;
	}
	public String getApproval_count() {
		return approval_count;
	}
	public void setApproval_count(String approval_count) {
		this.approval_count = approval_count;
	}
	public String getApproval_detail() {
		return approval_detail;
	}
	public void setApproval_detail(String approval_detail) {
		this.approval_detail = approval_detail;
	}
	
}
