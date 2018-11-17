package com.springmvc.entity;

import java.math.BigDecimal;

public class Student {
    private String stuNumber;

    private String stuName;

    private String stuSex;

    private Integer stuAge;

    private String stuNation;

    private String stuPolitics;

    private String stuSchool;

    private String stuMajor;

    private BigDecimal stuScore1;

    private String stuSubject1;

    private String stuTeacher;

    private String stuSubject2;

    private BigDecimal stuScore2;

    private String stuSubject3;

    private BigDecimal stuScore3;

    private String stuSubject4;

    private BigDecimal stuScore4;

    private String stuSubject5;

    private BigDecimal stuScore5;

    public String getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(String stuNumber) {
        this.stuNumber = stuNumber == null ? null : stuNumber.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex == null ? null : stuSex.trim();
    }

    public Integer getStuAge() {
        return stuAge;
    }

    public void setStuAge(Integer stuAge) {
        this.stuAge = stuAge;
    }

    public String getStuNation() {
        return stuNation;
    }

    public void setStuNation(String stuNation) {
        this.stuNation = stuNation == null ? null : stuNation.trim();
    }

    public String getStuPolitics() {
        return stuPolitics;
    }

    public void setStuPolitics(String stuPolitics) {
        this.stuPolitics = stuPolitics == null ? null : stuPolitics.trim();
    }

    public String getStuSchool() {
        return stuSchool;
    }

    public void setStuSchool(String stuSchool) {
        this.stuSchool = stuSchool == null ? null : stuSchool.trim();
    }

    public String getStuMajor() {
        return stuMajor;
    }

    public void setStuMajor(String stuMajor) {
        this.stuMajor = stuMajor == null ? null : stuMajor.trim();
    }

    public BigDecimal getStuScore1() {
        return stuScore1;
    }

    public void setStuScore1(BigDecimal stuScore1) {
        this.stuScore1 = stuScore1;
    }

    public String getStuSubject1() {
        return stuSubject1;
    }

    public void setStuSubject1(String stuSubject1) {
        this.stuSubject1 = stuSubject1 == null ? null : stuSubject1.trim();
    }

    public String getStuTeacher() {
        return stuTeacher;
    }

    public void setStuTeacher(String stuTeacher) {
        this.stuTeacher = stuTeacher == null ? null : stuTeacher.trim();
    }

    public String getStuSubject2() {
        return stuSubject2;
    }

    public void setStuSubject2(String stuSubject2) {
        this.stuSubject2 = stuSubject2 == null ? null : stuSubject2.trim();
    }

    public BigDecimal getStuScore2() {
        return stuScore2;
    }

    public void setStuScore2(BigDecimal stuScore2) {
        this.stuScore2 = stuScore2;
    }

    public String getStuSubject3() {
        return stuSubject3;
    }

    public void setStuSubject3(String stuSubject3) {
        this.stuSubject3 = stuSubject3 == null ? null : stuSubject3.trim();
    }

    public BigDecimal getStuScore3() {
        return stuScore3;
    }

    public void setStuScore3(BigDecimal stuScore3) {
        this.stuScore3 = stuScore3;
    }

    public String getStuSubject4() {
        return stuSubject4;
    }

    public void setStuSubject4(String stuSubject4) {
        this.stuSubject4 = stuSubject4 == null ? null : stuSubject4.trim();
    }

    public BigDecimal getStuScore4() {
        return stuScore4;
    }

    public void setStuScore4(BigDecimal stuScore4) {
        this.stuScore4 = stuScore4;
    }

    public String getStuSubject5() {
        return stuSubject5;
    }

    public void setStuSubject5(String stuSubject5) {
        this.stuSubject5 = stuSubject5 == null ? null : stuSubject5.trim();
    }

    public BigDecimal getStuScore5() {
        return stuScore5;
    }

    public void setStuScore5(BigDecimal stuScore5) {
        this.stuScore5 = stuScore5;
    }
}