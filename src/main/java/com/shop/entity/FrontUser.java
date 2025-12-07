package com.shop.entity;

import java.sql.Date;

public class FrontUser {
    private Integer id;
    private String username;
    private String password;
    private String realName;
    private String sex;
    private String address;
    private String question;
    private String answer;
    private String tel;
    private String favorate;
    private Integer score;
    private Date regDate;
    private Integer status;
    private Integer vip;

    // 无参构造
    public FrontUser() {
    }

    // 全参构造
    public FrontUser(Integer id, String username, String password, String realName,
                     String sex, String address, String question, String answer,
                     String tel, String favorate, Integer score, Date regDate, Integer status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.sex = sex;
        this.address = address;
        this.question = question;
        this.answer = answer;
        this.tel = tel;
        this.favorate = favorate;
        this.score = score;
        this.regDate = regDate;
        this.status = status;
    }

    // Getter 和 Setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getFavorate() {
        return favorate;
    }

    public void setFavorate(String favorate) {
        this.favorate = favorate;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
    public Integer getVip() {
        return vip;
    }

    public void setVip(Integer vip) {
        this.vip = vip;
    }

    @Override
    public String toString() {
        return "FrontUser{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", tel='" + tel + '\'' +
                ", score=" + score +
                ", regDate=" + regDate +
                ", status=" + status +
                '}';
    }
}