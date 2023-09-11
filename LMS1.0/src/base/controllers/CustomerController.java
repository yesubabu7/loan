package base.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import base.models.Customer;
import base.models.LoanApplicant;
import base.models.LoanApplicationForm;
import base.services.CustomerService;
import base.utils.ExcelGenerator;

@Controller
public class CustomerController {

	CustomerService customerservice;
	java.util.List<LoanApplicant> loan;

	@Autowired
	public CustomerController(CustomerService customerservice) {
		this.customerservice = customerservice;
	}

	@RequestMapping(value = "/submitLoanApplication", method = RequestMethod.POST)
	public String SubmitLoanApplication(LoanApplicationForm loanApplication, Model model) {
		customerservice.createEntries(loanApplication);

		System.out.println(loanApplication.toString() + "name");
		model.addAttribute("message", "Login successful!");
		model.addAttribute("customerName", loanApplication.getFirstname());
		model.addAttribute("lastName", loanApplication.getLastname());
		model.addAttribute("panNumber", loanApplication.getPan());
		model.addAttribute("nomineeRelation", loanApplication.getNomineerelation());

		System.out.println(loanApplication.toString() + "name");
		return "success"; // Redirect to a success page

	}

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

	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)

	public String userCheck(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) {
		loan = customerservice.getLoanApplicantData();

		model.addAttribute("loanApplicants", loan);

		List<Customer> customerIds = customerservice.getAllCustomerUsersService(username, password);

		model.addAttribute("CustomerLists", customerIds);

		return "SpecificUserData";

	}

	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)

	public String adminCheck(@RequestParam("username") String username, @RequestParam("password") String password,
			LoanApplicationForm loanApplication, Customer cust, Model model) {
		if (username.equals("yesu") && password.equals("Yesu babu7")) {
			loan = customerservice.getLoanApplicantData();
			model.addAttribute("loanList", loan);
			model.addAttribute("loanApplication", loanApplication);
			model.addAttribute("customer", cust);

			model.addAttribute("cibilScore", loan.get(0).getCibilScore());
			model.addAttribute("status", loan.get(0).getStatus());

			return "data";
		} else {
			return "adminCredintial";
		}

	}

	@RequestMapping(value = "/emiSchedule", method = RequestMethod.POST)

	public String emiScheduleCheck(@RequestParam("customerId") int customerId, LoanApplicationForm loanApplication,
			Customer cust, Model model) {
		// System.out.println(loanList.get(0).getAmount() + "emiii");
		loan = customerservice.getLoanApplicantData();
		for (LoanApplicant loan : loan) {
			if (loan.getCustomerId() == customerId) {
				model.addAttribute("loanAmount", loan.getAmount()); // Set the loan amount as an attribute
				break; // Stop the loop once a matching customer ID is found
			}
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
