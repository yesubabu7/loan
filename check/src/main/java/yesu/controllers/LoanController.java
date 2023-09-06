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

	

	@RequestMapping(value = "/yesu", method = RequestMethod.GET)
	public String getApplicationForm() {
		System.out.println("");
		return "LoanData";
	}
	
	
	@RequestMapping(value = "/babu", method = RequestMethod.POST)
	public String getApplicationFor(LoanApplicationForm loanObj) {
		System.out.println("hii"+loanObj.getFirstname());
		
		return "yes";
		
		
	}
	

}