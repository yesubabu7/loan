<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Application Form</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    </ul>
    <form action="babu" method="post">
        <div class="tab-content" id="myTabContent">
            <!-- Customer Details Tab -->
            <div class="tab-pane fade show active" id="customer-details" role="tabpanel" aria-labelledby="customer-details-tab">
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
        <label for="numeric-input">Enter a Number:</label>
        <input type="text" class="form-control" id="numeric-input" name="numericinput" oninput="validateNumericInput(this)" required>
      </div>
      <div class="form-group">
        <label for="nomineerelation">guardian name:</label>
        <input type="text" class="form-control" id=" guardianname" name="name">
      </div>
      
      <hr>
                <!-- Customer Details fields -->
                <!-- Add your input fields here -->
            </div>
            <!-- Loan Details Tab -->
            <div class="tab-pane fade" id="loan-details" role="tabpanel" aria-labelledby="loan-details-tab">
               <div class="form-group">
        <label for="loan-type">Loan Type:</label>
        <select class="form-control" id="loan-type" name="loantype">
          <option>Personal loan</option>
          <option>Gold loan</option>
          <option>Vehicle loan</option>
          <option>Home loan</option>
          <option>Mortgage loan</option>
        </select>
      </div>
      <div class="form-group">
        <label for="loan-amount">Loan Amount:</label>
        <input type="text" class="form-control" id="loan-amount" name="loanamount" oninput="validateNumericInput(this)" required> 
      </div>
      <hr>
                <!-- Loan Details fields -->
                <!-- Add your input fields here -->
            </div>
            <!-- Nominee Details Tab -->
            <div class="tab-pane fade" id="nominee-details" role="tabpanel" aria-labelledby="nominee-details-tab">
                <div class="form-group">
        <label for="nomineename">Nominee Name:</label>
        <input type="text" class="form-control" id="nomineename" name="nomineename">
      </div>
      <div class="form-group">
        <label for="nomineerelation">Nominee Relation:</label>
        <input type="text" class="form-control" id="nomineerelation" name="nomineerelation">
      </div>
     
      
     
            </div>
        </div>
        <!-- Submit Button -->
        <div class="text-center mt-3">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>

<!-- Include Bootstrap JS and jQuery (optional, for tab functionality) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
