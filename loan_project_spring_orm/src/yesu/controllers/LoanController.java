package yesu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import yesu.entities.CustomerEntity;
import yesu.models.LoanApplicationForm;
import yesu.services.LoanServices;

@Controller
public class LoanController {

	LoanServices loanserv;

	@Autowired
	public LoanController(LoanServices loanserv) {
		this.loanserv = loanserv;

	}

	@RequestMapping(value = "/loansubmit", method = RequestMethod.POST)
	public String receiveLoanData(LoanApplicationForm loanObj) {
		System.out.println("hii");
		// Extract customer data from loanObj
		CustomerEntity customerData = new CustomerEntity();
		customerData.setFirstName(loanObj.getFirstname());
		customerData.setLastName(loanObj.getLastname()); // Add Last Name
		customerData.setDob(loanObj.getDob());
		customerData.setPan(loanObj.getPan());
		customerData.setMobile(loanObj.getMobile());
		customerData.setAddress(loanObj.getAddress());
		customerData.setGuardianName(loanObj.getGuardianName());

		// Send customer data to the service
		boolean b = loanserv.sendDataToService(customerData);
		System.out.println(customerData.getFirstName());
		System.out.println("hii");
		// Return the appropriate view or redirect
		return "yes";
	}

	@RequestMapping(value = "/yesu", method = RequestMethod.GET)
	public String getApplicationForm() {
		System.out.println("");
		return "LoanData";
	}

}