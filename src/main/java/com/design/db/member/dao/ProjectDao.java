package com.design.db.member.dao;
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
	public List<ProjectRequestVo> select_project_request_board(Map<String, Integer> map){
		return this.projectMapper.select_project_request_board(map);		
	}
	public Integer select_count_request_project(){
		return this.projectMapper.select_count_request_project();
	}
	public ProjectRequestVo selectone_request_project(int project_request_no){
		return this.projectMapper.selectone_request_project(project_request_no);
	}
	public void update_status(Map<String,String> map){
		this.projectMapper.update_status(map);
	}
	public void insert_approval_request(ProjectApprovalVo project_approval){
		this.projectMapper.insert_approval_request(project_approval);
	}
	public ProjectApprovalVo selectOne_approval(int project_request_no){
		return this.projectMapper.selectOne_approval(project_request_no);
	}
}




