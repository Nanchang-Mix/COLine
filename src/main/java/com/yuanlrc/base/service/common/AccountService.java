package com.yuanlrc.base.service.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.common.AccountDao;
import com.yuanlrc.base.entity.common.Account;

/**
 * 用户管理service
 * @author Administrator
 *
 */
@Service
public class AccountService {

	@Autowired
	private AccountDao accountDao;
	
	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	public Account find(Long id){
		return accountDao.find(id);
	}
	
	/**
	 * 按照用户名查找用户
	 * @param username
	 * @return
	 */
	public Account findByUsername(String username){
		return accountDao.findByUsername(username);
	}
	
	/**
	 * 用户添加/编辑操作
	 * @param account
	 * @return
	 */
	public Account save(Account account){
		return accountDao.save(account);
	}
	
	/**
	 * 分页查询用户列表
	 * @param account
	 * @param pageBean
	 * @return
	 */
	public PageBean<Account> findList(Account account,PageBean<Account> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("username", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status","sex","chatStatus");
		Example<Account> example = Example.of(account, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<Account> findAll = accountDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
	
	/**
	 * 判断用户名是否存在，添加和编辑均可判断
	 * @param username
	 * @param id
	 * @return
	 */
	public boolean isExistUsername(String username,Long id){
		Account account = accountDao.findByUsername(username);
		if(account != null){
			//表示用户名存在，接下来判断是否是编辑用户的本身
			if(account.getId().longValue() != id.longValue()){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 按照用户id删除
	 * @param id
	 */
	public void delete(Long id){
		accountDao.deleteById(id);
	}
	
	/**
	 * 返回用户总数
	 * @return
	 */
	public long total(){
		return accountDao.count();
	}
}
