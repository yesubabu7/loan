<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer EMI Schedule</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include custom CSS for styling -->
    <link rel="stylesheet" href="path-to-your-custom-css-file.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h3 class="text-center">Customer EMI Schedule</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>EMI Amount</th>
                                <th>EMI Start Date</th>
                               
                                <!-- Add placeholders for request parameters -->
                                <th>Loan ID:</th>
                                <th>Monthly EMI: </th>
                                
                                
                                <th>Annual Interest Rate:</th>
                                <th>Monthly Interest Rate:</th>
                                
                                <th>Repayable Amount:</th>

                                <!-- End placeholders -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${customerId}</td>
                                <td>${emiPerMonth}</td>
                                <td>${emiStartDate}</td>
                                
                                <td>${loneAppId}</td>
                                <td>${emiPerMonth}</td>
                                <td>${annualInterestRate}</td>
                                 <td>${monthlyInterestRate}</td>
                                
                                <td> ${repayableAmount}</td>
                                
                                
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer text-center">
                <a href="/successPage" class="btn btn-primary">Back to Home</a>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>