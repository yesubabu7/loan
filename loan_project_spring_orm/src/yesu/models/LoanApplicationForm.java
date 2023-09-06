package yesu.models;

import java.util.Date;

public class LoanApplicationForm {
	private String firstname;
	private String lastname;
	private Date dob;
	private String pan;
	private Integer mobile;
	private String address;
	private String numericInput;
	private String name;
	private String loanType;
	private String loanAmount;
	private String nomineename;
	private String nomineerelation;
	private String guardianName;

	// Getters and setters for each field
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
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

	public Integer getMobile() {
		return mobile;
	}

	public void setMobile(Integer mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNumericInput() {
		return numericInput;
	}

	public void setNumericInput(String numericInput) {
		this.numericInput = numericInput;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public String getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(String loanAmount) {
		this.loanAmount = loanAmount;
	}

	public String getNomineename() {
		return nomineename;
	}

	public void setNomineename(String nomineename) {
		this.nomineename = nomineename;
	}

	public String getNomineerelation() {
		return nomineerelation;
	}

	public void setNomineerelation(String nomineerelation) {
		this.nomineerelation = nomineerelation;
	}

	public String getGuardianName() {

		return guardianName;
	}

	public void setGuardianName(String GuardianName) {
		this.guardianName = GuardianName;

	}
}
