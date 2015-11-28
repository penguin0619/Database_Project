package com.design.db.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository(value = "projectMapper")
public interface ProjectMapper {
	void insert_project_request(ProjectRequestVo project_requestVo);
	Integer select_count_request_project();
	List<ProjectRequestVo> select_project_request_board(Map<String, Integer> map);
	ProjectRequestVo selectone_request_project(int project_request_no);
	void update_status(Map<String,String> map);
	void insert_approval_request(ProjectApprovalVo project_approval);
	ProjectApprovalVo selectOne_approval(int project_request_no);
}