package com.yuanlrc.base.dao.common;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yuanlrc.base.entity.common.MsgContent;

/**
 * 消息内容数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface MsgContentDao extends JpaRepository<MsgContent, Long>{
	

	/**
	 * 根据消息id查询
	 * @param id
	 * @return
	 */
	@Query("select mc from MsgContent mc where id = :id")
	public MsgContent find(@Param("id")Long id);
	
}
