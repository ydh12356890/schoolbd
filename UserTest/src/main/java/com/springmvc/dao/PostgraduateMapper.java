package com.springmvc.dao;

import com.springmvc.entity.Postgraduate;

import java.util.List;
import java.util.Map;

public interface PostgraduateMapper {
    int deleteByPrimaryKey(String xh);

    int insert(Postgraduate record);

    int insertSelective(Postgraduate record);

    Postgraduate selectByPrimaryKey(String xh);

    int updateByPrimaryKeySelective(Postgraduate record);

    int updateByPrimaryKey(Postgraduate record);

    List<Postgraduate> selectPgstusByXhName(Map<String,Object> param);
    List<Postgraduate> selectPgstusByXhNameSize(Map<String,Object> param);

    List<Postgraduate> selectPgByXhNameYear (Map<String,Object> param);
    List<Postgraduate> selectPgByXhNameYearSize (Map<String,Object> param);
}