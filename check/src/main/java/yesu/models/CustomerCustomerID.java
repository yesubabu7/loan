package yesu.models;
import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "eee")
public class CustomerCustomerID  implements Serializable {
	
	
	@Id
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private CustomerUser customerUser;

    public void setCustomerCustomId(long customerCustomId) {
		this.customerCustomId = customerCustomId;
	}

	@Column(name = "customer_custom_id")
    private long customerCustomId;
	
	 @Column(name = "user_id", insertable = false, updatable = false)
	    private int userId;

	
	
	
	 public void setUserId(int userId) {
		 this .userId=userId;
	        
	    }

    public CustomerUser getCustomerUser() {
		return customerUser;
	}

	public void setCustomerUser(CustomerUser customerUser) {
		this.customerUser = customerUser;
	}

	public long getCustomerCustomId() {
		return customerCustomId;
	}

	

	

    
}
