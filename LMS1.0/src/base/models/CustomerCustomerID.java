package base.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yesuCustomerCustomerIDTable")
public class CustomerCustomerID {

	@Id
	@Column(name = "customer_custom_id")
	private long customerCustomId; // Primary key

	@Column(name = "user_id")
	private int userId;

	public long getCustomerCustomId() {
		return customerCustomId;
	}

	public void setCustomerCustomId(long customerCustomId) {
		this.customerCustomId = customerCustomId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
