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
@Table(name="dh_user")
public class User {

private Long id;
private String loginname;//用于pc登录名
private String name;//微信昵称
private String sex;//用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
private String province;//用户个人资料填写的省份
private String city	;//普通用户个人资料填写的城市
private String country;//	国家，如中国为CN
private String openid;//微信OpenId
private String password;
private String headpicurl;//用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。
private String privilege;//用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）
private String unionid;//只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
private String role;//0:普通用户 1：后台医生
private String isbinded="0";//0:未绑定 1：绑定
private Set<Post> posts=new TreeSet<Post>();//我发表的
private Set<Reply> replys=new TreeSet<Reply>();//我回复的
private String realname;//真实姓名
private String birthday;//生日
private String idcard;//证件号
private String phone;//电话
private String community;//社区
private String chicked;//0:未审核，1：已审核
@Id
@GeneratedValue
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}

public String getLoginname() {
	return loginname;
}
public void setLoginname(String loginname) {
	this.loginname = loginname;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getProvince() {
	return province;
}
public void setProvince(String province) {
	this.province = province;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getPrivilege() {
	return privilege;
}
public void setPrivilege(String privilege) {
	this.privilege = privilege;
}
public String getUnionid() {
	return unionid;
}
public void setUnionid(String unionid) {
	this.unionid = unionid;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

public String getOpenid() {
	return openid;
}
public void setOpenid(String openid) {
	this.openid = openid;
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

public String getIsbinded() {
	return isbinded;
}
public void setIsbinded(String isbinded) {
	this.isbinded = isbinded;
}
public String getRealname() {
	return realname;
}
public void setRealname(String realname) {
	this.realname = realname;
}
public String getBirthday() {
	return birthday;
}
public void setBirthday(String birthday) {
	this.birthday = birthday;
}
public String getIdcard() {
	return idcard;
}
public void setIdcard(String idcard) {
	this.idcard = idcard;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getCommunity() {
	return community;
}
public void setCommunity(String community) {
	this.community = community;
}
public String getChicked() {
	return chicked;
}
public void setChicked(String chicked) {
	this.chicked = chicked;
}

}
