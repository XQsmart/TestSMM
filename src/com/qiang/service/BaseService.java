package com.qiang.service;

import com.qiang.common.bean.Pager4EasyUI;

import java.io.Serializable;
import java.util.List;


public interface BaseService<T> {
	
	public List<T> queryAll();
	
	public T queryById(Serializable id);
	
	public void add(T t);
	
	public void update(T t);
	
	public void deleteById(Serializable id);
	
	public Pager4EasyUI<T> queryByPagerAndCriteria(Pager4EasyUI<T> pager, T t);

}
