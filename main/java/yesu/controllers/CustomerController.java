package yesu.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import yesu.models.Customer;
import yesu.models.CustomerUser;
import yesu.models.LoanApplicant;
import yesu.models.LoanApplicationForm;
import yesu.services.CustomerService;
import yesu.entities.ExcelGenerator;

@Controller
public class CustomerController {

	CustomerService customerservice;
	java.util.List<LoanApplicant> loan;

	@Autowired
	public CustomerController(CustomerService customerservice) {
		this.customerservice = customerservice;
	}

	// updating submitted data in 3 tables
	@RequestMapping(value = "/submitLoanApplication", method = RequestMethod.POST)
	public String SubmitLoanApplication(LoanApplicationForm loanApplication, Model model) {
		customerservice.createEntries(loanApplication);
		System.out.println(loanApplication.toString() + "name");
		System.out.println(loanApplication.toString() + "name");
		return "success"; // Redirect to a success page
	}

	// updating status in database of loan applicant table
	@RequestMapping(value = "/acceptOrReject", method = RequestMethod.POST)
	public String acceptOrReject(@RequestParam("applicantId") Long applicantId,
			@RequestParam("customerId") int customerId, @RequestParam("action") String action) {

		if (action.equals("Accept")) {
			loan = customerservice.getLoanApplicantData();

			boolean b = customerservice.loanStatusService(loan, applicantId, action);
			return "accepted";

		} else if (action.equals("Reject")) {

			boolean b1 = customerservice.loanStatusService(loan, applicantId, action);

		}
		return "rejected";
	}

	// checking for userlogin and retriving corresponding customer data of based on login userId
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userCheck(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession session) {

		List<Customer> customerIds = customerservice.getAllCustomerUsersService(username, password, session);
		session.setAttribute("customerData", customerIds);

		return "redirect:/specificUserData";
		
		
		

	}
	
	

	@RequestMapping(value = "/specificUserData", method = RequestMethod.GET)
	public String specificUserData(Model model, HttpSession session) {
		
		String key = (String) session.getAttribute("key");
		
		int userId=(int)session.getAttribute("userId");
		CustomerUser user=(CustomerUser)session.getAttribute("userObj");
		
		System.out.println(key);

		List<Customer> customerId = (List<Customer>) session.getAttribute("customerData");

		System.out.println(customerId.get(0).getFirstName() + "venuuu");
		System.out.println((String)session.getAttribute("key")+"yeususu");

		
		model.addAttribute("CustomerLists",customerId);
		loan = customerservice.getLoanApplicantData();
		model.addAttribute("loanApplicants", loan);
		
		
		if(key.equals(user.getUserKey())) {
			
			List<String> patternList=customerservice.getUrlPatterns(userId);
			
			System.out.println("working");
			return "SpecificUserData";
		}
		else {
			return "wrongUser";
		}


	}

	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminCheck(@RequestParam("username") String username, @RequestParam("password") String password,
			LoanApplicationForm loanApplication, Customer cust, Model model) {
		if (username.equals("admin") && password.equals("1234")) {
			loan = customerservice.getLoanApplicantData();
			model.addAttribute("loanList", loan);
			model.addAttribute("loanApplication", loanApplication);
			model.addAttribute("customer", cust);

			return "data";
		} else {
			return "adminCredintial";
		}

	}
	
	
	

	@RequestMapping(value = "/emiSchedule", method = RequestMethod.GET)
	public String emiScheduleChec(Model model,int customerId, LoanApplicationForm loanApplication,
			Customer cust,HttpSession session) {
		model.addAttribute("customerId",customerId);
		//model.addAttribute("loanApplication",loanApplication);
		
		
			String key = (String) session.getAttribute("key");
		
	
		int userId=(int)session.getAttribute("userId");
		CustomerUser user=(CustomerUser)session.getAttribute("userObj");
		
		
		if(key.equals(user.getUserKey())) {
			System.out.println("working");
			return "redirect:/emiSchedul";
		}
		else {
			return "wrongUser";
		}
	
	}
		// 
	
	
	

	@RequestMapping(value = "/emiSchedul", method = RequestMethod.GET)
	
	public String emiScheduleCheck(@RequestParam("customerId") int customerId, LoanApplicationForm loanApplication,
			Customer cust, Model model) {
		
	
		
		// System.out.println(loanList.get(0).getAmount() + "emiii");
		loan = customerservice.getLoanApplicantData();
		for (LoanApplicant loan : loan) {
			if (loan.getCustomerId() == customerId) {
				model.addAttribute("loanAmount", loan.getAmount());

				Date date = loan.getProcessedDate();

				// Create a SimpleDateFormat object with the desired date format
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				// Use the SimpleDateFormat to format the Date as a String
				String dateString = dateFormat.format(date);

				model.addAttribute("dateString", dateString);

				break;
			} // Stop the loop once a matching customer ID is found

		}

		model.addAttribute("loanList", loan);
		model.addAttribute("customerId", customerId);

		return "emi";
	}
	
	
	

	@RequestMapping(value = "/emiScheduleSave", method = RequestMethod.POST)
	public String saveEmiSchedule(@RequestParam("loanId") String loneAppId,
			@RequestParam("MonthlyEmi") String emiPerMonth, @RequestParam("customerId") String customerId,
			@RequestParam("emiStartDate") String emiStartDate,
			@RequestParam("annualInterestRate") String annualInterestRate,
			@RequestParam("monthlyInterestRate") String monthlyInterestRate,
			@RequestParam("numberOfPayments") String numberOfPayments,
			@RequestParam("repayableAmount") String repayableAmount, @RequestParam("loanAmount") String loanAmount,
			Model model) {

		model.addAttribute("loneAppId", loneAppId);
		model.addAttribute("emiPerMonth", emiPerMonth);
		model.addAttribute("customerId", customerId);
		model.addAttribute("emiStartDate", emiStartDate);

		model.addAttribute("annualInterestRate", annualInterestRate);
		model.addAttribute("monthlyInterestRate", monthlyInterestRate);
		model.addAttribute("numberOfPayments", numberOfPayments);
		model.addAttribute("repayableAmount", repayableAmount);
		model.addAttribute("loanAmount", loanAmount);
		System.out.println(loneAppId + "icotroolbasejj");

		boolean b = customerservice.emiScheduleDataService(loneAppId, emiPerMonth, customerId, emiStartDate,
				annualInterestRate, monthlyInterestRate, numberOfPayments, repayableAmount, loanAmount);

		// boolean b=customerservice.();
		System.out.println(emiPerMonth + "ijj");
		System.out.println(repayableAmount);
		return "emiScheduleDisplay"; // Redirect to a success page
	}

	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
	public void downloadExcel(HttpServletResponse response) throws IOException {
		List<LoanApplicant> lapp = customerservice.getLoanApplicantData();
		Workbook workbook = ExcelGenerator.generateExcel(lapp);

		// Set the response headers for Excel download
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=loan_applicants.xlsx");

		// Write the workbook to the response output stream
		workbook.write(response.getOutputStream());
		workbook.close();
	}

}
