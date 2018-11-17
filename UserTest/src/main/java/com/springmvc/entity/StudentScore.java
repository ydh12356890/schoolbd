package com.springmvc.entity;

public class StudentScore {
    private Integer csid;

    private String stuNumber;

    private Integer zeroFiftynine;

    private Integer sixtySixtynine;

    private Integer seventySeventynine;

    private Integer eightyEightynine;

    private Integer ninetyHundred;

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(String stuNumber) {
        this.stuNumber = stuNumber == null ? null : stuNumber.trim();
    }

    public Integer getZeroFiftynine() {
        return zeroFiftynine;
    }

    public void setZeroFiftynine(Integer zeroFiftynine) {
        this.zeroFiftynine = zeroFiftynine;
    }

    public Integer getSixtySixtynine() {
        return sixtySixtynine;
    }

    public void setSixtySixtynine(Integer sixtySixtynine) {
        this.sixtySixtynine = sixtySixtynine;
    }

    public Integer getSeventySeventynine() {
        return seventySeventynine;
    }

    public void setSeventySeventynine(Integer seventySeventynine) {
        this.seventySeventynine = seventySeventynine;
    }

    public Integer getEightyEightynine() {
        return eightyEightynine;
    }

    public void setEightyEightynine(Integer eightyEightynine) {
        this.eightyEightynine = eightyEightynine;
    }

    public Integer getNinetyHundred() {
        return ninetyHundred;
    }

    public void setNinetyHundred(Integer ninetyHundred) {
        this.ninetyHundred = ninetyHundred;
    }
}