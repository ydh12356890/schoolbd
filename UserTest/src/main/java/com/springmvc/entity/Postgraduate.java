package com.springmvc.entity;

public class Postgraduate {
    private String xh;

    private String xm;

    private String xbdm;

    private String csrq;

    private String byyx;

    private String byzydm;

    private String rxzydm;

    private String zzmmdm;

    private StuConsumeOutlier stuConsumeOutlier;

    public StuConsumeOutlier getStuConsumeOutlier() {
        return stuConsumeOutlier;
    }

    public void setStuConsumeOutlier(StuConsumeOutlier stuConsumeOutlier) {
        this.stuConsumeOutlier = stuConsumeOutlier;
    }



    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh == null ? null : xh.trim();
    }

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm == null ? null : xm.trim();
    }

    public String getXbdm() {
        return xbdm;
    }

    public void setXbdm(String xbdm) {
        this.xbdm = xbdm == null ? null : xbdm.trim();
    }

    public String getCsrq() {
        return csrq;
    }

    public void setCsrq(String csrq) {
        this.csrq = csrq == null ? null : csrq.trim();
    }

    public String getByyx() {
        return byyx;
    }

    public void setByyx(String byyx) {
        this.byyx = byyx == null ? null : byyx.trim();
    }

    public String getByzydm() {
        return byzydm;
    }

    public void setByzydm(String byzydm) {
        this.byzydm = byzydm == null ? null : byzydm.trim();
    }

    public String getRxzydm() {
        return rxzydm;
    }

    public void setRxzydm(String rxzydm) {
        this.rxzydm = rxzydm == null ? null : rxzydm.trim();
    }

    public String getZzmmdm() {
        return zzmmdm;
    }

    public void setZzmmdm(String zzmmdm) {
        this.zzmmdm = zzmmdm == null ? null : zzmmdm.trim();
    }
}