package com.springmvc.entity;

public class StuConsumeOutlier {
    private String xh;

    private String anormalValue;

    private String week;

    private String year;

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh == null ? null : xh.trim();
    }

    public String getAnormalValue() {
        return anormalValue;
    }

    public void setAnormalValue(String anormalValue) {
        this.anormalValue = anormalValue == null ? null : anormalValue.trim();
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