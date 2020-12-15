package com.yuanlrc.base.service.common;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * 聊天会话service
 */
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuanlrc.base.dao.common.AccountGroupMemberDao;
import com.yuanlrc.base.entity.common.AccountGroupMember;

@Service
public class AccountGroupMemberService {

	@Autowired
	private AccountGroupMemberDao accountGroupMemberDao;
	
	/**
	 * 新增或编辑群
	 * @param chatGroup
	 * @return
	 */
	public AccountGroupMember save(AccountGroupMember accountGroupMember){
		return accountGroupMemberDao.save(accountGroupMember);
	}
	
	/**
	 * 获取群成员
	 * @param type
	 * @param id
	 * @return
	 */
	public List<AccountGroupMember> findByGroup(Long id){
		return accountGroupMemberDao.findByAccountGroupId(id);
	}
	
	/**
	 * 获取某个用户参与的所有群
	 * @param id
	 * @return
	 */
	public List<AccountGroupMember> findByMember(Long id){
		return accountGroupMemberDao.findByMemberId(id);
	}
	
	/**
	 * 根据群和用户id查询
	 * @param accountGroupId
	 * @param memberId
	 * @return
	 */
	public AccountGroupMember findByAccountGroupAndMember(Long accountGroupId,Long memberId){
		return accountGroupMemberDao.findByAccountGroupIdAndMemberId(accountGroupId,memberId);
	}
	
	/**
	 * 根据id删除
	 * @param id
	 */
	public void delete(Long id){
		accountGroupMemberDao.deleteById(id);
	}
	
	/**
	 * 根据群id删除
	 * @param accountGroupId
	 */
	@Transactional
	public void deleteByAccountGroupId(Long accountGroupId){
		accountGroupMemberDao.deleteByAccountGroupId(accountGroupId);
	}
	
	/**
	 * 根据id查找
	 * @param id
	 * @return
	 */
	public AccountGroupMember find(Long id){
		return accountGroupMemberDao.getOne(id);
	}
}
