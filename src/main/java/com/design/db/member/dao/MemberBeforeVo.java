package com.design.db.member.dao;

public class MemberBeforeVo {
	private Integer member_no;
	private String before_company_name;
	private String position;
	private String work_at_date;
	private String work_end_date;
	public void setsplit(String content){
		String [] split = content.split(",");
		this.before_company_name = split[0];
		this.position = split[1];		
		this.work_at_date = split[2];
		this.work_end_date = split[3];
		System.out.println(work_at_date);
	}
	
	public Integer getMember_no() {
        return member_no;  
    }
	public void setMember_no(Integer member_no) {
        this.member_no = member_no;
    }   
	public String getPosition() {
        return position;  
    }
	public void setPosition(String position) {
        this.position = position;
    }
	public String getBefore_company_name() {
        return before_company_name;  
    }
	public void setBefore_company_name(String before_company_name) {
        this.before_company_name = before_company_name;
    }
	public String getWork_at_date() {
        return work_at_date;  
    }
	public void setWork_at_date(String work_at_date){
		this.work_at_date = work_at_date;
	}
	public String getWork_end_date() {
        return work_end_date;  
    }
	public void setWork_end_date(String work_end_date){
		this.work_end_date = work_end_date;
	}

}
