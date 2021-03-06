package com.springmvc.service.impl;

import com.springmvc.dao.*;
import com.springmvc.entity.*;
import com.springmvc.service.interf.IStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:18
 * @Version: 1.0
 * @todo
 */
@Service("stuService")
public class StudentServiceImpl implements IStudentService {
    @Resource
    NStudentMapper nStudentMapper;
    @Resource
    PostgraduateMapper postgraduateMapper;
    @Resource
    UndergraduateMapper undergraduateMapper;
    @Resource
    SchoolMapper schoolMapper;

    @Resource
    StuScorePredictMapper stuScorePredictMapper;

    @Resource
    StuConsumeOutlierMapper stuConsumeOutlierMapper;

    @Override
    public List<School> getSchoolNameService(String xymc) {
        return schoolMapper.selectSchoolName(xymc);
    }

    @Override
    public List<StuScorePredict> getTwoScoreservice(String xh) {
        return stuScorePredictMapper.selectTwoScoreByXh(xh);
    }

    @Override
    public Undergraduate getUndergraduateInfo(String studentid) {
        return  undergraduateMapper.selectUndergraduateBaseInfo(studentid);
    }

    @Override
    public List<Undergraduate> getAllXhByxhService(String name) {
        return undergraduateMapper.selectAllXhByxh(name);
    }

    @Override
    public Postgraduate getPostgraduateInfo(String xh) {
        return postgraduateMapper.selectByPrimaryKey(xh);
    }

    @Override
    public List<WeekConsump> getStuConsumpInfo(String xh) {
        return  stuConsumeOutlierMapper.selectWeekConsumpByXh(xh);
    }

    @Override
    public List<ConsumpOutlierThreeTag> getStuConsumeOutlierService(String xh, String year) {
       List< ConsumpOutlierThreeTag> stuConsumeOutlierList = stuConsumeOutlierMapper.selectByXhAndYear(xh,year);
        return stuConsumeOutlierList;
    }

    @Override
    public Map<String,Object> getOutlierWeekService( Map<String,Object> param) {
        Map<String,Object> result = new HashMap<String,Object>();
        int total=stuConsumeOutlierMapper.selectOutlierWeekByXhAndYearSize(param).size();
        List<StuConsumeOutlier> rows=stuConsumeOutlierMapper.selectOutlierWeekByXhAndYear(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public List<School> getpersonNumAllSchoolService() {
        return schoolMapper.selectPersonNumUgAllSchool();
    }

    @Override
    public List<MFRatio> getMFRatioSingleSchoolService(String xymc) {
        List<MFRatio> mfRatioList = undergraduateMapper.selectMFRatioUgSingleSchool(xymc);
        return mfRatioList;
    }

    @Override
    public List<FailCourse> getAllFailCourseService(String xymc) {
        return stuScorePredictMapper.selectAllFailCourseByXymc(xymc);
    }

    @Override
    public List<WeekdayExp> getWeekdayConsumpService(String xh, String year, String week) {
        return stuConsumeOutlierMapper.selectWeekdayConsumpByXhYearWeek(xh,year,week);
    }
    @Override
    public Map<String, Object> getScoreLimitTable(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=undergraduateMapper.selectScoreLimitSize(param).size();
        List<Undergraduate> rows=undergraduateMapper.selectScoreBystuNumberLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getCourseScoreLimit(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=stuScorePredictMapper.selectCourseScoreLimitSize(param).size();
        List<StuScorePredict> rows=stuScorePredictMapper.selectCourseScoreBystudentidLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getGoodScoreStuLimitTable(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=undergraduateMapper.selectGoodScoreLimitSize(param).size();
        List<Undergraduate> rows=undergraduateMapper.selectGoodScoreStuLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getGoodCourseScoreLimit(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=stuScorePredictMapper.selectGoodCourseScoreLimitSize(param).size();
        List<StuScorePredict> rows=stuScorePredictMapper.selectGoodCourseScoreBystudentidLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
}

    @Override
    public Map<String, Object> getAllSchoolStudentService(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String,Object>();
        int total=undergraduateMapper.selectSchoolStudentSize(param).size();
        List<Undergraduate> rows=undergraduateMapper.selectSchoolAllStudent(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getAllSchoolStudentFilterService(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String,Object>();
        int total=undergraduateMapper.selectFilterSchoolStuSize(param).size();
        List<Undergraduate> rows=undergraduateMapper.selectFilterSchoolStu(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getstusByXHNameService(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String, Object>();
        int total = undergraduateMapper.selectstusByXhNameSize(param).size();
        List<Undergraduate> rows = undergraduateMapper.selectstusByXhName(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;

    }

    @Override
    public Map<String, Object> getPgStusByXHNameService(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String, Object>();
        int total = postgraduateMapper.selectPgstusByXhNameSize (param).size();
        List<Postgraduate> rows = postgraduateMapper.selectPgstusByXhName(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getStuFilterByXhName(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String, Object>();
        int total = undergraduateMapper.selectStuFilterByXHNameSize(param).size();
        List<Undergraduate> rows = undergraduateMapper.selectStuFilterByXHName(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getStuFilterByXhNameGood(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String, Object>();
        int total = undergraduateMapper.selectStuFilterByXHNameSizeGood(param).size();
        List<Undergraduate> rows = undergraduateMapper.selectStuFilterByXHNameGood(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getPgCCOService(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String, Object>();
        int total = postgraduateMapper.selectPgByXhNameYearSize(param).size();
        List<Postgraduate> rows = postgraduateMapper.selectPgByXhNameYear(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getFailCourseService(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String, Object>();
        int total = stuScorePredictMapper.selectFailCourseByxymcSize(param).size();
        List<FailCourse> rows = stuScorePredictMapper.selectFailCourseByxymc(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getSchoolAllCourseService(Map<String, Object> param) {
        Map<String,Object> result = new HashMap<String, Object>();
        int total = stuScorePredictMapper.selectSchoolAllCourseByXymcSize(param).size();
        List<FailCourse> rows = stuScorePredictMapper.selectSchoolAllCourseByXymc(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }



   /* @Override
    public List<Student> getStudentList() {
        List<Student> studentList = studentMapper.selectStuScore();
        return studentList;
    }*/

}
