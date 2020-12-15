package com.yuanlrc.base.dao.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yuanlrc.base.entity.common.MsgLog;

/**
 * 消息记录数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface MsgLogDao extends JpaRepository<MsgLog, Long>{
	

	/**
	 * 根据消息记录id查询
	 * @param id
	 * @return
	 */
	@Query("select ml from MsgLog ml where id = :id")
	public MsgLog find(@Param("id")Long id);
	
	List<MsgLog> findByAccountIdAndStatus(Long accountId,int status);
	
	List<MsgLog> findByMsgContentId(Long msgContentId);
	
}
