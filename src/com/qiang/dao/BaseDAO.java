package com.qiang.dao;

import com.qiang.common.bean.Pager4EasyUI;

import java.io.Serializable;
import java.util.List;


public interface BaseDAO<T> {
	
	public List<T> queryAll();
	
	public T queryById(Serializable id);
	
	public void add(T t);
	
	public void update(T t);
	
	public void deleteById(Serializable id);
	
	public List<T> queryByPagerAndCriteria(Pager4EasyUI<T> pager, T t);
	
	public int countByCriteria(T t);

}
