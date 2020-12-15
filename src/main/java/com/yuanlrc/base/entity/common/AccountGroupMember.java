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
 * 群成员实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_account_group_member")
@EntityListeners(AuditingEntityListener.class)
public class AccountGroupMember extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static final int FRIEND_MSG_STATUS_ENABLE = 1;//正常提醒
	
	public static final int FRIEND_MSG_STATUS_MUTE = 0;//消息免打扰
	
	
	@ManyToOne
	@JoinColumn(name="account_group_id")
	private AccountGroup accountGroup;//所属群
	
	@ManyToOne
	@JoinColumn(name="member_id")
	private Account member;//用户
	
	@ValidateEntity(required=false)
	@Column(name="msg_status",length=1)
	private int msgStatus = FRIEND_MSG_STATUS_ENABLE;//默认正常
	
	
	@ValidateEntity(required=false)
	@Column(name="nickname",length=32)
	private String nickname;//群昵称


	public Account getMember() {
		return member;
	}


	public void setMember(Account member) {
		this.member = member;
	}


	public AccountGroup getAccountGroup() {
		return accountGroup;
	}


	public void setAccountGroup(AccountGroup accountGroup) {
		this.accountGroup = accountGroup;
	}


	public int getMsgStatus() {
		return msgStatus;
	}


	public void setMsgStatus(int msgStatus) {
		this.msgStatus = msgStatus;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	@Override
	public String toString() {
		return "AccountGroupMember [accountGroup=" + accountGroup
				+ ", member=" + member + ", msgStatus=" + msgStatus
				+ ", nickname=" + nickname + "]";
	}


	
	
}
