package com.design.db.member.dao;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service(value = "memberDao")
public class MemberDao {
	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	public MemberVo getDupcheck(String member_id){
    	return this.memberMapper.dupcheck(member_id);
    }	
	public List<MemberVo> getSelect() {
        return this.memberMapper.select();
    }
    public void insert(MemberVo memberVo) {
        this.memberMapper.insert(memberVo);
   }
    public void insert_skillset(MemberVo memberVo){
    	this.memberMapper.insert_skillset(memberVo);
    }
    public void insert_career(MemberBeforeVo memberBeforeVo){
    	this.memberMapper.insert_career(memberBeforeVo);
    }
    public MemberVo selectid(String member_id){
    	return this.memberMapper.select_id(member_id);
    }
    public MemberVo selectno(Integer member_no){
    	return this.memberMapper.select_no(member_no);
    }
    public List<MemberBeforeVo>select_career(Integer member_no){
    	return this.memberMapper.select_career(member_no);
    }
	public String select_count_positions(String member_pos_code){
		return this.memberMapper.select_count_positions(member_pos_code);
	}
	public String select_user_no(String user_id){
		return this.memberMapper.select_user_no(user_id);
	}
	public String select_what_position(String user_id){
		return this.memberMapper.select_what_position(user_id);
	}
	public String select_user_name(String member_no){
		return this.memberMapper.select_user_name(member_no);
	}
	public int select_count_member(){
		return this.memberMapper.select_count_member();
	}
	public List<MemberVo> select_member_board(Map<String, Integer> map){
		return this.memberMapper.select_member_board(map);		
	}
}




