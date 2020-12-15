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
 * 消息记录实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_msg_log")
@EntityListeners(AuditingEntityListener.class)
public class MsgLog extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static final int MSG_STATUS_READ = 1;//已读
	
	public static final int MSG_STATUS_UNREAD = 0;//未读
	
	
	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;//所属用户
	
	@ManyToOne
	@JoinColumn(name="msg_content_id")
	private MsgContent msgContent;//消息实体
	
	@ValidateEntity(required=false)
	@Column(name="status",length=1)
	private int status = MSG_STATUS_UNREAD;//默认正常

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public MsgContent getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(MsgContent msgContent) {
		this.msgContent = msgContent;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MsgLog [account=" + account + ", msgContent=" + msgContent
				+ ", status=" + status + "]";
	}
	
	
	
}
