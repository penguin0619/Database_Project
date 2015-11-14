package com.design.db.dao;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service(value = "memberDao")
public class MemberDao {
	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	public List<MemberVo> getSelect() {
        return this.memberMapper.select();
    }
    public void insert(MemberVo memberVo) {
        this.memberMapper.insert(memberVo);
   }
    
}




