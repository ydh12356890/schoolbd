package com.springmvc.dao;

import com.springmvc.entity.MFRatio;
import com.springmvc.entity.PackStuScorePre;
import com.springmvc.entity.StuScorePredict;
import com.springmvc.entity.Undergraduate;

import java.util.List;
import java.util.Map;

public interface UndergraduateMapper {
    int deleteByPrimaryKey(String studentid);

    int insert(Undergraduate record);

    int insertSelective(Undergraduate record);

    Undergraduate selectByPrimaryKey(String studentid);
    Undergraduate selectUndergraduateBaseInfo(String studentid);

    List<Undergraduate> selectAllXhByxh(String name);


    int updateByPrimaryKeySelective(Undergraduate record);

    int updateByPrimaryKey(Undergraduate record);

    List<Undergraduate> selectScoreBystuNumberLimit(Map<String,Object> param);
    List<Undergraduate> selectScoreLimitSize(Map<String,Object> param);

    List<Undergraduate> selectGoodScoreStuLimit(Map<String,Object> param);
    List<Undergraduate> selectGoodScoreLimitSize(Map<String,Object> param);

    List<Undergraduate> selectSchoolAllStudent(Map<String,Object> param);
    List<Undergraduate> selectSchoolStudentSize(Map<String,Object> param);

    List<MFRatio> selectMFRatioUgSingleSchool(String xymc);
}