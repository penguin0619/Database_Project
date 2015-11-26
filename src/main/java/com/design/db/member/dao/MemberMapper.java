package com.design.db.member.dao;

import java.util.List;
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
}