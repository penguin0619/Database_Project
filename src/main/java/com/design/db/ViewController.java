package com.design.db;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.oxm.xstream.XStreamMarshaller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.design.db.dao.*;
import com.thoughtworks.xstream.XStream;

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

