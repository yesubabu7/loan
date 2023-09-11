package yesu.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yesuCustomerUserTable")
public class CustomerUser {

	@Id
	@Column(name = "user_id")
	private int userId; // Primary key

	@Column(name = "user_name")
	private String userName;

	@Column(name = "user_cdate")

	private Date userCreationDate;

	@Column(name = "user_type")
	private String userType;

	@Column(name = "user_pwd")
	private String userPassword;

	@Column(name = "user_email")
	private String userEmail;

	@Column(name = "r_recoveryemail")
	private String recoveryEmail;

	@Column(name = "user_mobile")
	private long userMobile;

	// Constructors, getters, and setters

	public int getUserId() {
		return userId;
	}

	public void setUserId(int customerId) {
		this.userId = customerId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getUserCreationDate() {
		return userCreationDate;
	}

	public void setUserCreationDate(Date userCreationDate) {
		this.userCreationDate = new Date();
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getRecoveryEmail() {
		return recoveryEmail;
	}

	public void setRecoveryEmail(String recoveryEmail) {
		this.recoveryEmail = recoveryEmail;
	}

	public long getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(long userMobile) {
		this.userMobile = userMobile;
	}
}