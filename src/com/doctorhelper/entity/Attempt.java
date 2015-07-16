package com.doctorhelper.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 附件类
 * @author HP
 *
 */
@Entity
@Table(catalog="doctorhelperdb", name="dh_attempt")
public class Attempt {
private Long id;
private String filename;
private String fileurl;
private String filesavePath;
@Id
@GeneratedValue
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public String getFileurl() {
	return fileurl;
}
public void setFileurl(String fileurl) {
	this.fileurl = fileurl;
}
public String getFilesavePath() {
	return filesavePath;
}
public void setFilesavePath(String filesavePath) {
	this.filesavePath = filesavePath;
}

}
