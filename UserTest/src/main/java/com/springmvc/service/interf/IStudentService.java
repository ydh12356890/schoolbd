package com.springmvc.service.interf;

import com.springmvc.entity.*;

import java.util.List;
import java.util.Map;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:17
 * @Version: 1.0
 * @todo
 */
public interface IStudentService {

    Undergraduate getUndergraduateInfo(String studentid);

    List <Undergraduate>  getAllXhByxhService(String name);

    Postgraduate getPostgraduateInfo(String xh);
    NStudent getStuConsumpInfo(String xh);
    Student getStudentInfo(String stunumber);
    //List<Student> getStudentList();
    StudentScore getStuScoreDisService(String stuNumber);

    Map<String,Object> getScoreLimitTable (Map<String,Object> param);

    Map<String,Object> getCourseScoreLimit(Map<String,Object> param);

    Map<String,Object> getGoodScoreStuLimitTable (Map<String,Object> param);

    Map<String,Object> getGoodCourseScoreLimit(Map<String,Object> param);

    Map<String,Object> getAllSchoolStudentService(Map<String,Object> param);

    Map<String,Object> getAllSchoolStudentFilterService(Map<String,Object> param);

    Map<String,Object> getstusByXHNameService(Map<String,Object> param);

    Map<String,Object> getPgStusByXHNameService(Map<String,Object> param);

    Map<String,Object> getStuFilterByXhName(Map<String,Object> param);

    Map<String,Object> getStuFilterByXhNameGood(Map<String,Object> param);

    Map<String,Object> getPgCCOService(Map<String,Object> param);


    List<School> getSchoolNameService(String xymc);

    List<StuScorePredict> getTwoScoreservice(String xh);

    StuConsumeOutlier getStuConsumeOutlierService(String xh,String year);

    List<School> getpersonNumAllSchoolService();

    List<MFRatio> getMFRatioSingleSchoolService(String schoolid);

    List<FourFail> getFourFailByXymcService(String xymc);
}
