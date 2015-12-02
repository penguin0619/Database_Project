package com.design.db.member.project.dao;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service(value = "projectDao")
public class ProjectDao {
	@Resource(name = "projectMapper")
	private ProjectMapper projectMapper;
	
	
	public void insert_project_request(ProjectRequestVo project_requestVo) {
        this.projectMapper.insert_project_request(project_requestVo);
   }
	public void insert_approval_select(ProjectSelectVo project_selectVo){
		this.projectMapper.insert_approval_select(project_selectVo);
	}
	public List<ProjectRequestVo> select_project_request_board(Map<String, Integer> map){
		return this.projectMapper.select_project_request_board(map);		
	}
	public List<ProjectRequestVo> select_project_approval_board(Map<String, Integer> map){
		return this.projectMapper.select_project_approval_board(map);
	}
	public List<ProjectRequestVo> select_project_enabled_board(Map<String, Integer> map){
		return this.projectMapper.select_project_enabled_board(map);
	}
	public List<ProjectRequestVo> select_project_waiting_board(Map<String, Integer> map){
		return this.projectMapper.select_project_waiting_board(map);
	}
	public List<ProjectRequestVo> select_project_no_board(Map<String, Integer> map){
		return this.projectMapper.select_project_no_board(map);
	}
	public List<ProjectRequestVo> select_project_ing_board(Map<String, Integer> map){
		return this.projectMapper.select_project_ing_board(map);
	}
	public List<ProjectRequestVo> select_project_end_board(Map<String, Integer> map){
		return this.projectMapper.select_project_end_board(map);
	}
	
	public Integer select_count_request_project(){
		return this.projectMapper.select_count_request_project();
	}
	public int select_count_approval_project(){
		return this.projectMapper.select_count_approval_project();
	}
	public int select_approval_is(Map<String, String> map){
		return this.projectMapper.select_approval_is(map);
	}
	public List<ProjectHistoryVo> select_member_history(String member_no){
		return this.projectMapper.select_member_history(member_no);
	}
	public int select_history_is(Map<String, Integer> map){
		return this.projectMapper.select_history_is(map);
	}
	public int select_current_project_count(String project_no){
		return this.projectMapper.select_current_project_count(project_no);
	}
	public ProjectRequestVo selectone_request_project(int project_request_no){
		return this.projectMapper.selectone_request_project(project_request_no);
	}
	public void update_status(Map<String,String> map){
		this.projectMapper.update_status(map);
	}
	public void update_checknum(int project_no){
		this.projectMapper.update_checknum(project_no);
	}	
	public void update_count(int project_no){
		this.projectMapper.update_count(project_no);
	}	
	public void end_project_member(Map<String,String> map){
		this.projectMapper.end_project_member(map);
	}
	public void insert_approval_request(ProjectApprovalVo project_approval){
		this.projectMapper.insert_approval_request(project_approval);
	}
	public ProjectApprovalVo selectOne_approval(int project_request_no){
		return this.projectMapper.selectOne_approval(project_request_no);
	}
	public List<ProjectSelectVo> select_approval_executive(String project_no){
		return this.projectMapper.select_approval_executive(project_no);
	}
	public void insert_project_history(ProjectHistoryVo project_history){
		this.projectMapper.insert_project_history(project_history);
	}
	public void insert_project(ProjectVo project){
		this.projectMapper.insert_project(project);
	}
	public List<ProjectRequestVo> select_private_history_board(Map<String, Integer> map){
		return this.projectMapper.select_private_history_board(map);
	}
	public List<ProjectHistoryVo> select_current_project(Map<String, Integer> map){
		return this.projectMapper.select_current_project(map);
	}
	public void end_project(Map<String, String> map){
		this.projectMapper.end_project(map);
	}
	public void end_project_date(Map<String, String> map){
		this.projectMapper.end_project_date(map);
	}
	public List<String> select_appraiser(String project_no){
		return this.projectMapper.select_appraiser(project_no);
	}
	public String select_pm(String project_no){
		return this.projectMapper.select_pm(project_no);
	}
	public int appraise_count(String member_no){
		return this.projectMapper.appraise_count(member_no);
	}
	public List<ProjectRequestVo> appraise_list(Map<String, Integer> map){
		return this.projectMapper.appraise_list(map);
	}	
	public int select_count_status_project(Map<String, String> map){
		return this.projectMapper.select_count_status_project(map);
	}

}




