package com.design.db.member.project.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository(value = "projectMapper")
public interface ProjectMapper {
	void insert_project_request(ProjectRequestVo project_requestVo);
	void insert_approval_select(ProjectSelectVo project_selectVo);
	Integer select_count_request_project();
	int select_history_is(Map<String, Integer> map);
	int select_current_project_count(String project_no);
	List<ProjectRequestVo> select_project_request_board(Map<String, Integer> map);
	List<ProjectRequestVo> select_project_approval_board(Map<String, Integer> map);
	List<ProjectRequestVo> select_project_enabled_board(Map<String, Integer> map);
	ProjectRequestVo selectone_request_project(int project_request_no);
	void update_status(Map<String,String> map);
	void end_project_member(Map<String,String> map);
	void update_checknum(int project_no);
	void update_count(int project_no);
	void insert_approval_request(ProjectApprovalVo project_approval);
	ProjectApprovalVo selectOne_approval(int project_request_no);
	List<ProjectSelectVo> select_approval_executive(String project_no);
	void insert_project_history(ProjectHistoryVo project_history);
	void insert_project(ProjectVo project);
	List<ProjectRequestVo> select_private_history_board(Map<String, Integer> map);
	List<ProjectHistoryVo> select_current_project(Map<String, Integer> map);
	int select_approval_is(Map<String, String> map);
	int select_count_approval_project();
	void end_project(Map<String, String> map);
	void end_project_date(Map<String, String> map);
	List<String> select_appraiser(String project_no);
	String select_pm(String project_no);
	int appraise_count(String member_no);
	List<ProjectRequestVo> appraise_list(Map<String, Integer> map);
}