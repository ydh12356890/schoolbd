package com.springmvc.entity;

import java.math.BigDecimal;

/**
 * @Author: ydh
 * @Date: 2018/12/10 19:59
 * @Version: 1.0
 * @todo
 */
public class FailCourse {
    private String kcdm;
    private String kcmc;
    private Integer failnum;
    private Integer allnum;

    public Integer getPassnum() {
        return passnum;
    }

    public void setPassnum(Integer passnum) {
        this.passnum = passnum;
    }

    private Integer passnum;
    private BigDecimal failrate;

    public String getKcdm() {
        return kcdm;
    }

    public void setKcdm(String kcdm) {
        this.kcdm = kcdm;
    }

    public String getKcmc() {
        return kcmc;
    }

    public void setKcmc(String kcmc) {
        this.kcmc = kcmc;
    }

    public Integer getFailnum() {
        return failnum;
    }

    public void setFailnum(Integer failnum) {
        this.failnum = failnum;
    }

    public Integer getAllnum() {
        return allnum;
    }

    public void setAllnum(Integer allnum) {
        this.allnum = allnum;
    }

    public BigDecimal getFailrate() {
        return failrate;
    }

    public void setFailrate(BigDecimal failrate) {
        this.failrate = failrate;
    }


}
