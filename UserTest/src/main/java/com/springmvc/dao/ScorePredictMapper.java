package com.springmvc.dao;

import com.springmvc.entity.ScorePredict;

import java.util.List;
import java.util.Map;

public interface ScorePredictMapper {
    int deleteByPrimaryKey(Integer spid);

    int insert(ScorePredict record);

    int insertSelective(ScorePredict record);

    ScorePredict selectByPrimaryKey(Integer spid);

    int updateByPrimaryKeySelective(ScorePredict record);

    int updateByPrimaryKey(ScorePredict record);

    List<ScorePredict> selectScorePredict(String stuNumber);
    List<ScorePredict> selectScoreBystuNumberLimit(Map<String,Object> param);
    List<ScorePredict> selectScoreLimitSize(Map<String,Object> param);
}