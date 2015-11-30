package com.design.db.process;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.design.db.member.dao.MemberDao;
import com.design.db.member.dao.MemberRoleVo;
import com.design.db.member.dao.MemberVo;
import com.design.db.member.project.dao.ProjectDao;
import com.design.db.member.project.dao.ProjectHistoryVo;
import com.design.db.member.project.dao.ProjectRequestVo;
import com.design.db.member.project.dao.ProjectSelectVo;
import com.design.db.member.project.dao.ProjectVo;

@Controller(value = "processController")
public class ViewController {
		
	@Resource(name = "memberDao")
    private MemberDao memberDao;
	
	@Resource(name = "projectDao")
	private ProjectDao projectDao;
	
	@PreAuthorize("hasRole('ROLE_PM')")  
	@RequestMapping(value = "/add_project_member", method = RequestMethod.POST)
    public String addProjectMember(ProjectHistoryVo project_history, ProjectVo project,
    		@RequestParam(value="add_list") String add_list,
    		@RequestParam(value="project_no") String project_no) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String pm_no = this.memberDao.select_user_no(auth.getName());
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String mTime = mSimpleDateFormat.format ( currentTime );
		
		project_history.setMember_no(pm_no);
		project.setProject_no(project_no);
		project_history.setProject_no(project_no);
		project_history.setRole_no("10"); // pm초기화
		project_history.setProject_start_date(mTime);
		project.setProject_start_date(mTime);
		project_history.setProject_end_date("0000-00-00");
		project.setProject_end_date("0000-00-00");
		project_history.setProject_avg("0");
		project.setProject_details("");
		this.projectDao.insert_project(project);
		
		this.projectDao.insert_project_history(project_history);
		if(!add_list.equals("")){
			String [] project_member = add_list.split(",");
			System.out.println(project_member[0]);
			for(String m : project_member){
				String [] split_attr = m.split(":");			
				project_history.setMember_no(split_attr[0]);
				project_history.setRole_no(split_attr[1]);
				this.projectDao.insert_project_history(project_history);
			}
		}
		Map<String,String> map =  new HashMap<String, String>();
		map.put("no", project_no );
		map.put("status", "진행중");        
		this.projectDao.update_status(map);
		return "redirect:/mypage";
    }
	
	@RequestMapping(value = "/history_project_list", method = RequestMethod.GET)
    public String dispHistoryList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
    		Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_no_s = this.memberDao.select_user_no(auth.getName());		
		int user_no = Integer.parseInt(user_no_s);
		
		int pageSize = 2;		
		int pageGroupSize = 2;			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		map.put("member_no", user_no);
		int count = this.projectDao.select_history_is(map);
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);

		List<ProjectRequestVo> list = this.projectDao.select_private_history_board(map);
		
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
		
        return "history.project.list";
    }
	
	@PreAuthorize("hasRole('ROLE_PM')")
	@RequestMapping(value = "/enabled_project_list", method = RequestMethod.GET)
    public String dispApprovalList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum, Model model) {
		int pageSize = 2;		
		int pageGroupSize = 2;			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = this.projectDao.select_count_approval_project();
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		List<ProjectRequestVo> list = this.projectDao.select_project_enabled_board(map);
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
		
        return "enabled.project.list";
    }

	@PreAuthorize("hasRole('ROLE_PM')")  
	@RequestMapping(value = "/enabled_project_view", method = RequestMethod.GET)
    public String dispApprovalView(@RequestParam(value="no", defaultValue="0") int project_request_no, Model model) {
		ProjectRequestVo project = this.projectDao.selectone_request_project(project_request_no);
        List<ProjectSelectVo> project_select = this.projectDao.select_approval_executive(Integer.toString(project_request_no));
		
        for (ProjectSelectVo s : project_select){
        	s.setMember_name(this.memberDao.select_user_name(s.getMember_no()));
        }
        
        model.addAttribute("project", project);
        model.addAttribute("select", project_select);
        return "enabled.project.view";
    }
	@PreAuthorize("hasRole('ROLE_PM')")  
	@RequestMapping(value = "/history_project_view", method = RequestMethod.GET)
    public String dispHistoryView(@RequestParam(value="no", defaultValue="0") int project_request_no, Model model) {
		ProjectRequestVo project = this.projectDao.selectone_request_project(project_request_no);
        List<ProjectSelectVo> project_select = this.projectDao.select_approval_executive(Integer.toString(project_request_no));
		
        for (ProjectSelectVo s : project_select){
        	s.setMember_name(this.memberDao.select_user_name(s.getMember_no()));
        }
        
        model.addAttribute("project", project);
        model.addAttribute("select", project_select);
        return "history.project.view";
    }
	@PreAuthorize("hasRole('ROLE_PM')") 
	@RequestMapping(value = "/make_project_list", method = RequestMethod.GET)
	    public String dispMemberList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
	    		@RequestParam(value="project_no", defaultValue="1") Integer project_no, Model model) {
		int pageSize = 2;		
		int pageGroupSize = 2;			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = this.memberDao.select_count_project_member();
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		List<MemberRoleVo> role_list = this.memberDao.select_role();
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		List<MemberVo> list = this.memberDao.select_make_project_board(map);
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
		model.addAttribute("role_list", role_list);
		model.addAttribute("project_no", project_no);
	        return "make.project.list";
	    }
	
}
