package com.design.db;

import java.util.List;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.design.db.dao.*;


@Controller(value = "viewController")
public class ViewController {
	private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
	
	@Resource(name = "memberDao")
	    private MemberDao memberDao;
	 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	    public String dispMemberList(Model model) {
	        logger.info("display view Member list");
	        List<MemberVo> list = this.memberDao.getSelect();
	        model.addAttribute("list", list);

	        logger.info("total count" + list.size() );

	        return "member.list";
	    } 
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String dispMemberSignup() {
        logger.info("display view Member Signup");
        return "member.signup";
    }
	@RequestMapping(value = "/signup_ok", method = RequestMethod.POST)
		public String procMemberSignup(@ModelAttribute("memberVo") MemberVo memberVo, RedirectAttributes redirectAttributes) {
			logger.info("Process... Member Signup!");
			memberVo.setMember_pos_code(3);
			this.memberDao.insert(memberVo);
			return "redirect:/";
		}

	
	
		
}
