package com.design.db.member.project.dao;

public class ProjectVo {
	private String project_no;
	private String project_start_date;
	public String getProject_no() {
		return project_no;
	}
	public void setProject_no(String project_no) {
		this.project_no = project_no;
	}
	public String getProject_start_date() {
		return project_start_date;
	}
	public void setProject_start_date(String project_start_date) {
		this.project_start_date = project_start_date;
	}
	public String getProject_end_date() {
		return project_end_date;
	}
	public void setProject_end_date(String project_end_date) {
		this.project_end_date = project_end_date;
	}
	public String getProject_details() {
		return project_details;
	}
	public void setProject_details(String project_details) {
		this.project_details = project_details;
	}
	private String project_end_date;
	private String project_details;
}
