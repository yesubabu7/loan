<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details Form</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h1 class="text-center">Loan Application Form</h1><hr>
    <form action="loansubmit" method="post">
      <h2>Customer Details</h2>
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
        <input type="text" class="form-control" id="numeric-input" name="numeric-input" oninput="validateNumericInput(this)" required>
      </div>
      <hr>
      <h2>Guardian Details</h2>
      <div class="form-group">
        <label for="name">Guardian Name:</label>
        <input type="text" class="form-control" id="Guardian name" name="name">
      </div>
      <hr>
      <h2>Loan Details</h2>
      <div class="form-group">
        <label for="loan-type">Loan Type:</label>
        <select class="form-control" id="loan-type" name="loan-type">
          <option>Personal loan</option>
          <option>Gold loan</option>
          <option>Vehicle loan</option>
          <option>Home loan</option>
          <option>Mortgage loan</option>
        </select>
      </div>
      <div class="form-group">
        <label for="loan-amount">Loan Amount:</label>
        <input type="text" class="form-control" id="loan-amount" name="loan-amount" oninput="validateNumericInput(this)" required> 
      </div>
      <hr>
      <h2>Nominee Details</h2>
      <div class="form-group">
        <label for="nomineename">Nominee Name:</label>
        <input type="text" class="form-control" id="nomineename" name="nomineename">
      </div>
      <div class="form-group">
        <label for="nomineerelation">Nominee Relation:</label>
        <input type="text" class="form-control" id="nomineerelation" name="nomineerelation">
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </form>
  </div>

<!-- Include Bootstrap JS (optional, for additional functionality) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
  function validateNumericInput(inputElement) {
    // Remove non-numeric characters using a regular expression
    inputElement.value = inputElement.value.replace(/[^0-9]/g, '');

    // Display an alert message if non-numeric characters were removed
    if (inputElement.value !== inputElement.value.replace(/[^0-9]/g, '')) {
      alert("Please enter only numeric values.");
    }
  }
</script>
</body>
</html>
