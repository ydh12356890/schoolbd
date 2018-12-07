package com.springmvc.dao;

import com.springmvc.entity.*;

import java.rmi.MarshalledObject;
import java.util.List;
import java.util.Map;

public interface UndergraduateMapper {
    int deleteByPrimaryKey(String studentid);

    int insert(Undergraduate record);

    int insertSelective(Undergraduate record);

    Undergraduate selectByPrimaryKey(String studentid);
    Undergraduate selectUndergraduateBaseInfo(String studentid);

    List<Undergraduate> selectAllXhByxh(String name);

    List<Undergraduate> selectstusByXhName(Map<String,Object> param);
    List<Undergraduate> selectstusByXhNameSize(Map<String,Object> param);


    int updateByPrimaryKeySelective(Undergraduate record);

    int updateByPrimaryKey(Undergraduate record);

    List<Undergraduate> selectScoreBystuNumberLimit(Map<String,Object> param);
    List<Undergraduate> selectScoreLimitSize(Map<String,Object> param);

    List<Undergraduate> selectGoodScoreStuLimit(Map<String,Object> param);
    List<Undergraduate> selectGoodScoreLimitSize(Map<String,Object> param);

    List<Undergraduate> selectSchoolAllStudent(Map<String,Object> param);
    List<Undergraduate> selectSchoolStudentSize(Map<String,Object> param);

    List<Undergraduate> selectFilterSchoolStu(Map<String,Object> param);
    List<Undergraduate> selectFilterSchoolStuSize(Map<String,Object> param);


    List<Undergraduate> selectStuFilterByXHName(Map<String,Object> param);
    List<Undergraduate> selectStuFilterByXHNameSize(Map<String,Object> param);

    List<Undergraduate> selectStuFilterByXHNameGood(Map<String,Object> param);
    List<Undergraduate> selectStuFilterByXHNameSizeGood(Map<String,Object> param);

    List<FourFail> selectFourFailByXymc(String xymc);

    List<MFRatio> selectMFRatioUgSingleSchool(String xymc);
}