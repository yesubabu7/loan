<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.ParseException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EMI Schedule</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>EMI Schedule</h1>

        <table class="table table-striped">
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>EMI Amount </th>
            <th>EMI Start Date</th>
            <th>Loan Amount</th>
            <th>No of Months</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${loanList}" var="loan">
            <c:if test="${loan.customerId == customerId}">
                <!-- Calculate EMI schedules here -->
                <c:set var="emiAmount" value="${loan.amount / loan.noOfMonths}" />
                <c:set var="emiStartDate" value="${loan.applicationDate}" />
                
                <c:set var="l" value="${loan.id}"/>

                <tr>
                    <td>${loan.customerId}</td>
                    <td>${emiAmount}</td>
                    <td>${emiStartDate}</td>
                    <td>${loan.amount}</td>
                    <td>${loan.noOfMonths}</td>
                </tr>

                <!-- JavaScript code to increment the date by one month -->
                <script>
                    var emiStartDateMillis = Date.parse('${emiStartDate}');
                    var noOfMonths = ${loan.noOfMonths};
                    
                    

                    // Loop to calculate and print EMI dates
                    for (var i = 0; i < noOfMonths - 1; i++) {
                        emiStartDateMillis += 30 * 24 * 60 * 60 * 1000; // Add 30 days
                        var emiStartDate = new Date(emiStartDateMillis);
                        emiStartDate = emiStartDate.toISOString().slice(0, 10); // Format as YYYY-MM-DD

                        var emiAmount = ${emiAmount};
                        var loanAmount = ${loan.amount};

                        // Output EMI details
                        document.write("<tr>");
                        document.write("<td>${loan.customerId}</td>");
                        document.write("<td>" + emiAmount.toFixed(2) + "</td>");
                        document.write("<td>" + emiStartDate + "</td>");
                        document.write("<td>" + loanAmount.toFixed(2) + "</td>");
                        document.write("<td>" + noOfMonths + "</td>");
                        document.write("</tr>");
                    }
                </script>
            </c:if>
        </c:forEach>
    </tbody>
</table>
                
        <!-- Loan Details Form Fields -->
        <form action="emiScheduleSave" method="post">
            <input type="hidden" id="customerId" name="customerId" value="${customerId}">
            <input type="hidden" id="emiStartDate" name="emiStartDate" value="${emiStartDate}">
            <input type="hidden" id="annualInterestRate" name="annualInterestRate">
			<input type="hidden" id="monthlyInterestRate" name="monthlyInterestRate">
			<input type="hidden" id="numberOfPayments" name="numberOfPayments">
			<input type="hidden" id="repayableAmount" name="repayableAmount">
            <input type="hidden" id="hiddenLoanAmount" name="loanAmount">
            <input type="hidden" id="loneId" name="loanId" value="${l}">
            <input type="hidden" id="emif" name="MonthlyEmi">
          
            
            
            
            
            
            <div class="form-group">
                <label for="loantype">Loan Type:</label>
                <select class="form-control" id="loantype" name="loanType">
                    <option>Personal loan</option>
                    <option>Gold loan</option>
                    <option>Vehicle loan</option>
                    <option>Home loan</option>
                    <option>Mortgage loan</option>
                </select>
            </div>
            <div class="form-group">
                <label for="loanamount">Loan Amount:</label>
                <input type="text" class="form-control" id="loanamount" name="loanAmount" oninput="calculateEMI()" required>
            </div>
            <div class="form-group">
                <label for="noOfMonths">No of Months:</label>
                <select class="form-control" id="noOfMonths" name="noOfMonths" onchange="calculateEMI()" required>
                    <option value="3">3 months</option>
                    <option value="6">6 months</option>
                    <option value="9">9 months</option>
                    <option value="12">12 months</option>
                    <option value="24">24 months</option>
                </select>
            </div>
            <div class="form-group">
                <label for="emi">Monthly EMI:</label>
                <input type="text" class="form-control" id="emi" readonly>
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

       <!-- Your HTML and JSP code -->

<script>
    function calculateEMI() {
        // Get loan amount and loan duration from inputs
        const loanAmount = parseFloat(document.getElementById("loanamount").value);
        const loanDuration = parseInt(document.getElementById("noOfMonths").value);
        
        var loanAmoun = ${loanAmount}; // Use JSP expression to insert the value

        // Now you can use the loanAmount in your JavaScript code
        console.log("Loan Amount: " + loanAmoun);

        if (loanAmount > loanAmoun) {
            // Show a pop-up alert if entered amount is greater than loanAmoun
            alert("Loan amount exceeds the maximum allowed.");
        } else {
            // Calculate EMI only if entered amount is less than or equal to loanAmoun
            const annualInterestRate = 12; // Example: 12% annual interest rate
            const monthlyInterestRate = annualInterestRate / 12 / 100; // Monthly interest rate
            const numberOfPayments = loanDuration;
            const EMI = (loanAmount * monthlyInterestRate) / (1 - Math.pow(1 + monthlyInterestRate, -numberOfPayments));

            // Calculate repayable amount
            const repayableAmount = EMI * numberOfPayments;

            // Set the values of the hidden input fields
            document.getElementById("emi").value = EMI.toFixed(2);
            document.getElementById("emif").value = EMI.toFixed(2);

            document.getElementById("annualInterestRate").value = annualInterestRate;
            document.getElementById("monthlyInterestRate").value = monthlyInterestRate.toFixed(6); // You can adjust the number of decimal places
            document.getElementById("numberOfPayments").value = numberOfPayments;
            document.getElementById("hiddenLoanAmount").value = loanAmount;
            document.getElementById("repayableAmount").value = repayableAmount.toFixed(2); // Display repayable amount with 2 decimal places
        }
    }
</script>

<!-- Your HTML and JSP code continues -->

    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>