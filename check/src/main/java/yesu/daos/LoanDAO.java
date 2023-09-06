package yesu.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import yesu.entities.CustomerEntity;

@Repository
public class LoanDAO {

	@PersistenceContext
	private EntityManager em;

	@Transactional
	public boolean sendDataToDao(CustomerEntity customerData) {
		try {
			em.persist(customerData);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
