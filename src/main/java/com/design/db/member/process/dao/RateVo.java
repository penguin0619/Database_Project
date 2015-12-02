package com.design.db.member.process.dao;

public class RateVo {
	private String member_no;
	private String project_no;
	private String appraiser_code;
	private String appraiser_member_no;
	private int performance_score;
	private int communication_score;
	private String detail;
	private String member_name;
	private String role;
	private String appraiser_type;
	public String getAppraiser_type() {
		return appraiser_type;
	}
	public void setAppraiser_type(String appraiser_type) {
		this.appraiser_type = appraiser_type;
	}
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
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
	public String getAppraiser_code() {
		return appraiser_code;
	}
	public void setAppraiser_code(String appraiser_code) {
		this.appraiser_code = appraiser_code;
	}
	public String getAppraiser_member_no() {
		return appraiser_member_no;
	}
	public void setAppraiser_member_no(String appraiser_member_no) {
		this.appraiser_member_no = appraiser_member_no;
	}
	public int getPerformance_score() {
		return performance_score;
	}
	public void setPerformance_score(int performance_score) {
		this.performance_score = performance_score;
	}
	public int getCommunication_score() {
		return communication_score;
	}
	public void setCommunication_score(int communication_score) {
		this.communication_score = communication_score;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
	
}
