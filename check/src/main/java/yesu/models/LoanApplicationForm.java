package yesu.models;

import java.util.Date;
public class LoanApplicationForm {
	private String firstname;
	private String lastname;
	private String dob;
	private String pan;
	private String mobile;
	private String address;
	private String numericinput;
	private String name;
	private String loanType;
	private String loanAmount;
	private String nomineename;
	private String nomineerelation;
	private String gurdianName;
	private String noOfMonths;

	public String getNoOfMonths() {
		return noOfMonths;
	}

	public void setNoOfMonths(String noOfMonths) {
		this.noOfMonths = noOfMonths;
	}

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

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
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

	public String getNumericInput() {
		return numericinput;
	}

	public void setNumericInput(String numericInput) {
		this.numericinput = numericInput;
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
		// TODO Auto-generated method stub
		return gurdianName;

	}

	public void setGuardianName(String gurdianName) {
		this.gurdianName = gurdianName;
	}

	@Override
	public String toString() {
		return "LoanApplicationForm{" + "firstname='" + firstname + '\'' + ", lastname='" + lastname + '\'' + ", dob='"
				+ dob + '\'' + ", pan='" + pan + '\'' + ", mobile='" + mobile + '\'' + ", address='" + address + '\''
				+ ", numericinput='" + numericinput + '\'' + ", name='" + name + '\'' + ", loanType='" + loanType + '\''
				+ ", loanAmount='" + loanAmount + '\'' + ", nomineename='" + nomineename + '\'' + ", nomineerelation='"
				+ nomineerelation + '\'' + ", guardianName='" + gurdianName + '\'' + '}';
	}

}