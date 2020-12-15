package com.yuanlrc.base.dao.common;
/**
 * 聊天会话数据库操作层
 */
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yuanlrc.base.entity.common.AccountGroup;
@Repository
public interface AccountGroupDao extends JpaRepository<AccountGroup, Long> {

	@Query("select ag from AccountGroup ag where ag.id = :id")
	AccountGroup find(@Param("id")Long id);
	
	List<AccountGroup> findByAdminId(Long id);
}
