package com.design.db.member.dao;
import java.util.List;
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
	    
}



