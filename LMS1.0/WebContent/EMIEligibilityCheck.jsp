<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EMI Eligibility Check</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
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
            font-weight: bold;
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

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        #result {
            font-weight: bold;
            margin-top: 20px;
            font-size: 18px;
        }

        .not-eligible {
            color: red;
        }
    </style>
</head>
<body>
    <center>
        <h2>EMI Eligibility Check</h2>
    </center>
    <div class="container">
        <div class="form-group">
            <label for="annualIncome">Annual Income:</label>
            <input type="text" id="annualIncome" placeholder="Enter your annual income" oninput="updateResult()">
        </div>
        <div class="form-group">
            <label for="loanAmount">Loan Amount:</label>
            <input type="text" id="loanAmount" placeholder="Enter the loan amount" oninput="updateResult()">
        </div>
        <div class="form-group">
            <label for="numberOfYears">Number of Years:</label>
            <input type="text" id="numberOfYears" placeholder="Enter the number of years" oninput="updateResult()">
        </div>
        <div class="form-group">
            <label id="disposableIncomeLabel">Disposable Income:</label>
            <span id="disposableIncomeValue">-</span>
        </div>
        <div class="form-group">
            <label for="rateOfInterest">Rate of Interest:</label>
            <span id="rateOfInterest">-</span>
        </div>
        <div class="form-group">
            <label for="total">Total:</label>
            <span id="totalValue">-</span>
        </div>
        <div class="form-group">
            <label id="emiLabel">EMI:</label>
            <span id="emiValue">-</span>
        </div>
        <button class="btn btn-primary" onclick="checkEligibility()">Check Eligibility</button>
        <div id="result">Eligibility Result: -</div>
    </div>

    <script>
        function updateResult() {
            // Get values from input fields
            const annualIncome = parseFloat(document.getElementById('annualIncome').value);
            const loanAmount = parseFloat(document.getElementById('loanAmount').value);
            const numberOfYears = parseFloat(document.getElementById('numberOfYears').value);

            // Calculate disposable income
            const monthlyIncome = annualIncome / 12;
            const disposableIncome = (monthlyIncome * 0.4);

            // Calculate rate of interest
            let roi;
            if (numberOfYears <= 5) {
                roi = 5;
            } else if (numberOfYears <= 10) {
                roi = 10;
            } else if (numberOfYears <= 15) {
                roi = 15;
            } else if (numberOfYears <= 20) {
                roi = 20;
            }

            // Calculate total and EMI
            const total = loanAmount + (loanAmount * numberOfYears * roi / 100);
            const n = numberOfYears * 12;
            const emi = total / n;

            // Update values in the UI
            document.getElementById('disposableIncomeValue').textContent = disposableIncome.toFixed(2);
            document.getElementById('rateOfInterest').textContent = roi + '%';
            document.getElementById('totalValue').textContent = total.toFixed(2);
            document.getElementById('emiValue').textContent = emi.toFixed(2);
        }

        function checkEligibility() {
            // Get values from the UI
            const emi = parseFloat(document.getElementById('emiValue').textContent);
            const disposableIncome = parseFloat(document.getElementById('disposableIncomeValue').textContent);

            // Check eligibility and update result
            const eligibilityResult = document.getElementById('result');
            if (emi < disposableIncome) {
                eligibilityResult.textContent = 'Eligibility Result: You are Eligible for the loan';
                eligibilityResult.className = '';
            } else {
                eligibilityResult.textContent = 'Eligibility Result: You are Not Eligible for the loan';
                eligibilityResult.className = 'not-eligible';
            }
        }

        // Initial calculation when the page loads
        updateResult();
    </script>
</body>
</html>
