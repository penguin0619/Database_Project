package com.design.db.member.process.dao;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service(value = "processDao")
public class ProcessDao {
	@Resource(name = "processMapper")
	private ProcessMapper processMapper;
	
	public void insert_default_rate(RateVo rate_vo){
		this.processMapper.insert_default_rate(rate_vo);
	}
	public List<RateVo> select_appraise(Map<String,String> map){
		return this.processMapper.select_appraise(map);
	}
	public void update_appraise(Map<String,String> map){
		this.processMapper.update_appraise(map);
	}
	public int count_complete_appraise(Map<String,Integer> map){
		return this.processMapper.count_complete_appraise(map);
	}
	public List<RateVo> select_complete_appraise(Map<String,Integer> map){
		return this.processMapper.select_complete_appraise(map);
	}

}




