<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMI Eligibility Check</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

input[type="text"]:focus {
	border-color: #007bff;
	outline: none;
}

input[type="button"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 4px;
	font-size: 16px;
}

input[type="button"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<center>
		<h2>EMI Eligibility Check</h2>
	</center>
	<div class="container">
		<div class="form-group">
			<label for="annualIncome">Annual Income:</label> <input type="text"
				id="annualIncome" placeholder="Enter your annual income"
				onchange="calculateDisposableIncome()">
			<div class="form-group">
				<label for="loanAmount">Loan Amount:</label> <input type="text"
					id="loanAmount" placeholder="Enter the loan amount">
			</div>
			<div class="form-group">
				<label for="numberOfYears">Number of Years:</label> <input
					type="text" id="numberOfYears"
					placeholder="Enter the number of years"
					onchange="rateOfInterest()">
			</div>
			<div class="form-group">
				<label id="disposableIncomeLabel">Disposable Income:</label> <span
					id="disposableIncomeValue">-</span>
			</div>
			<div class="form-group">
				<label for="rateOfInterest">Rate of Interest:</label> <span
					id="rateOfInterest">-</span>
			</div>
			<div class="form-group">
				<label for="total">Total:</label> <span id="totalValue">-</span>
			</div>
			<div class="form-group">
				<label id="emiLabel">EMI:</label> <span id="emiValue">-</span>
			</div>
			
			<button onclick="checkEligibility()">Check Eligibility</button>

			<div id="eligibilityLabel">Eligibility Result:</div>
			<div id="eligibilityResult">-</div>
		</div>

			<script>
				// JavaScript to calculate and display Disposable Income
				function calculateDisposableIncome() {
					// Get the value from the annual income field
					const annualIncome = parseFloat(document
							.getElementById('annualIncome').value);

					// Calculate Disposable Income 
					const monthlyIncome = annualIncome / 12;
					const disposableIncome = (monthlyIncome * 0.4);

					// Display the Disposable Income in the text box
					document.getElementById('disposableIncomeValue').textContent = disposableIncome;
				}

				function rateOfInterest() {
					const numberOfYears = parseFloat(document
							.getElementById('numberOfYears').value);

					let roi;

					if (numberOfYears <= 5) {
						roi = 5;
					}

					else if (numberOfYears <= 10) {
						roi = 10;
					}

					else if (numberOfYears <= 15) {
						roi = 15;
					}

					else if (numberOfYears <= 20) {
						roi = 20;
					}

					document.getElementById('rateOfInterest').textContent = roi + '%';
					
					const loanAmount = parseFloat(document
							.getElementById('loanAmount').value);
					const rateOfInterest = roi;

					// Calculate Total
					const total = loanAmount + (loanAmount * numberOfYears * rateOfInterest / 100);
					document.getElementById('totalValue').textContent = total;

					// Calculate EMI
					const n = numberOfYears * 12; // Number of months
					const emi = total / n;
					document.getElementById('emiValue').textContent = emi;

				}
				
				function checkEligibility() {
					const emi = parseFloat(document.getElementById('emiValue').textContent);
					const disposableIncome = parseFloat(document.getElementById('disposableIncomeValue').textContent);

					const eligibilityResult = document.getElementById('eligibilityResult');

					if (emi < disposableIncome) {
						eligibilityResult.textContent = 'You are Eligible for the loan';
						eligibilityResult.className = ''; // Remove any previous class
					} else {
						eligibilityResult.textContent = 'You are Not Eligible for the loan';
						eligibilityResult.className = 'not-eligible'; // Add the "not-eligible" class
					}
				}
				
				

			</script>
</body>
</html>