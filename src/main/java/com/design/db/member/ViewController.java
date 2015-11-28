package com.design.db.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.oxm.xstream.XStreamMarshaller;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.design.db.member.dao.*;
import com.thoughtworks.xstream.XStream;

@Controller(value = "viewController")
public class ViewController {
	private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
	
	@Resource(name = "memberDao")
	    private MemberDao memberDao;
	
	@PreAuthorize("hasRole('ROLE_EXECUTIVE')") 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	    public String dispMemberList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum, Model model) {
		int pageSize = 10;		
		int pageGroupSize = 5;
			
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = this.memberDao.select_count_member();
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		Map<String, Integer> map =  new HashMap<String, Integer>();
		map.put("offset1", startRow);
		map.put("offset2", pageSize);
		List<MemberVo> list = this.memberDao.select_member_board(map);
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
	        return "member.list";
	    }
	@RequestMapping("/member.view")
    public String dispMemberView(@RequestParam(value="no", defaultValue="0") int member_no, Model model) {
        MemberVo member = this.memberDao.selectno(member_no);
        List<MemberBeforeVo> career = this.memberDao.select_career(member_no);
        
        if(member.getMember_skillset() == null){
        	member.setMember_skillset("없음");
        }
        model.addAttribute("career", career);
        model.addAttribute("member", member);
        System.out.println(career.size());
        return "member.view";
    }
	
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String dispMemberSignup() {
        logger.info("display view Member Signup");
        return "member.signup";
    }
	
	@RequestMapping(value = "/signup_ok", method = RequestMethod.POST)
		public String procMemberSignup(@ModelAttribute("memberVo") MemberVo memberVo,
				@ModelAttribute("memberBeforeVo") MemberBeforeVo memberBeforeVo,
				RedirectAttributes redirectAttributes,
				@RequestParam(value = "career_content", required = true) String career_content){
			
			memberVo.setMember_pos_code(3);
			this.memberDao.insert(memberVo);
			this.memberDao.insert_skillset(memberVo);
			
			if(career_content !=""){
			String [] career = career_content.split("\n");
				memberBeforeVo.setMember_no(memberVo.getMember_no());
				for(String cr : career){
					memberBeforeVo.setsplit(cr);
					this.memberDao.insert_career(memberBeforeVo);
				}
			}
			return "redirect:/mypage";
		}
	
	@Resource(name = "xstreamMarshaller")
    private XStreamMarshaller xstreamMarshaller;

    @Resource(name = "xmlView")
    private View xmlView;

	
	@RequestMapping(value = "/DupCheck", method = RequestMethod.POST)
	public View procDupCheck(@RequestParam(value = "member_id", required = true) String member_id, Model model) {
		MemberVo object = this.memberDao.getDupcheck(member_id);
		logger.info(member_id);
		XStream xst = xstreamMarshaller.getXStream();
		xst.alias("result", XmlResult.class);
		XmlResult xml = new XmlResult();
	   
		if(object==null){
			xml.setMessage("아이디가 중복되지 않습니다.");
	    	xml.setError(false);			
	    }else{
	    	xml.setMessage("중복된 아이디가 있습니다.");
	    	xml.setError(true);
	    }
	   
	    model.addAttribute("xmlData", xml);
	    return xmlView;
	    
	}
}
class XmlResult {

    private String message;
    private boolean error = false;

    public void setMessage(String message) {
        this.message = message;
    }
    public String getMessage() {
        return this.message;
    }

    public void setError(boolean error) {
        this.error = error;
    }
    public boolean getError() {
        return this.error;
    }
}

