package yesu.services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import yesu.daos.LoanDAO;
import yesu.entities.CustomerEntity;

@Repository
public class LoanServices {
	LoanDAO loandao;

	@Autowired
	public LoanServices(LoanDAO loandao) {
		this.loandao = loandao;
	}

	@PersistenceContext
	private EntityManager em;

	@Transactional

	public boolean sendDataToService(CustomerEntity customerData) {
		// TODO Auto-generated method stub
		return loandao.sendDataToDao(customerData);
	}

}
