package com.yuanlrc.base.dao.home;
/**
 * 好友请求数据库处理
 */
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.home.FriendRequest;
@Repository
public interface FriendRequestDao extends JpaRepository<FriendRequest, Long> {
	
	@Query("select fr from FriendRequest fr where fr.id = :id")
	FriendRequest find(@Param("id")Long id);
	
	FriendRequest findBySenderAndReciever(Account sender,Account reciever);
	
	List<FriendRequest> findByRecieverOrderByUpdateTimeDesc(Account reciever);
	
	@Query("select count(fr.id) from FriendRequest fr where fr.reciever.id = :recieverId and fr.status = :status")
	Integer getFriendRequestCount(@Param("recieverId")Long recieverId,@Param("status")int status);
}
