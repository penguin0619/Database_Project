package com.design.db.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository(value = "memberMapper")
public interface MemberMapper {
    List<MemberVo> select();
    void insert(MemberVo memberVo);
    void insert_skillset(MemberVo memberVo);
    MemberVo dupcheck(String member_id);
    void insert_career(MemberBeforeVo memberBeforeVo);
    MemberVo select_id(String member_id);
    MemberVo select_no(Integer member_no);
    List<MemberBeforeVo> select_career(Integer member_no);
    String select_count_positions(String member_pos_code);
    String select_user_no(String user_id);
    String select_what_position(String user_id);
    String select_user_name(String member_no);
    int select_count_member();
    int select_count_project_member();
    int select_count_add_member(String project_no);
    List<MemberVo> select_member_board(Map<String,Integer> map);
    List<MemberVo> select_make_project_board();
    List<MemberVo> select_add_project_board(String project_no);
    List<MemberRoleVo> select_role();
    List<MemberVo> select_position_board(Map<String,Integer> map);
   }