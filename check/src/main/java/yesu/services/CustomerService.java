package yesu.services;
import yesu.models.*;
import java.text.ParseException;
import java.text.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import yesu.daos.CustomerDAO;
import yesu.models.Customer;
import yesu.models.LoanApplicant;
import yesu.models.LoanApplicationForm;
import yesu.models.Nominee;

@Service
public class CustomerService {
	int id=1;

	private CustomerDAO customerdao;

	@Autowired
	public CustomerService(CustomerDAO customerdao) {
		this.customerdao = customerdao;
	}

	@Transactional
	public void createEntries(LoanApplicationForm loanApplication) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Customer customer = new Customer();
		Nominee nominee = new Nominee();
		LoanApplicant loanapplicant = new LoanApplicant();

		try {
			customer.setFirstName(loanApplication.getFirstname());
			customer.setLastName(loanApplication.getLastname());
			customer.setDob(dateFormat.parse(loanApplication.getDob()));
			customer.setPan(loanApplication.getPan());
			customer.setMobile(loanApplication.getMobile());
			customer.setAddress(loanApplication.getAddress());
			customer.setGuardianName(loanApplication.getGuardianName());
			customer.setLastUpdatedDate(new Date());
			customer.setCustLUser(1);

			nominee.setNomineename(loanApplication.getNomineename());
			nominee.setNomineerelation(loanApplication.getNomineerelation());

			loanapplicant.setCustomerId(id++);
			loanapplicant.setApplicationDate(new Date());
			loanapplicant.setLoanTypeId(1);
			loanapplicant.setAmount(Long.parseLong(loanApplication.getLoanAmount()));
			loanapplicant.setEmiRangeFrom(Long.parseLong("1"));
			loanapplicant.setEmiRangeTo(Long.parseLong("2"));
			loanapplicant.setNominatedAmount(Long.parseLong("0"));
			loanapplicant.setCibilScore(750);
			loanapplicant.setStatus("pending");
			loanapplicant.setConclusionRemarks("still in progress");
			loanapplicant.setProcessedUserId(1);
		
			
			loanapplicant.setProcessedDate(new Date());

			System.out.println(loanApplication.getNomineename());
		} catch (ParseException e) {
			e.printStackTrace();
		}

		customerdao.save(customer, nominee, loanapplicant);
	}

	

	public List<LoanApplicant> getLoanApplicantData() {
		return customerdao.getLoanApplicantDao();
	}

}
