package com.yuanlrc.base.service.common;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
/**
 * 聊天会话service
 */
import org.springframework.stereotype.Service;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.common.AccountGroupDao;
import com.yuanlrc.base.entity.common.AccountGroup;

@Service
public class AccountGroupService {

	@Autowired
	private AccountGroupDao accountGroupDao;
	
	/**
	 * 新增或编辑群
	 * @param chatGroup
	 * @return
	 */
	public AccountGroup save(AccountGroup accountGroup){
		return accountGroupDao.save(accountGroup);
	}
	
	/**
	 * 获取我创建的所有群列表
	 * @param type
	 * @param id
	 * @return
	 */
	public List<AccountGroup> findMyGroups(Long id){
		return accountGroupDao.findByAdminId(id);
	}
	
	/**
	 * 分页查询群组列表
	 * @param accountGroup
	 * @param pageBean
	 * @return
	 */
	public PageBean<AccountGroup> findList(AccountGroup accountGroup,PageBean<AccountGroup> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("name", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("minPeople","maxPeople","curPeople");
		Example<AccountGroup> example = Example.of(accountGroup, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<AccountGroup> findAll = accountGroupDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public AccountGroup findById(Long id){
		return accountGroupDao.find(id);
	}
	
	/**
	 * 根据id删除
	 * @param id
	 */
	public void delete(Long id){
		accountGroupDao.deleteById(id);
	}
	
	/**
	 * 返回总数
	 * @return
	 */
	public long total(){
		return accountGroupDao.count();
	}
}
