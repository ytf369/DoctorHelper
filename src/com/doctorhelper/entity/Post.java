package com.doctorhelper.entity;

import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(catalog="doctorhelperdb", name="dh_post")
public class Post implements Comparable<Post>{
private Long id;
private User user;
private String title;
private String content;
private Date createtime;
private Date updatetime;
private String ispublic; //是否公开
private int goodcount;
private int badcount;
private String islocked;//是否被锁定
private String isend;//是否结贴
private Set<Reply> replys=new TreeSet<Reply>();
@Id
@GeneratedValue
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
@ManyToOne(targetEntity=User.class)
@JoinColumn(name ="user_id")   
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getCreatetime() {
	return createtime;
}
public void setCreatetime(Date createtime) {
	this.createtime = createtime;
}
public Date getUpdatetime() {
	return updatetime;
}
public void setUpdatetime(Date updatetime) {
	this.updatetime = updatetime;
}
public String getIspublic() {
	return ispublic;
}
public void setIspublic(String ispublic) {
	this.ispublic = ispublic;
}
public int getGoodcount() {
	return goodcount;
}
public void setGoodcount(int goodcount) {
	this.goodcount = goodcount;
}
public int getBadcount() {
	return badcount;
}
public void setBadcount(int badcount) {
	this.badcount = badcount;
}
public String getIslocked() {
	return islocked;
}
public void setIslocked(String islocked) {
	this.islocked = islocked;
}
public String getIsend() {
	return isend;
}
public void setIsend(String isend) {
	this.isend = isend;
}
@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, fetch =FetchType.LAZY, targetEntity = Reply.class) 
public Set<Reply> getReplys() {
	return replys;
}
public void setReplys(Set<Reply> replys) {
	this.replys = replys;
}
//排序
@Override
public int compareTo(Post o) {
	 if(!(o instanceof Post))  
            throw new RuntimeException("This is not a instance of Class \"Post\" ");  
         
	 Post po  =(Post)o;  
        if(this.id >po.getId())  
            return 1;  
        else if(this.id ==po.getId())  
            return 0;  
        return -1;  
}
}
