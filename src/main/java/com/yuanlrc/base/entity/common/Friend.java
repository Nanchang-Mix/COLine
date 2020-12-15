package com.yuanlrc.base.entity.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yuanlrc.base.annotion.ValidateEntity;

/**
 * 好友实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_friend")
@EntityListeners(AuditingEntityListener.class)
public class Friend extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static final int FRIEND_STATUS_ENABLE = 1;//正常
	
	public static final int FRIEND_STATUS_BLOCK = -1;//拉黑
	
	public static final int FRIEND_MSG_STATUS_ENABLE = 1;//正常提醒
	
	public static final int FRIEND_MSG_STATUS_MUTE = 0;//消息免打扰
	
	
	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;//所属用户
	
	@ManyToOne
	@JoinColumn(name="friend_account_id")
	private Account friendAccount;//好友用户
	
	@ValidateEntity(required=false)
	@Column(name="status",length=1)
	private int status = FRIEND_STATUS_ENABLE;//默认正常
	
	@ValidateEntity(required=false)
	@Column(name="msg_status",length=1)
	private int msgStatus = FRIEND_MSG_STATUS_ENABLE;//默认正常
	
	
	@ValidateEntity(required=false)
	@Column(name="remark",length=32)
	private String remark;//备注


	public Account getAccount() {
		return account;
	}


	public void setAccount(Account account) {
		this.account = account;
	}


	public Account getFriendAccount() {
		return friendAccount;
	}


	public void setFriendAccount(Account friendAccount) {
		this.friendAccount = friendAccount;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getMsgStatus() {
		return msgStatus;
	}


	public void setMsgStatus(int msgStatus) {
		this.msgStatus = msgStatus;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	@Override
	public String toString() {
		return "Friend [account=" + account + ", friendAccount="
				+ friendAccount + ", status=" + status + ", msgStatus="
				+ msgStatus + ", remark=" + remark + "]";
	}
	
}
