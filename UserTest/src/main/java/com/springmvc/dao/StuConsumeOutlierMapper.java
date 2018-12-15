package com.springmvc.dao;

import com.springmvc.entity.StuConsumeOutlier;
import org.apache.ibatis.annotations.Param;

public interface StuConsumeOutlierMapper {
    int insert(StuConsumeOutlier record);

    StuConsumeOutlier selectByXhAndYear(@Param("xh")String xh, @Param("year")String year);

    int insertSelective(StuConsumeOutlier record);
}