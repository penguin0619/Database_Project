package com.design.db.dao;

public class MemberVo {
    private Integer member_no;
    private String member_id;
    private Integer member_pos_code;
    private String member_name;
    private String member_degree;
    private String member_password;
    private Integer personal_id_front;
    private Integer personal_id_end;
    

    public Integer getMember_no() {
        return member_no;  
    }
    public void setMember_No(Integer member_no) {
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
    public void setPersonal_id_front(Integer personal_id_front) {
        this.personal_id_front = personal_id_front;
    }
    public Integer getPersonal_id_front(){
    	return personal_id_front;    	
    }
    public void setPersonal_id_end(Integer personal_id_end) {
        this.personal_id_end = personal_id_end;
    }
    public Integer getPersonal_id_end() {
        return personal_id_end;
    }
    
}