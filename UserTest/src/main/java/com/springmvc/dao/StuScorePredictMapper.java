package com.springmvc.dao;

import com.springmvc.entity.FailCourse;
import com.springmvc.entity.StuScorePredict;
import com.springmvc.entity.Undergraduate;

import java.util.List;
import java.util.Map;

public interface StuScorePredictMapper {
    int deleteByPrimaryKey(Integer idscorePredict);

    int insert(StuScorePredict record);

    int insertSelective(StuScorePredict record);

    StuScorePredict selectByPrimaryKey(Integer idscorePredict);

    int updateByPrimaryKeySelective(StuScorePredict record);

    int updateByPrimaryKey(StuScorePredict record);

    List<StuScorePredict> selectCourseScoreBystudentidLimit(Map<String,Object> param);
    List<StuScorePredict> selectCourseScoreLimitSize(Map<String,Object> param);

    List<StuScorePredict> selectGoodCourseScoreBystudentidLimit(Map<String,Object> param);
    List<StuScorePredict> selectGoodCourseScoreLimitSize(Map<String,Object> param);

    List<StuScorePredict> selectTwoScoreByXh(String xh);

    List<FailCourse> selectFailCourseByxymc(Map<String,Object> param);
    List<FailCourse> selectFailCourseByxymcSize(Map<String,Object> param);

    List<FailCourse> selectAllFailCourseByXymc(String xymc);

    List<FailCourse> selectSchoolAllCourseByXymc(Map<String,Object> param);
    List<FailCourse> selectSchoolAllCourseByXymcSize(Map<String,Object> param);



}