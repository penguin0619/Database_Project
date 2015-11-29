package com.design.db.member.project;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.design.db.member.dao.MemberBeforeVo;
import com.design.db.member.dao.MemberDao;
import com.design.db.member.dao.MemberVo;
import com.design.db.member.dao.ProjectApprovalVo;
import com.design.db.member.dao.ProjectDao;
import com.design.db.member.dao.ProjectRequestVo;

@Controller(value = "projectController")
public class ViewController {
	
	@Resource(name = "projectDao")
	private ProjectDao projectDao;
	
	@Resource(name = "memberDao")
	private MemberDao memberDao;
	
	@RequestMapping(value = "/request_project", method = RequestMethod.GET)
    public String reqProject(Model model) {
        return "project.req.write";
    }
	@RequestMapping(value = "/project_write_ok", method = RequestMethod.POST)
    public String writeProject(@ModelAttribute("object") ProjectRequestVo project_requestVo) {
		long todaytime = System.currentTimeMillis(); 
		SimpleDateFormat date;
		date = new SimpleDateFormat("yyyyMMdd");
		String s_date = date.format(new Date(todaytime));
		project_requestVo.setProject_register_date(s_date);
		project_requestVo.setProject_status("대기중");
		this.projectDao.insert_project_request(project_requestVo);
		return "signin";
    }
	@PreAuthorize("hasRole('ROLE_EXECUTIVE') OR hasRole('ROLE_SECRETARY')")
	@RequestMapping(value = "/request_project_list", method = RequestMethod.GET)
    public String dispReqProjectList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum, Model model) {
		int pageSize = 2;		
		int pageGroupSize = 2;
			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = this.projectDao.select_count_request_project();
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		List<ProjectRequestVo> list = this.projectDao.select_project_request_board(map);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("pageGroupSize", pageGroupSize);
		model.addAttribute("numPageGroup", numPageGroup);
		model.addAttribute("pageGroupCount", pageGroupCount);
		model.addAttribute("list",list);			
		
        return "project.req.list";
    }
	
	@PreAuthorize("hasRole('ROLE_EXECUTIVE')")
	@RequestMapping(value = "/request_approval_list", method = RequestMethod.GET)
    public String dispReqApprovalList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum, Model model) {
		int pageSize = 2;		
		int pageGroupSize = 2;
			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = this.projectDao.select_count_request_project();
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		List<ProjectRequestVo> list = this.projectDao.select_project_approval_board(map);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("pageGroupSize", pageGroupSize);
		model.addAttribute("numPageGroup", numPageGroup);
		model.addAttribute("pageGroupCount", pageGroupCount);
		model.addAttribute("list",list);			
		
        return "project.approval.list";
    }
	@PreAuthorize("hasRole('ROLE_EXECUTIVE') OR hasRole('ROLE_SECRETARY')") 
	@RequestMapping(value = "/request_project_view", method = RequestMethod.GET)
    public String dispReqProjectView(@RequestParam(value="no", defaultValue="0") int project_request_no, Model model) {
		ProjectRequestVo project = this.projectDao.selectone_request_project(project_request_no);
        model.addAttribute("project", project);	
        return "project.req.view";
    }
	
	@PreAuthorize("hasRole('ROLE_EXECUTIVE')")  
	@RequestMapping(value = "/request_approval_view", method = RequestMethod.GET)
    public String dispReqApprovalView(@RequestParam(value="no", defaultValue="0") int project_request_no, Model model) {
				
		ProjectApprovalVo approval = this.projectDao.selectOne_approval(project_request_no);
		String request_approval_name = this.memberDao.select_user_name(approval.getMember_no());
		System.out.println(request_approval_name);
		model.addAttribute("request_approval_name", request_approval_name);
		model.addAttribute("approval",approval);
		ProjectRequestVo project = this.projectDao.selectone_request_project(project_request_no);
        model.addAttribute("project", project);
	
        return "project.approval.view";
    }
	
	@PreAuthorize("authenticated") 
	@RequestMapping(value = "/request_approval", method = RequestMethod.POST)
    public String procProjectApproval(@RequestParam(value="no", defaultValue="0") String project_request_no, Model model,
    		 ProjectApprovalVo project_approval, @RequestParam(value="opinion") String opinion) {
		String executive_num = this.memberDao.select_count_positions("0");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_no = this.memberDao.select_user_no(auth.getName());
		System.out.println(user_no);
		System.out.println(project_request_no);
		project_approval.setMember_no(user_no);
		project_approval.setProject_no(project_request_no);
		project_approval.setApproval_max_num(executive_num);
		project_approval.setApproval_checknum("0");
		project_approval.setApproval_count("0");
		project_approval.setApproval_detail(opinion);
		Map<String,String> map =  new HashMap<String, String>();
		map.put("no", project_request_no );
		map.put("status", "결재중");
        this.projectDao.update_status(map);
        this.projectDao.insert_approval_request(project_approval);
		return "redirect:/request_project_list";
    }
}
