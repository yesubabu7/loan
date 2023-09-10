package yesu.models;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;

@Entity
public class LoanApplicationEMIMaster {

    public int getInapId() {
		return inapId;
	}

	public void setInapId(int inapId) {
		this.inapId = inapId;
	}

	public BigDecimal getLemiRoi() {
		return lemiRoi;
	}

	public void setLemiRoi(BigDecimal lemiRoi) {
		this.lemiRoi = lemiRoi;
	}

	public short getLemiNoe() {
		return lemiNoe;
	}

	public void setLemiNoe(short lemiNoe) {
		this.lemiNoe = lemiNoe;
	}

	public BigDecimal getLemiSanctionedAmount() {
		return lemiSanctionedAmount;
	}

	public void setLemiSanctionedAmount(BigDecimal lemiSanctionedAmount) {
		this.lemiSanctionedAmount = lemiSanctionedAmount;
	}

	public BigDecimal getLemiRepayAmount() {
		return lemiRepayAmount;
	}

	public void setLemiRepayAmount(BigDecimal lemiRepayAmount) {
		this.lemiRepayAmount = lemiRepayAmount;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Inap_id")
    private int inapId;

    @Column(name = "lemi_roi")
    private BigDecimal lemiRoi;

    @Column(name = "lemi_noe")
    private short lemiNoe;

    @Column(name = "lemi_sanctioned_amount")
    private BigDecimal lemiSanctionedAmount;

    @Column(name = "lemi_repayamount")
    private BigDecimal lemiRepayAmount;

    // Constructors, getters, and setters
}
