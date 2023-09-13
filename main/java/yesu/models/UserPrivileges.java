package yesu.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yesuUserPrivileges")
public class UserPrivileges {
	@Id
	int id;
	int userId;
	int privId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPrivId() {
		return privId;
	}

	public void setPrivId(int privId) {
		this.privId = privId;
	}

}
