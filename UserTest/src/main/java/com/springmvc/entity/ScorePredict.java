package com.springmvc.entity;

public class ScorePredict {
    private Integer spid;

    private String stuNumber;

    private String courseId;

    private String courseName;

    private Integer scorePredict;

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    public String getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(String stuNumber) {
        this.stuNumber = stuNumber == null ? null : stuNumber.trim();
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId == null ? null : courseId.trim();
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    public Integer getScorePredict() {
        return scorePredict;
    }

    public void setScorePredict(Integer scorePredict) {
        this.scorePredict = scorePredict;
    }
}