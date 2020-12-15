package com.yuanlrc.base.dao.common;
/**
 * 好友数据库操作层
 */
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yuanlrc.base.entity.common.Friend;
@Repository
public interface FriendDao extends JpaRepository<Friend, Long> {

	@Query("select f from Friend f where f.id = :id")
	Friend find(@Param("id")Long id);
	
	List<Friend> findByAccountId(Long accountId);
}
