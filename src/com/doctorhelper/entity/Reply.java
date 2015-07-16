package com.doctorhelper.entity;

import java.util.Collections;
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
import javax.persistence.OrderBy;
import javax.persistence.Table;
@Entity
@Table(catalog="doctorhelperdb", name="dh_reply")
public class Reply implements Comparable<Reply>{
private Long id;
private User user;
private Post post;//回复的主题
private Reply parentreply;//回复父id
private Set<Reply> replyset=new TreeSet<Reply>();//对该回复的回复
private String content;
private Date createtime;
private int goodcount=0;
private int badcount=0;
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
@ManyToOne(targetEntity=Post.class)
@JoinColumn(name ="post_id")   
public Post getPost() {
	return post;
}
public void setPost(Post post) {
	this.post = post;
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
@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "reply_pid")
public Reply getParentreply() {
	return parentreply;
}
public void setParentreply(Reply parentreply) {
	this.parentreply = parentreply;
}
@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "parentreply")
@OrderBy("createtime ASC")
public Set<Reply> getReplyset() {
	return replyset;
}
public void setReplyset(Set<Reply> replyset) {
	this.replyset = replyset;
}
//排序
@Override
public int compareTo(Reply o) {
	 if(!(o instanceof Reply))  
          throw new RuntimeException("This is not a instance of Class \"Reply\" ");  
       
	 Reply re  =(Reply)o;  
      if(this.id >re.getId())  
          return -1;  
      else if(this.id ==re.getId())  
          return 0;  
      return 1;  
}

}
