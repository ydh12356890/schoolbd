package com.springmvc.dao;

import com.springmvc.entity.StuConsumeOutlier;
import com.springmvc.entity.WeekdayExp;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StuConsumeOutlierMapper {
    int insert(StuConsumeOutlier record);

    List <StuConsumeOutlier> selectByXhAndYear(@Param("xh")String xh, @Param("year")String year);

    int insertSelective(StuConsumeOutlier record);

    List<StuConsumeOutlier> selectOutlierWeekByXhAndYear(Map<String,Object> param);
    List<StuConsumeOutlier> selectOutlierWeekByXhAndYearSize(Map<String,Object> param);

    List<WeekdayExp> selectWeekdayConsumpByXhYearWeek(@Param("xh")String xh, @Param("year")String year,@Param("week")String week);
}