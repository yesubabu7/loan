package yesu.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yesuPrivileges")
public class Privileges {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int previd;
	public String privName;
	public String privrPattern;
	public String privAction;

	public int getPrevid() {
		return previd;
	}

	public void setPrevid(int previd) {
		this.previd = previd;
	}

	public String getPrivName() {
		return privName;
	}

	public void setPrivName(String privName) {
		this.privName = privName;
	}

	public String getPrivrPattern() {
		return privrPattern;
	}

	public void setPrivrPattern(String privrPattern) {
		this.privrPattern = privrPattern;
	}

	public String getPrivAction() {
		return privAction;
	}

	public void setPrivAction(String privAction) {
		this.privAction = privAction;
	}

}
