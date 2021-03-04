package com.Eanvan.model;

public class User {
    private Integer uid;

    //系统权限
    private Integer root;

    //系统属性
    private String email;
    private String password;
    private Integer actived;
    private String activateCode;
    private String joinTime;

    //用户属性
    private String username;
    private String description;
    private String headUrl;
    private String position;
    private String school;
    private String job;
    private String nickname;
    private String gender;
    private String birthday;
    private String introduction;


    /*个人标签项暂时还未添加*/

    //附加属性
    private Integer postCount;
    private Integer scanCount;
    private Integer likeCount;
    private Integer followCount;
    private Integer followerCount;


    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getRoot() {
        return root;
    }

    public void setRoot(Integer root) {
        this.root = root;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getActived() {
        return actived;
    }

    public void setActived(Integer actived) {
        this.actived = actived;
    }

    public String getActivateCode() {
        return activateCode;
    }

    public void setActivateCode(String activateCode) {
        this.activateCode = activateCode;
    }

    public String getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(String joinTime) {
        this.joinTime = joinTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Integer getPostCount() {
        return postCount;
    }

    public void setPostCount(Integer postCount) {
        this.postCount = postCount;
    }

    public Integer getScanCount() {
        return scanCount;
    }

    public void setScanCount(Integer scanCount) {
        this.scanCount = scanCount;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public Integer getFollowCount() {
        return followCount;
    }

    public void setFollowCount(Integer followCount) {
        this.followCount = followCount;
    }

    public Integer getFollowerCount() {
        return followerCount;
    }

    public void setFollowerCount(Integer followerCount) {
        this.followerCount = followerCount;
    }

    public User(Integer uid) {
        this.uid = uid;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", root=" + root +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", actived=" + actived +
                ", activateCode='" + activateCode + '\'' +
                ", joinTime='" + joinTime + '\'' +
                ", username='" + username + '\'' +
                ", description='" + description + '\'' +
                ", headUrl='" + headUrl + '\'' +
                ", position='" + position + '\'' +
                ", school='" + school + '\'' +
                ", job='" + job + '\'' +
                ", nickname='" + nickname + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday='" + birthday + '\'' +
                ", introduction='" + introduction + '\'' +
                ", postCount=" + postCount +
                ", scanCount=" + scanCount +
                ", likeCount=" + likeCount +
                ", followCount=" + followCount +
                ", followerCount=" + followerCount +
                '}';
    }
}
