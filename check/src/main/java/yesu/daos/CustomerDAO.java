package yesu.daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import yesu.models.Customer;
import yesu.models.LoanApplicant;
import yesu.models.Nominee;

@Component
public class CustomerDAO {

	@PersistenceContext
	private EntityManager em;

	public void save(Customer customer, Nominee nominee, LoanApplicant loanapplicant) {
		em.persist(customer);
		em.persist(nominee);
		em.persist(loanapplicant);
	}

	
	public List getLoanApplicantDao() {
		
		return em.createQuery("SELECT e FROM LoanApplicant e").getResultList();
	}

}
