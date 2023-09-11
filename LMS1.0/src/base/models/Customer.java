package base.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yesuCustomerTable")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Cust_ID")
	private Long id;

	@Column(name = "Cust_FirstName")
	private String firstName;

	@Column(name = "Cust_LastName")
	private String lastName;

	@Column(name = "Cust_DOB")
	private Date dob;

	@Column(name = "Cust_PANNo")
	private String pan;

	@Column(name = "Cust_Mobile")
	private String mobile;

	@Column(name = "Cust_Address")
	private String address;

	@Column(name = "Cust_LUser")
	private Integer custLUser;

	@Column(name = "Cust_GuardianName")
	private String guardianName;

	@Column(name = "Cust_LastUpdatedDate")
	private Date lastUpdatedDate;

	// Getter and Setter methods for all fields
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getCustLUser() {
		return custLUser;
	}

	public void setCustLUser(Integer custLUser) {
		this.custLUser = custLUser;
	}

	public String getGuardianName() {
		return guardianName;
	}

	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}

	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
}