package com.springmvc.entity;

public class StuScorePredict {
    private Integer idscorePredict;

    private String xh;

    private String kcdm;

    private String zscj;

    private String yccj;
    private Course course;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }



    public Integer getIdscorePredict() {
        return idscorePredict;
    }

    public void setIdscorePredict(Integer idscorePredict) {
        this.idscorePredict = idscorePredict;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh == null ? null : xh.trim();
    }

    public String getKcdm() {
        return kcdm;
    }

    public void setKcdm(String kcdm) {
        this.kcdm = kcdm == null ? null : kcdm.trim();
    }

    public String getZscj() {
        return zscj;
    }

    public void setZscj(String zscj) {
        this.zscj = zscj == null ? null : zscj.trim();
    }

    public String getYccj() {
        return yccj;
    }

    public void setYccj(String yccj) {
        this.yccj = yccj == null ? null : yccj.trim();
    }
}