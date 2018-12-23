package com.springmvc.entity;

/**
 * @Author: ydh
 * @Date: 2018/12/22 17:04
 * @Version: 1.0
 * @todo
 */
public class ConsumpOutlierThreeTag {
    private String xh;

    public String getAnormalvalue() {
        return anormalvalue;
    }

    public void setAnormalvalue(String anormalvalue) {
        this.anormalvalue = anormalvalue;
    }

    private String anormalvalue;

    private String week;

    private String year;

    private String anoindex;
    private String sumindex;
    private String staticindex;

    public String getAnoindex() {
        return anoindex;
    }

    public void setAnoindex(String anoindex) {
        this.anoindex = anoindex;
    }

    public String getSumindex() {
        return sumindex;
    }

    public void setSumindex(String sumindex) {
        this.sumindex = sumindex;
    }

    public String getStaticindex() {
        return staticindex;
    }

    public void setStaticindex(String staticindex) {
        this.staticindex = staticindex;
    }


    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh == null ? null : xh.trim();
    }



    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week == null ? null : week.trim();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }
}
