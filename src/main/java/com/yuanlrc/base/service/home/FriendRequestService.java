package com.yuanlrc.base.service.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuanlrc.base.dao.home.FriendRequestDao;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.home.FriendRequest;
/**
 * 好友请求service
 * @author Administrator
 *
 */
@Service
public class FriendRequestService {

	@Autowired
	private FriendRequestDao friendRequestDao;
	
	/**
	 * 更新或新增好友请求
	 * @param friendRequest
	 * @return
	 */
	public FriendRequest save(FriendRequest friendRequest){
		return friendRequestDao.save(friendRequest);
	}
	
	/**
	 * 根据发出者、接受者查询
	 * @param sender
	 * @param reciever
	 * @return
	 */
	public FriendRequest findBySenderAndReciever(Account sender,Account reciever){
		return friendRequestDao.findBySenderAndReciever(sender, reciever);
	}
	
	/**
	 * 根据第查询
	 * @param id
	 * @return
	 */
	public FriendRequest find(Long id){
		return friendRequestDao.find(id);
	}
	
	/**
	 * 根据接受者查询
	 * @param reciever
	 * @return
	 */
	public List<FriendRequest> findByReciever(Account reciever){
		return friendRequestDao.findByRecieverOrderByUpdateTimeDesc(reciever);
	}
	
	/**
	 * 删除好友请求
	 * @param id
	 */
	public void delete(Long id){
		friendRequestDao.deleteById(id);
	}
	
	/**
	 * 获取新的好友添加请求数
	 * @param recieverId
	 * @return
	 */
	public Integer getNewFriendRequestCount(Long recieverId){
		return friendRequestDao.getFriendRequestCount(recieverId, FriendRequest.FRIEND_REQUEST_STATUS_WAITING);
	}
}
