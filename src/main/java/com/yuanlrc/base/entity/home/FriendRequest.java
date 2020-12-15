package com.yuanlrc.base.entity.home;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yuanlrc.base.annotion.ValidateEntity;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BaseEntity;

/**
 * 前台好友请求实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_friend_request")
@EntityListeners(AuditingEntityListener.class)
public class FriendRequest extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static final int FRIEND_REQUEST_STATUS_WAITING = 0;//待处理
	
	public static final int FRIEND_REQUEST_STATUS_AGREE = 1;//已同意
	
	public static final int FRIEND_REQUEST_STATUS_REFUSE = -1;//已拒绝
	
	public static final int FRIEND_REQUEST_STATUS_EXPIRED = 2;//已过期
	
	@ManyToOne
	@JoinColumn(name="sender_account_id")
	private Account sender;//请求发出者
	
	@ManyToOne
	@JoinColumn(name="reciever_account_id")
	private Account reciever;//请求接受者
	
	@ValidateEntity(required=false)
	@Column(name="status",length=1)
	private int status = FRIEND_REQUEST_STATUS_WAITING;//默认待处理请求
	
	
	@ValidateEntity(required=false)
	@Column(name="remark",length=32)
	private String remark;//备注


	public Account getSender() {
		return sender;
	}


	public void setSender(Account sender) {
		this.sender = sender;
	}


	public Account getReciever() {
		return reciever;
	}


	public void setReciever(Account reciever) {
		this.reciever = reciever;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	@Override
	public String toString() {
		return "FriendRequest [sender=" + sender + ", reciever=" + reciever
				+ ", status=" + status + ", remark=" + remark + "]";
	}

	
	
	
	
}
