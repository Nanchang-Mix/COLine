package com.yuanlrc.base.dao.common;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yuanlrc.base.entity.common.Account;

/**
 * 用户数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface AccountDao extends JpaRepository<Account, Long>{
	
	/**
	 * 按照用户名查找用户信息
	 * @param username
	 * @return
	 */
	public Account findByUsername(String username);

	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	@Query("select a from Account a where id = :id")
	public Account find(@Param("id")Long id);
	
}
