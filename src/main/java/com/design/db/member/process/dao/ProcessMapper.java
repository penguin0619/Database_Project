package com.design.db.member.process.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository(value = "processMapper")
public interface ProcessMapper {
		void insert_default_rate(RateVo rate_vo);
		List<RateVo> select_appraise(Map<String,String> map);
		void update_appraise(Map<String,String> map);
   }
