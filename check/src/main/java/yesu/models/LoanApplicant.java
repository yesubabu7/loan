package yesu.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bb")
public class LoanApplicant {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Inap_ID")
	private Long id;

	@Column(name = "Inap_Cust_ID")
	private Integer customerId;

	@Column(name = "Inap_ApDate")
	private Date applicationDate;

	@Column(name = "Inap_Inty_ID")
	private Integer loanTypeId;

	@Column(name = "Inap_noOfMonths")
	private int noOfMonths;

	public int getNoOfMonths() {
		return noOfMonths;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public void setNoOfMonths(int i) {
		this.noOfMonths = i;
	}

	@Column(name = "Inap_Amount")
	private Long amount;

	@Column(name = "Inap_EMI_Range_From")
	private Long emiRangeFrom;

	@Column(name = "Inap_EMI_Range_To")
	private Long emiRangeTo;

	@Column(name = "Inap_Nom_Requested")
	private Long nominatedAmount;

	@Column(name = "Inap_CIBIL_Score")
	private Integer cibilScore;

	@Column(name = "Inap_Status")
	private String status;

	@Column(name = "Inap_Conclusion_Remarks")
	private String conclusionRemarks;

	@Column(name = "Inap_Processed_User")
	private Integer processedUserId;

	@Column(name = "Inap_Processed_Date")
	private Date processedDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int id2) {
		this.customerId = id2;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public Integer getLoanTypeId() {
		return loanTypeId;
	}

	public void setLoanTypeId(Integer loanTypeId) {
		this.loanTypeId = loanTypeId;
	}

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public Long getEmiRangeFrom() {
		return emiRangeFrom;
	}

	public void setEmiRangeFrom(Long emiRangeFrom) {
		this.emiRangeFrom = emiRangeFrom;
	}

	public Long getEmiRangeTo() {
		return emiRangeTo;
	}

	public void setEmiRangeTo(Long emiRangeTo) {
		this.emiRangeTo = emiRangeTo;
	}

	public Long getNominatedAmount() {
		return nominatedAmount;
	}

	public void setNominatedAmount(Long nominatedAmount) {
		this.nominatedAmount = nominatedAmount;
	}

	public Integer getCibilScore() {
		return cibilScore;
	}

	public void setCibilScore(Integer cibilScore) {
		this.cibilScore = cibilScore;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getConclusionRemarks() {
		return conclusionRemarks;
	}

	public void setConclusionRemarks(String conclusionRemarks) {
		this.conclusionRemarks = conclusionRemarks;
	}

	public Integer getProcessedUserId() {
		return processedUserId;
	}

	public void setProcessedUserId(Integer processedUserId) {
		this.processedUserId = processedUserId;
	}

	public Date getProcessedDate() {
		return processedDate;
	}

	public void setProcessedDate(Date processedDate) {
		this.processedDate = processedDate;
	}
}