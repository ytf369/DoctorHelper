package com.doctorhelper.dao.base.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.doctorhelper.dao.base.IBaseDao;
public class BaseDaoImpl<T> implements IBaseDao<T> {
	@Autowired
    private SessionFactory sf;
	/**
	 * 根据Id查询对象
	 */
	@Override
	public T findById(Class<T> clazz, Long id) {
		return (T) getSession().get(clazz, id);
	}

	/**
	 * 保存对象
	 */
	@Override
	public void save(T t) {
		getSession().save(t);
	}

	/**
	 * 修改对象
	 */
	@Override
	public void update(T t) {
		getSession().update(t);		
	}

	/**
	 * 删除对象
	 */
	@Override
	public void delete(T t) {
		getSession().delete(t);		
	}

	/**
	 * 查询全部对象列表
	 */
	@Override
	public List<T> queryAlllist(Class<T> clazz) {
		return getSession().createCriteria(clazz).list();
	}

	/**
	 * 根据hql语句查询
	 */
	@Override
	public List<T> querylist(String hql) {
		return (List<T>) getSession().createQuery(hql).list();
	}

	/**
	 * 保存或添加
	 */
	@Override
	public void saveorupdate(T t) {
		getSession().saveOrUpdate(t);
		
	}
	//获取Session
	public Session getSession(){
	return 	sf.getCurrentSession();
	}
    //带分页的查询语句
	@Override
	public List<T> querylistWithPage(String hql, int pagenum, int size) {
		@SuppressWarnings("unchecked")
		List<T> list=(List<T>) getSession().createQuery(hql)
				     .setFirstResult((pagenum - 1) * size)
				     .setMaxResults(size)
				     .list();
		return list;
	}

	//查询总记录数
	@Override
	public Long querylistCount(String hql) {
		return (Long) getSession().createQuery(hql).uniqueResult();
	}

	//本地sql查询
	@SuppressWarnings("unchecked")
	@Override
	public List<T> querylistNativeSql(String sql,Class<T> clazz) {
		return getSession().createSQLQuery(sql)
				.addEntity(clazz)
				.list();
	}

	//带分页的本地sql查询
	@SuppressWarnings("unchecked")
	@Override
	public List<T> querylistNativeSqlWithPage(String sql, Class<T> clazz,
			int pagenum, int size) {
		return getSession().createSQLQuery(sql)
				.addEntity(clazz)
				.setFirstResult((pagenum - 1) * size)
				.setMaxResults(size)
				.list();
	}

	//sql查询数量
	@Override
	public Long querylistSqlCount(String sql) {
		return Long.valueOf(getSession().createSQLQuery(sql).uniqueResult().toString());
	}

	//执行hql
	@Override
	public void excuteHqlquery(String hql) {
		getSession().createQuery(hql).executeUpdate();
		
	}


}
