package com.yuanlrc.base.dao.common;
/**
 * 聊天会话数据库操作层
 */
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuanlrc.base.entity.common.AccountGroupMember;
@Repository
public interface AccountGroupMemberDao extends JpaRepository<AccountGroupMember, Long> {

	List<AccountGroupMember> findByAccountGroupId(Long id);
	
	List<AccountGroupMember> findByMemberId(Long id);
	
	AccountGroupMember findByAccountGroupIdAndMemberId(Long accountGroupId,Long memberId);
	
	@Transactional
	void deleteByAccountGroupId(Long accountGroupId);

}
