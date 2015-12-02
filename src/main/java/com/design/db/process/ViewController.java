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
import com.design.db.member.process.dao.ProcessDao;
import com.design.db.member.process.dao.RateVo;
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
	
	@Resource(name = "processDao")
	private ProcessDao processDao;
	
	
	@RequestMapping(value = "/appraise_score_view", method = RequestMethod.GET)
	public String dispApprScoreView(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
			@RequestParam(value="member_no") Integer member_no,
			@RequestParam(value="project_no") Integer project_no,
			Model model) {
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("member_no", member_no);
		map.put("project_no", project_no);
		int pageSize = 10;		
		int pageGroupSize = 5;			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		
		int count = this.processDao.count_complete_appraise(map);
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		
		List<RateVo> list = this.processDao.select_complete_appraise(map);
		
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
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("project_no", project_no);
		model.addAttribute("member_no", member_no);
	        return "appraise.score.list";
	    }
	 
	@RequestMapping(value = "/modify_appraise_member", method = RequestMethod.POST)
    public String modifyAppraiseMember(RateVo rate_vo, 
    		@RequestParam(value="appraise_content") String appraise_content,
    		@RequestParam(value="project_no") String project_no) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String appriaser_no = this.memberDao.select_user_no(auth.getName());
		Map<String, String> map =  new HashMap<String, String>();
		System.out.println(appraise_content);
		
		if(!appraise_content.equals("")){
			String [] appraise_array = appraise_content.split(",");
			for(String m : appraise_array){
				String [] split_attr = m.split(":");			
				map.put("member_no", split_attr[0]);
				map.put("project_no", project_no);
				map.put("appraiser_member_no", appriaser_no);
				map.put("appraiser_code", split_attr[1]);
				map.put("performance_score", split_attr[2]);
				map.put("communication_score", split_attr[3]);
				map.put("detail", split_attr[4]);
				this.processDao.update_appraise(map);
			}
		}
		
		return "redirect:/mypage";
    }
	
	@RequestMapping(value = "/appraise_member_view", method = RequestMethod.GET)
	public String dispAppraiseList(@RequestParam(value="project_no") String project_no,
			Model model) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String user_no = this.memberDao.select_user_no(auth.getName());
			System.out.println(user_no);
			Map<String, String> map =  new HashMap<String, String>();
			map.put("project_no", project_no);
			map.put("member_no", user_no);
			List<RateVo> list = this.processDao.select_appraise(map);
			model.addAttribute("list",list);
			model.addAttribute("project_no",project_no);
		    return "appraise.member.view";
	    }
	
	
	@RequestMapping(value = "/appraise_member_list", method = RequestMethod.GET)
	public String dispAppraiseMemberList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
	    Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_no = this.memberDao.select_user_no(auth.getName());
		int user_no_i = Integer.parseInt(user_no);
		int pageSize = 10;		
		int pageGroupSize = 5;			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = this.projectDao.appraise_count(user_no);
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		map.put("member_no", user_no_i);
		List<ProjectRequestVo> list = this.projectDao.appraise_list(map);
		
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
		model.addAttribute("pageNum", pageNum);
		
	        return "appraise.list";
	    }
	
	
	
	@PreAuthorize("hasRole('ROLE_PM')") 
	@RequestMapping(value = "/history_member_add", method = RequestMethod.GET)
	    public String addHistoryMemberList(@RequestParam(value="project_no", defaultValue="1") String project_no, Model model) {
		List<MemberRoleVo> role_list = this.memberDao.select_role();
		List<MemberVo> list = this.memberDao.select_add_project_board(project_no);
		model.addAttribute("list",list);
		model.addAttribute("role_list", role_list);
		model.addAttribute("project_no", project_no);
	        return "history.project.member.add";
	    }
	@PreAuthorize("hasRole('ROLE_PM')")  
	@RequestMapping(value = "/history_project_end", method = RequestMethod.GET)
    public String endProject(@RequestParam(value="project_no") String project_no, RateVo rate_vo) {
			
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String mTime = mSimpleDateFormat.format ( currentTime );
		Map<String,String> map =  new HashMap<String, String>();
		map.put("project_no", project_no );
		map.put("current_time", mTime);
		map.put("status", "종료");
		this.projectDao.end_project(map);
		this.projectDao.end_project_date(map);
		this.projectDao.update_status(map);
		List<String> appraiser = projectDao.select_appraiser(project_no);
		String pm = projectDao.select_pm(project_no);
		rate_vo.setCommunication_score(0);
		rate_vo.setPerformance_score(0);
		rate_vo.setDetail("");
		
		for(String outer : appraiser){
			for(String inner : appraiser){
				if(outer.equals(inner)) continue;
				rate_vo.setAppraiser_code("101");
				rate_vo.setMember_no(outer);
				rate_vo.setAppraiser_member_no(inner);
				rate_vo.setProject_no(project_no);
				this.processDao.insert_default_rate(rate_vo);
			}
		}
		for(String inner : appraiser){
			rate_vo.setAppraiser_code("100");
			rate_vo.setAppraiser_member_no(pm);
			rate_vo.setMember_no(inner);
			rate_vo.setProject_no(project_no);
			this.processDao.insert_default_rate(rate_vo);
		}
		for(String inner : appraiser){
			rate_vo.setAppraiser_code("102");
			rate_vo.setAppraiser_member_no(pm);
			rate_vo.setMember_no(inner);
			rate_vo.setProject_no(project_no);
			this.processDao.insert_default_rate(rate_vo);
		}
		
		return "redirect:/mypage";
    }
	
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
		project_history.setProject_end_date("1111-11-11");
		project.setProject_end_date("1111-11-11");
		
	
		this.projectDao.insert_project(project);
		
		this.projectDao.insert_project_history(project_history);
		if(!add_list.equals("")){
			String [] project_member = add_list.split(",");
			for(String m : project_member){
				String [] split_attr = m.split(":");			
				project_history.setMember_no(split_attr[0]);
				project_history.setRole_no(split_attr[1]);
				this.projectDao.insert_project_history(project_history);
			}
		}
		Map<String,String> map =  new HashMap<String, String>();
		map.put("project_no", project_no );
		map.put("status", "진행중");        
		this.projectDao.update_status(map);
		return "redirect:/mypage";
    }
	
	@PreAuthorize("hasRole('ROLE_PM')")  
	@RequestMapping(value = "/history_add_project_member", method = RequestMethod.POST)
    public String addHistoryProjectMember(ProjectHistoryVo project_history, ProjectVo project,
    		
    		@RequestParam(value="add_list") String add_list,
    		@RequestParam(value="project_no") String project_no) {
				
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String mTime = mSimpleDateFormat.format ( currentTime );
		
		project_history.setProject_no(project_no);
		project_history.setProject_start_date(mTime);
		project_history.setProject_end_date("1111-11-11");
		if(!add_list.equals("")){
			String [] project_member = add_list.split(",");
			
			for(String m : project_member){
				String [] split_attr = m.split(":");			
				project_history.setMember_no(split_attr[0]);
				project_history.setRole_no(split_attr[1]);
				this.projectDao.insert_project_history(project_history);
			}
		}
		return "redirect:/history_project_view?no=" + project_no;
    }
	
	@RequestMapping(value = "/history_project_member_list", method = RequestMethod.GET)
	public String dispProjectMemberList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
	    @RequestParam(value="project_no", defaultValue="1") Integer project_no, Model model) {
		String project_no_s = Integer.toString(project_no);
		int pageSize = 10;		
		int pageGroupSize = 5;			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = this.projectDao.select_current_project_count(project_no_s);
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		map.put("project_no", project_no);
		List<ProjectHistoryVo> list = this.projectDao.select_current_project(map);
		
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
		model.addAttribute("project_no", project_no);
		model.addAttribute("pageNum", pageNum);
		
	        return "history.project.member.list";
	    }
	@RequestMapping(value = "/member_delete", method = RequestMethod.GET)
	public String deleProjMember(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
	    @RequestParam(value="project_no") String project_no,
	    @RequestParam(value="member_no") String member_no,
	    Model model) {
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
			Date currentTime = new Date ( );
			String mTime = mSimpleDateFormat.format ( currentTime );
			Map<String,String> map =  new HashMap<String, String>();
			map.put("project_no", project_no );
			map.put("member_no", member_no);
			map.put("current_time", mTime);
			this.projectDao.end_project_member(map);
			
	        return "redirect:/history_project_member_list?project_no=" + project_no;
	    }
	
	
	
	@RequestMapping(value = "/history_project_list", method = RequestMethod.GET)
    public String dispHistoryList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
    		Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_no_s = this.memberDao.select_user_no(auth.getName());		
		int user_no = Integer.parseInt(user_no_s);
		
		int pageSize = 10;		
		int pageGroupSize = 5;			
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
		int pageSize = 10;		
		int pageGroupSize = 5;			
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
        
        model.addAttribute("project_no", project_request_no);
        model.addAttribute("project", project);
        model.addAttribute("select", project_select);
        return "history.project.view";
    }
	

	@PreAuthorize("hasRole('ROLE_PM')") 
	@RequestMapping(value = "/make_project_list", method = RequestMethod.GET)
	    public String dispMemberList(@RequestParam(value="project_no") String project_no, Model model) {
		List<MemberRoleVo> role_list = this.memberDao.select_role();
		List<MemberVo> list = this.memberDao.select_make_project_board();
		model.addAttribute("list",list);
		model.addAttribute("role_list", role_list);
		model.addAttribute("project_no", project_no);
	        return "make.project.list";
	    }
	
}
