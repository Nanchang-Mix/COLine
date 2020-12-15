package com.yuanlrc.base.service.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.common.MsgContentDao;
import com.yuanlrc.base.entity.common.MsgContent;

/**
 * 消息内容管理service
 * @author Administrator
 *
 */
@Service
public class MsgContentService {

	@Autowired
	private MsgContentDao msgContentDao;
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public MsgContent find(Long id){
		return msgContentDao.find(id);
	}
	
	
	/**
	 * 添加/编辑操作
	 * @param account
	 * @return
	 */
	public MsgContent save(MsgContent msgContent){
		return msgContentDao.save(msgContent);
	}
	
	/**
	 * 返回总数
	 * @return
	 */
	public long total(){
		return msgContentDao.count();
	}
	
	/**
	 * 获取消息列表
	 * @param msgContent
	 * @param pageBean
	 * @return
	 */
	public PageBean<MsgContent> findList(MsgContent msgContent,PageBean<MsgContent> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("msg", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("attachSize");
		Example<MsgContent> example = Example.of(msgContent, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(),Sort.by(Direction.DESC, "createTime"));
		Page<MsgContent> findAll = msgContentDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
}
