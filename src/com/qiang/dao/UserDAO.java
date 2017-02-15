package com.qiang.dao;

import com.qiang.bean.User;
import com.qiang.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;



@Repository
public interface UserDAO extends BaseDAO<User> {

	public List<User> queryByPagerAndCriteria(@Param("pager") Pager4EasyUI<User> pager, @Param("user") User t);
	public int countByCriteria(User t);
}
