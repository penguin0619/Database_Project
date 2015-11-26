package com.design.db.member.dao;

public class MemberVo {
    private Integer member_no;
    private String member_id;
    private Integer member_pos_code;
    private String member_name;
    private String member_degree;
    private String member_password;
    private String member_cellphone;
    private String member_personal_id;
    private String member_skillset;
    private String position_type;
    public Integer getMember_no() {
        return member_no;  
    }
    public void setMember_no(Integer member_no) {
        this.member_no = member_no;
    }    
    public String getMember_id() {
        return member_id;
    }
    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }
    public void setMember_pos_code(Integer member_pos_code) {
        this.member_pos_code = member_pos_code;
    }
    public Integer getMember_pos_code() {
        return member_pos_code;
    }
    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }
    public String getMember_name() {
        return member_name;
    }
    public void setMember_degree(String member_degree) {
        this.member_degree = member_degree;
    }
    public String getMember_degree() {
        return member_degree;
    }
    public void setMember_password(String member_password) {
        this.member_password = member_password;
    }
    public String getMember_password() {
        return member_password;
    }
    public String getMember_cellphone() {
        return member_cellphone;
    }
    public void setMember_cellphone(String member_cellphone) {
        this.member_cellphone = member_cellphone;
    }
    public void setMember_personal_id(String member_personal_id) {
        this.member_personal_id = member_personal_id;
    }
    public String getMember_personal_id(){
    	return this.member_personal_id;    	
    }
    public void setPosition_type(String position_type) {
        this.position_type = position_type;
    }
    public String getPosition_type(){
    	return this.position_type;    	
    }
    public void setMember_skillset(String member_skillset) {
        this.member_skillset = member_skillset;
    }
    public String getMember_skillset() {
    	if(member_skillset.equals(""))
    		return "입력하지 않음";
    	return member_skillset;
    }
}