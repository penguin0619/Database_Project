package com.design.db.dao;
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
    
	
	    
}




