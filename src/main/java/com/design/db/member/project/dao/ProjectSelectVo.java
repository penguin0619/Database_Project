package com.design.db.member.project.dao;

public class ProjectSelectVo {
	private String member_no;
	private String project_no;
	private String approval_select;
	private String approval_opinion;
	private String member_name;
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
	public String getApproval_select() {
		return approval_select;
	}
	public void setApproval_select(String approval_select) {
		this.approval_select = approval_select;
	}
	public String getApproval_opinion() {
		return approval_opinion;
	}
	public void setApproval_opinion(String approval_opinion) {
		this.approval_opinion = approval_opinion;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
}
