<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Application Form</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-control {
            background-color: transparent;
            border: none;
            border-bottom: 1px solid #ccc;
            border-radius: 0;
            box-shadow: none;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Loan Application Form</h1>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link active" id="customer-details-tab" data-toggle="tab" href="#customer-details" role="tab" aria-controls="customer-details" aria-selected="true">Customer Details</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="loan-details-tab" data-toggle="tab" href="#loan-details" role="tab" aria-controls="loan-details" aria-selected="false">Loan Details</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="nominee-details-tab" data-toggle="tab" href="#nominee-details" role="tab" aria-controls="nominee-details" aria-selected="false">Nominee Details</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="preview-tab" data-toggle="tab" href="#preview" role="tab" aria-controls="preview" aria-selected="false">Preview</a>
        </li>
    </ul>
    <form action="submitLoanApplication" method="post">
        <div class="tab-content" id="myTabContent">
            <!-- Customer Details Tab -->
            <div class="tab-pane fade show active" id="customer-details" role="tabpanel" aria-labelledby="customer-details-tab">
                <!-- Customer Details Form Fields -->
                <div class="form-group">
                    <label for="firstname">First Name:</label>
                    <input type="text" class="form-control" id="firstname" name="firstname">
                </div>
                <div class="form-group">
                    <label for="lastname">Last Name:</label>
                    <input type="text" class="form-control" id="lastname" name="lastname">
                </div>
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" class="form-control" id="dob" name="dob">
                </div>
                <div class="form-group">
                    <label for="pan">PAN Number:</label>
                    <input type="text" class="form-control" id="pan" name="pan">
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile Number:</label>
                    <input type="text" class="form-control" id="mobile" name="mobile">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea class="form-control" id="address" name="address" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <label for="guardianname">Guardian Name:</label>
                    <input type="text" class="form-control" id="guardianname" name="guardianName">
                </div>

                <!-- "Next" button to move to the next tab -->
                <button type="button" class="btn btn-primary" id="next-customer-details">Next</button>
                <hr>
            </div>
            <!-- Loan Details Tab -->
            <div class="tab-pane fade" id="loan-details" role="tabpanel" aria-labelledby="loan-details-tab">
                <!-- Loan Details Form Fields -->
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
                <script>
                    function calculateEMI() {
                        // Get loan amount and loan duration from inputs
                        const loanAmount = parseFloat(document.getElementById("loanamount").value);
                        const loanDuration = parseInt(document.getElementById("noOfMonths").value);

                        // Calculate EMI (assuming a fixed annual interest rate)
                        const annualInterestRate = 12; // Example: 12% annual interest rate
                        const monthlyInterestRate = annualInterestRate / 12 / 100; // Monthly interest rate
                        const numberOfPayments = loanDuration;
                        const EMI = (loanAmount * monthlyInterestRate) / (1 - Math.pow(1 + monthlyInterestRate, -numberOfPayments));

                        // Display the calculated EMI in the input field
                        document.getElementById("emi").value = EMI.toFixed(2); // Display EMI with 2 decimal places
                    }
                </script>

                <!-- "Previous" and "Next" buttons to navigate between tabs -->
                <button type="button" class="btn btn-secondary" id="previous-loan-details">Previous</button>
                <button type="button" class="btn btn-primary" id="next-loan-details">Next</button>
                <hr>
            </div>
            <!-- Nominee Details Tab -->
            <div class="tab-pane fade" id="nominee-details" role="tabpanel" aria-labelledby="nominee-details-tab">
                <!-- Nominee Details Form Fields -->
                <div class="form-group">
                    <label for="nomineename">Nominee Name:</label>
                    <input type="text" class="form-control" id="nomineename" name="nomineename">
                </div>
                <div class="form-group">
                    <label for="nomineerelation">Nominee Relation:</label>
                    <input type="text" class="form-control" id="nomineerelation" name="nomineerelation">
                </div>

                <!-- "Previous" and "Next" buttons to navigate between tabs -->
                <button type="button" class="btn btn-secondary" id="previous-nominee-details">Previous</button>
                <button type="button" class="btn btn-primary" id="next-nominee-details">Next</button>
                <hr>
            </div>
            <!-- Preview Tab -->
            <div class="tab-pane fade" id="preview" role="tabpanel" aria-labelledby="preview-tab">
                <!-- Display the user-entered data in the Preview tab -->
                <div id="preview-content">
                    <!-- This will be populated with user data via JavaScript -->
                </div>

                <!-- "Submit" button to submit the form -->
                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                <!-- "Previous" button to go back to the previous tab -->
                <div class="text-center mt-3">
                    <button type="button" class="btn btn-secondary" id="previous-preview">Previous</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Include Bootstrap JS and jQuery (optional, for tab functionality) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function () {
    // Create an object to store form data
    const formData = {};

    // Handle "Next" button clicks for each tab
    $('#next-customer-details').click(function () {
        // Retrieve and store customer details
        formData.firstname = $('#firstname').val();
        formData.lastname = $('#lastname').val();
        formData.dob = $('#dob').val();
        formData.pan = $('#pan').val();
        formData.mobile = $('#mobile').val();
        formData.address = $('#address').val();
        formData.guardianname = $('#guardianname').val();

        $('#loan-details-tab').tab('show'); // Switch to the "Loan Details" tab
    });

    $('#next-loan-details').click(function () {
        // Retrieve and store loan details
        formData.loantype = $('#loantype').val();
        formData.loanamount = $('#loanamount').val();

        $('#nominee-details-tab').tab('show'); // Switch to the "Nominee Details" tab
    });

    $('#next-nominee-details').click(function () {
        // Retrieve and store nominee details
        formData.nomineename = $('#nomineename').val();
        formData.nomineeRelation = $('#nomineerelation').val();

        // Build the HTML for displaying form data in the "Preview" tab
        const previewContent = `
            <h2>Preview</h2>
            <p><strong>First Name:</strong> ${formData.firstname}</p>
            <p><strong>Last Name:</strong> ${formData.lastname}</p>
            <p><strong>Date of Birth:</strong> ${formData.dob}</p>
            <p><strong>PAN Number:</strong> ${formData.pan}</p>
            <p><strong>Mobile Number:</strong> ${formData.mobile}</p>
            <p><strong>Address:</strong> ${formData.address}</p>
            <p><strong>Guardian Name:</strong> ${formData.guardianname}</p>
            <p><strong>Loan Type:</strong> ${formData.loantype}</p>
            <p><strong>Loan Amount:</strong> ${formData.loanamount}</p>
            <p><strong>Nominee Name:</strong> ${formData.nomineename}</p>
            <p><strong>Nominee Relation:</strong> ${formData.nomineeRelation}</p>
        `;

        // Display the form data in the "Preview" tab
        //$('#preview-content').html(previewContent);

        $('#preview-tab').tab('show'); // Switch to the "Preview" tab
    });

    // Handle "Previous" button clicks for each tab
    $('#previous-loan-details').click(function () {
        $('#customer-details-tab').tab('show'); // Switch back to the "Customer Details" tab
    });

    $('#previous-nominee-details').click(function () {
        $('#loan-details-tab').tab('show'); // Switch back to the "Loan Details" tab
    });

    $('#previous-preview').click(function () {
        $('#nominee-details-tab').tab('show'); // Switch back to the "Nominee Details" tab
    });
});
</script>
</body>
</html>