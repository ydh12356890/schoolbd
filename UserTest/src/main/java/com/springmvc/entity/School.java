package com.springmvc.entity;

public class School {
    private String xydm;

    private Integer number;

    private String xymc;

    public String getXydm() {
        return xydm;
    }

    public void setXydm(String xydm) {
        this.xydm = xydm == null ? null : xydm.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getXymc() {
        return xymc;
    }

    public void setXymc(String xymc) {
        this.xymc = xymc == null ? null : xymc.trim();
    }
}