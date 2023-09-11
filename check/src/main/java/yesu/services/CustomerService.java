package yesu.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import yesu.daos.CustomerDAO;
import yesu.models.Customer;
import yesu.models.CustomerUser;
import yesu.models.LoanApplicant;
import yesu.models.LoanApplicationForm;
import yesu.models.Nominee;

@Service
public class CustomerService {
	int id = 1;

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
			loanapplicant.setNoOfMonths(Integer.parseInt(loanApplication.getNoOfMonths()));
			loanapplicant.setAmount(Long.parseLong(loanApplication.getLoanAmount()));
			loanapplicant.setEmiRangeFrom(Long.parseLong("10000"));
			loanapplicant.setEmiRangeTo(Long.parseLong("1000000"));
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
	
	
	

	@Transactional
	public List<LoanApplicant> getLoanApplicantData() {
		return customerdao.getLoanApplicantDao();
	}
	
	

	
	
	
	
	
	@Transactional
	public boolean loanStatusService(List<LoanApplicant> loan, Long applicantId, String status) {
		return customerdao.loanStatusDao(loan, applicantId, status);
	}
	
	
	
	
	
	

	public List<Customer> getAllCustomerUsersService(String username, String password) {
		List<CustomerUser> userList = customerdao.getAllCustomerUsersDao();

		for (CustomerUser user : userList) {
			if (user.getUserName().equals(username) && user.getUserPassword().equals(password)) {
				int userId = user.getUserId();
				System.out.println(username + "username" + password + "password" + userId + "userid");
				// Found a matching user with the provided username and password
				List<Long> customerIDs = customerdao.findCustomerCustomIdsForUserId(userId);
				if (!customerIDs.isEmpty()) {
					List<Customer> selectedIds = customerdao.getAllSelectedCustomers(customerIDs);

					return selectedIds;
					// System.out.println(selectedIds.get(0).getFirstName());
				}
				break;

			}
		}

		return null; // No matching user found
	}
	
	
	
	

	@Transactional
	public boolean emiScheduleDataService(String loneAppId, String emiPerMonth, String customerId, String emiStartDate,
			String annualInterestRate, String monthlyInterestRate, String numberOfPayments, String repayableAmount,
			String loanAmount) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(loneAppId+"iiiiiiiii");

		customerdao.emiScheduleDataService(Integer.parseInt(loneAppId), emiPerMonth, emiStartDate);
		customerdao.emiScheduleMaterDataService(Integer.parseInt(loneAppId), annualInterestRate, numberOfPayments,
				loanAmount, repayableAmount);

		return true;
	}

}