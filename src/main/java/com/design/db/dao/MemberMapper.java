package com.design.db.dao;

import java.util.List;
import org.springframework.stereotype.Repository;


@Repository(value = "memberMapper")
public interface MemberMapper {
    List<MemberVo> select();
    void insert(MemberVo memberVo);
    MemberVo dupcheck(String member_id);
}