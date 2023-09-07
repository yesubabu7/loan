package yesu.controllers;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import antlr.collections.List;
import yesu.models.*;
import yesu.services.CustomerService;

@Controller
public class CustomerController {

	CustomerService customerservice;

	@Autowired
	public CustomerController(CustomerService customerservice) {
		this.customerservice = customerservice;
	}

	@RequestMapping(value = "/submitLoanApplication", method = RequestMethod.POST)
	public String SubmitLoanApplication(LoanApplicationForm loanApplication) {
		customerservice.createEntries(loanApplication);
		return "login";
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.POST)

	public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model,LoanApplicationForm loanApplication) {
        if (username.equals("yesu") && password.equals("yesu")) {
            model.addAttribute("message", "Login successful!");
            model.addAttribute("customerName",loanApplication.getFirstname());
            model.addAttribute("lastName",loanApplication.getLastname());
            model.addAttribute("panNumber",loanApplication.getPan());
            model.addAttribute("nomeeRelation",loanApplication.getNomineerelation());
            java.util.List<LoanApplicant> loan =customerservice.getLoanApplicantData();
            
            model.addAttribute("cibilScore",loan.get(0).getCibilScore());
            model.addAttribute("status",loan.get(0).getStatus());
            System.out.println(loan.get(0).getCibilScore()+"loan");
            return "data"; // Redirect to a success page
        } else {
            model.addAttribute("message", "Try again. Invalid username or password.");
            return "login"; // Show the login form again
        }
    }
	
	

}