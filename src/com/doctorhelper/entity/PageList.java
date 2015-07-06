package com.doctorhelper.entity;

import java.util.List;

/**
 * 分页实体类
 * @author HP
 *
 */
public class PageList {
private List list;
private long rows;
public List getList() {
	return list;
}
public void setList(List list) {
	this.list = list;
}
public long getRows() {
	return rows;
}
public void setRows(long rows) {
	this.rows = rows;
}

}
