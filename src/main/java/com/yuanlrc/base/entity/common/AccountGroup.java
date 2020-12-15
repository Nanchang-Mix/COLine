package com.yuanlrc.base.entity.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

/**
 * 用户群实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_account_group")
@EntityListeners(AuditingEntityListener.class)
public class AccountGroup extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static final int GROUP_MIN_PEOPLE = 2;//创建群聊最小人数
	
	public static final int GROUP_MAX_PEOPLE = 65535;//创建群聊最大人数
	
	@ManyToOne
	@JoinColumn(name="admin_id")
	private Account admin;//所属用户，即群主
	
	@Column(name="name",nullable=false,length=18)
	private String name;//群名称
	
	@Column(name="picture",nullable=false,length=128)
	private String picture;//群封面图片
	
	@Column(name="info",length=256)
	private String info;//群介绍
	
	@Column(name="notice",length=256)
	private String notice;//群公告
	
	@Column(name="min_people",nullable=false,length=11)
	private int minPeople = GROUP_MIN_PEOPLE;//当为群聊时最小人数
	
	@Column(name="max_people",nullable=false,length=11)
	private int maxPeople = GROUP_MAX_PEOPLE;//当为群聊时最大人数
	
	@Column(name="cur_people",nullable=false,length=11)
	private int curPeople = 0;//当前群人数

	public Account getAdmin() {
		return admin;
	}

	public void setAdmin(Account admin) {
		this.admin = admin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public int getMinPeople() {
		return minPeople;
	}

	public void setMinPeople(int minPeople) {
		this.minPeople = minPeople;
	}

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public int getCurPeople() {
		return curPeople;
	}

	public void setCurPeople(int curPeople) {
		this.curPeople = curPeople;
	}

	@Override
	public String toString() {
		return "AccountGroup [admin=" + admin + ", name=" + name + ", picture="
				+ picture + ", info=" + info + ", notice=" + notice
				+ ", minPeople=" + minPeople + ", maxPeople=" + maxPeople
				+ ", curPeople=" + curPeople + "]";
	}
	
	
	

	

	
	
	
	
}
