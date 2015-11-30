package com.design.db.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.design.db.member.dao.MemberDao;
import com.design.db.member.dao.MemberVo;



@Service
public class UserService implements UserDetailsService {
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Resource(name = "memberDao")
    private MemberDao memberDao;
    
    @Override
    public User loadUserByUsername(final String username) throws UsernameNotFoundException {

        logger.info("username : " + username);
        MemberVo memberVo = memberDao.selectid(username);
        // ȸ�� ���� dao ���� �����͸� �о� ��.
        System.out.println("sdfsdf");
        //��ȣȭ ����? �ұ� ����.... 
        String password = memberVo.getMember_password();
       
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        Role role = new Role();
        if(memberVo.getMember_pos_code() == 0){
        	role.setName("ROLE_EXECUTIVE");
        }else if (memberVo.getMember_pos_code() == 1){
        	role.setName("ROLE_PM");
        }else if (memberVo.getMember_pos_code() == 2){
        	role.setName("ROLE_SECRETARY");
        }else if (memberVo.getMember_pos_code() == 3){
        	role.setName("Role_NORMAL");
        }
        List<Role> roles = new ArrayList<Role>();
        roles.add(role);
        user.setAuthorities(roles);

        // ���� �����Ͱ� ���� ��� �ͼ���
        //if (user == null) throw new UsernameNotFoundException("������ ������ ã�� �� �����ϴ�.");

        return user;
    }
}
