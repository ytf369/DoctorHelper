package com.doctorhelper.entity;

import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(catalog="doctorhelperdb", name="dh_user")
public class User {

private Long id;
private String name;//昵称
private String webchartname;//微信名
private String password;
private String headpicurl;
private String role;
private Set<Post> posts=new TreeSet<Post>();//我发表的
private Set<Reply> replys=new TreeSet<Reply>();//我回复的
@Id
@GeneratedValue
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getWebchartname() {
	return webchartname;
}
public void setWebchartname(String webchartname) {
	this.webchartname = webchartname;
}
public String getHeadpicurl() {
	return headpicurl;
}
public void setHeadpicurl(String headpicurl) {
	this.headpicurl = headpicurl;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch =FetchType.LAZY, targetEntity = Post.class) 
public Set<Post> getPosts() {
	return posts;
}
public void setPosts(Set<Post> posts) {
	this.posts = posts;
}
@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch =FetchType.LAZY, targetEntity = Reply.class) 
public Set<Reply> getReplys() {
	return replys;
}
public void setReplys(Set<Reply> replys) {
	this.replys = replys;
}

}
