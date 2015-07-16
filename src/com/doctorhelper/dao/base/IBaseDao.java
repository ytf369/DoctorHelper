package com.doctorhelper.dao.base;

import java.util.List;

import org.hibernate.Session;

import com.doctorhelper.entity.User;

public interface IBaseDao<T> {
  Session getSession();
  T findById(Class<T> clazz, Long id);
  void save(T t);
  void update(T t);
  void delete(T t);
  List<T> queryAlllist(Class<T> clazz);
  List<T> querylist(String hql);
  List<T> querylistWithPage(String hql,int pagenum,int size);
  void saveorupdate(T t);
  Long querylistCount(String hql);
  Long querylistSqlCount(String sql);
  List<T> querylistNativeSql(String sql,Class<T> clazz);
  List<T> querylistNativeSqlWithPage(String sql,Class<T> clazz,int pagenum,int size);
  void excuteHqlquery(String hql);
}
