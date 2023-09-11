package base.models;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yesuLoanApplicationEMISchedules")
public class LoanApplicationEMIScheduleEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Inap_id")
	private int inapId;

	@Column(name = "lemi_index")
	private int lemiIndex;

	@Column(name = "lemi_emidate")
	private String lemiEmidate;

	@Column(name = "lemi_amount")
	private BigDecimal lemiAmount;

	// Constructors, getters, and setters

	public LoanApplicationEMIScheduleEntity() {
		// Default constructor
	}

	public LoanApplicationEMIScheduleEntity(int lemiIndex, String lemiEmidate, BigDecimal lemiAmount) {
		this.lemiIndex = lemiIndex;
		this.lemiEmidate = lemiEmidate;
		this.lemiAmount = lemiAmount;
	}

	public int getInapId() {
		return inapId;
	}

	public void setInapId(int inapId) {
		this.inapId = inapId;
	}

	public int getLemiIndex() {
		return lemiIndex;
	}

	public void setLemiIndex(int lemiIndex) {
		this.lemiIndex = lemiIndex;
	}

	public String getLemiEmidate() {
		return lemiEmidate;
	}

	public void setLemiEmidate(String emiStartDate) {
		this.lemiEmidate = emiStartDate;
	}

	public BigDecimal getLemiAmount() {
		return lemiAmount;
	}

	public void setLemiAmount(BigDecimal lemiAmount) {
		this.lemiAmount = lemiAmount;
	}
}