package yesu.models;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "ddd")
public class CustomerUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userId;

    
	@Column(name = "user_name")
    private String userName;

    @Column(name = "user_cdate")
    @Temporal(TemporalType.TIMESTAMP)
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
    
    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
		this.userCreationDate = userCreationDate;
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
